package App::sciolist::Agent::RPC::Handler::Key::Add;

use feature qw[ say ];
use strictures;

use JSON;

use base qw[ RPC::Serialized::Handler ];

sub invoke
{
	my ($self, $backend, %parameters) = @_;

	return encode_json({
		backend => $backend,
		%parameters
	});
}

1;
