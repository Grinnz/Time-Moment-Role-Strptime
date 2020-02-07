use strict;
use warnings;
use Test::More;
use Time::Moment;
use Time::Moment::Strptime;
use With::Roles;

my $class = Time::Moment->with::roles('+Strptime');

my $moment = $class->strptime('2000-01-02 03:04:05', '%Y-%m-%d %H:%M:%S');
isa_ok $moment, 'Time::Moment';
is $moment->year, 2000, 'right year';
is $moment->month, 1, 'right month';
is $moment->day_of_month, 2, 'right day of month';
is $moment->hour, 3, 'right hour';
is $moment->minute, 4, 'right minute';
is $moment->second, 5, 'right second';
is $moment->offset, 0, 'no offset';

$moment = strptime('2000-01-02 03:04:05', '%Y-%m-%d %H:%M:%S');
isa_ok $moment, 'Time::Moment';
is $moment->year, 2000, 'right year';
is $moment->month, 1, 'right month';
is $moment->day_of_month, 2, 'right day of month';
is $moment->hour, 3, 'right hour';
is $moment->minute, 4, 'right minute';
is $moment->second, 5, 'right second';
is $moment->offset, 0, 'no offset';

my $file = __FILE__;

ok !eval { $class->strptime('foo', '%Y'); 1 }, 'failed parse';
like $@, qr/\Q$file/, 'error includes right filename';

ok !eval { strptime('foo', '%Y'); 1 }, 'failed parse';
like $@, qr/\Q$file/, 'error includes right filename';

done_testing;
