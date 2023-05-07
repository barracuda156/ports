# ex:ts=8 sw=4:
# $OpenBSD: Job.pm,v 1.23 2023/05/07 06:26:41 espie Exp $
#
# Copyright (c) 2010-2013 Marc Espie <espie@openbsd.org>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
use v5.36;
use DPB::Util;

# a "job" is the actual stuff a core runs at some point.
# it's mostly an abstract class here... it's organized
# as a list of tasks, with a finalization routine

package DPB::Task;
# this is used to gc resources from a task (pipes for instance)
sub end($)
{
}

sub code($self, $core)
{
	return $self->{code};
}

# no name by default, just display the object
sub name($self)
{
	return $self;
}

sub new($class, $code = undef)
{
	return bless {code => $code}, $class;
}

# TODO this should probably be called exec since we're after the fork
sub run($self, $core)
{
	&{$self->code($core)}($core->shell);
}

# one single user so far: DPB::Signature::Task
sub process($self, $core)
{
}

sub finalize($self, $core)
{
	return $core->{status} == 0;
}

sub redirect_fh($self, $fh, $log)
{
	close STDOUT;
	open STDOUT, '>&', $fh or DPB::Util->die_bang("Can't write to $log");
	close STDERR;
	open STDERR, '>&STDOUT' or DPB::Util->die_bang("bad redirect");
}

package DPB::Task::Pipe;
our @ISA =qw(DPB::Task);

sub fork($self, $core)
{
	open($self->{fh}, "-|");
}

sub end($self)
{
	close($self->{fh});
}


package DPB::Task::Fork;
our @ISA =qw(DPB::Task);
sub fork($, $)
{
	CORE::fork();
}

package DPB::Job;
sub next_task($self, $core)
{
	return shift @{$self->{tasks}};
}

sub name($self)
{
	return $self->{name};
}

sub debug_dump($self)
{
	return $self->{name};
}

sub finalize($, $)
{
}

sub watched($self, $, $)
{
	return $self->{status};
}

sub add_tasks($self, @tasks)
{
	push(@{$self->{tasks}}, @tasks);
}

sub replace_tasks($self, @tasks)
{
	$self->{tasks} = [];
	push(@{$self->{tasks}}, @tasks);
}

sub insert_tasks($self, @tasks)
{
	unshift(@{$self->{tasks}}, @tasks);
}

sub really_watch($, $)
{
}

sub new($class, $name)
{
	return bless {name => $name, status => ""}, $class;
}

sub set_status($self, $status)
{
	$self->{status} = $status;
}

sub cleanup_after_fork($self)
{
        $DB::inhibit_exit = 0;
        for my $sig (keys %SIG) {
                $SIG{$sig} = 'DEFAULT';
        }
}

package DPB::Job::Normal;
our @ISA =qw(DPB::Job);

sub new($class, $code, $endcode, $name)
{
	my $o = $class->SUPER::new($name);
	$o->{tasks} = [DPB::Task::Fork->new($code)];
	$o->{endcode} = $endcode;
	return $o;
}

sub finalize($self, $core)
{
	&{$self->{endcode}}($core);
}

# the common stuff for jobs that have a kind of watch log, e.g.,
# either fetch jobs or build jobs

package DPB::Job::Watched;
our @ISA =qw(DPB::Job::Normal);

sub kill_on_timeout($self, $diff, $core, $msg)
{
	my $to = $self->get_timeout($core);
	return $msg if !defined $to || $diff <= $to;
	local $> = 0;	# XXX switch to root, we don't know for sure which
			# user owns the pid (not really an issue)
	$core->kill(9);
	return $self->{stuck} = "KILLED: ".$self->killinfo." stuck at $msg";
}

sub killinfo($self)
{
	return $self->{current};
}

sub watched($self, $current, $core)
{
	my $w = $self->{watched};
	return "" unless defined $w;
	my $diff = $w->check_change($current);
	my $msg = '';
	if ($self->{task}->want_percent) {
		$msg .= $w->percent_message;
	}
	if ($self->{task}->want_frozen) {
		return $self->kill_on_timeout($diff, $core, 
		    $msg.$w->frozen_message($diff));
	} else {
		return $msg;
	}
}


package DPB::Job::Infinite;
our @ISA = qw(DPB::Job);
sub next_task($job, $core)
{
	return $job->{task};
}

sub new($class, $task, $name)
{
	my $o = $class->SUPER::new($name);
	$o->{task} = $task;
	return $o;
}

package DPB::Job::Pipe;
our @ISA = qw(DPB::Job);
sub new($class, $code, $name)
{
	my $o = $class->SUPER::new($name);
	$o->{tasks} = [DPB::Task::Pipe->new($code)];
	return $o;
}

1;
