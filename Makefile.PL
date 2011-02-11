#!/usr/bin/env perl

use inc::Module::Install;

name 'App-IPtoInt';
all_from 'lib/App/IPtoInt.pm';

requires 'Scalar::Util::Numeric';
requires 'Exporter';

test_requires 'Test::Most';
test_requires 'Test::Exception';

auto_install;
WriteAll;
