package App::sciolist::Application;
use base qw[ CLI::Framework::Application ];
use Modern::Perl;

sub command_alias {
}

sub command_map {
    return (
	'agent' => '',
	'key' => '',
	'source' => '',
	);
}

sub init {
}

sub option_spec {
}

sub usage_text {
}

sub validate_options {
}

END {
}

1;
