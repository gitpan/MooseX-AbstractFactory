use Test::More tests => 2;
use Test::Moose;
use Test::Exception;

BEGIN {
	package My::Test::Implementation;
	use Moose;


	has connection => (is => 'ro', isa => 'Str');

	sub tweak { 1; };

	package My::Factory;
	use MooseX::AbstractFactory;
	
	implementation_class_via sub { "My::Test::" . shift };
}

my $imp;

lives_ok { 
	$imp = My::Factory->create(
    	'Implementation',
    	{ connection => 'Type1' }
	);
} "Factory->new() doesn't die";

isa_ok($imp, "My::Test::Implementation");