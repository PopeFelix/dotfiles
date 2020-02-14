use common::sense;

package Test;
use OpenPlatform::MASA::Test::Class;
use Class::XSAccessor {accessors => [qw/sport year use_db/]};


package main;
use Test::More;
my @sports = qw/baseball basketball football hockey/;
my @use_db = qw(0 1);
my $year   = 2019;

for my $sport (@sports) {
  for my $use_db (@use_db) {
    my $name = qq{$sport (${\($use_db ? 'with' : 'without')} DB)};
    subtest $name => sub {
      Test->new(sport => $sport, use_db => $use_db, year => $year)->runtests;
    };
  }
}
