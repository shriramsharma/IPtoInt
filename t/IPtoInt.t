#!/usr/bin/env perl -T

use strict;
use warnings;

use Test::Most qw/no_plan/;
use Test::Exception;

use App::IPtoInt qw/convert/;

throws_ok { convert('abcdefghijk') } qr/Invalid IP/, "Invalid IP caught";

is convert('0.255.234.123'), 16771707,
  'IP address 0.255.234.123 coverted to integer 16771707';

is convert('0.255.234.123'), 16771707,
  'IP address 0.255.234.123 coverted to integer 16771707';

is convert('255.255.255.255'), 4294967295,
  'IP address 255.255.255.255 coverted to integer 4294967295';
1;
