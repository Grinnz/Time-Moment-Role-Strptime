package Time::Moment::Strptime;

use Exporter 'import';
use Time::Moment;
use With::Roles;

our $VERSION = '0.002';

our @EXPORT = 'strptime';

my $class = Time::Moment->with::roles('+Strptime');

sub strptime { $class->strptime(@_) }

1;

=head1 NAME

Time::Moment::Strptime - strptime constructor for Time::Moment

=head1 SYNOPSIS

  use Time::Moment::Strptime;

  my $moment = strptime('2019-06-01', '%Y-%m-%d');

=head1 DESCRIPTION

This module provides a L</strptime> function, which uses
L<Time::Moment::Role::Strptime> to parse the input string according to a
L<strptime(3)> format, and returns a constructed L<Time::Moment> object.

By default the returned L<Time::Moment> object is in UTC (possibly adjusted
by a parsed offset); to interpret the parsed time in another time zone, you can
use L<Time::Moment::Role::TimeZone>:

  use Time::Moment::Strptime;
  use With::Roles;

  my $moment = strptime($input, $format)->with::roles('+TimeZone')
    ->with_system_offset_same_local;

  use DateTime::TimeZone::Olson 'olson_tz';
  my $tz = olson_tz('America/Los_Angeles');
  my $moment = strptime($input, $format)->with::roles('+TimeZone')
    ->with_time_zone_offset_same_local($tz);

=head1 FUNCTIONS

The L</"strptime"> function is exported by default.

=head2 strptime

  my $moment = strptime($input, $format);

Parses the input string according to the L<strptime(3)> format, and returns a
L<Time::Moment> object in UTC. Throws an exception on parsing or out-of-bounds
errors.

Currently, L<Time::Piece> is used to implement C<strptime> portably, but this
is considered an implementation detail.

=head1 BUGS

Report any issues on the public bugtracker.

=head1 AUTHOR

Dan Book <dbook@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2019 by Dan Book.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=head1 SEE ALSO

L<Time::Moment>, L<Time::Moment::Role::Strptime>
