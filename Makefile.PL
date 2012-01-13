
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "AbstractFactory behaviour as a Moose extension",
  "AUTHOR" => "Mike Whitaker <mike\@altrion.org>, Caleb Cushing <xenoterracide\@gmail.com>",
  "BUILD_REQUIRES" => {
    "English" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "Test::Exception" => 0,
    "Test::Moose" => 0,
    "Test::More" => "0.88",
    "Test::Requires" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MooseX-AbstractFactory",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "MooseX::AbstractFactory",
  "PREREQ_PM" => {
    "Class::Load" => 0,
    "Moose" => 0,
    "Moose::Autobox" => 0,
    "Moose::Exporter" => 0,
    "Moose::Meta::Class" => 0,
    "Moose::Role" => 0,
    "Try::Tiny" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.003003",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



