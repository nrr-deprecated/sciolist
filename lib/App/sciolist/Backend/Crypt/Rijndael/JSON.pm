package App::sciolist::Backend::Crypt::Rijndael::JSON;

use strictures;
use Moose;

use Crypt::CBC;
use Data::Serializer;
use IO::All;
use IO::File::Combinators;
use Try::Tiny;

=head1 NAME

App::sciolist::Backend::Crypt::Rijndael::JSON

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use IO::File::Combinators;

    my $foo = IO::File::Combinators->new();
    ...

=head1 SUBROUTINES/METHODS

=cut

has 'serializer' => (
	is => 'ro',
);

has 'filename' => (
	is => 'rw',
);

sub BUILD
{
	my ($self) = @_;

	$self->serializer(Data::Serializer->new(
		serializer => 'JSON',
		digester => 'SHA1',
		cipher => 'Rijndael',
		portable => 1,
		encoding => 'b64',
		compress => 1,
	));
}

sub __scrub_hidden_keys
{
	my ($elements_aref) = @_;

	my @scrubbed_elements = map {
		my $element = $_;

		my %scrubbed_element = map {
			my $key = $_;
			($key => $element->{$key})
		}
		grep {
			my $key = $_;
			$key !~ /^\+/
		} keys %{$element};

		\%scrubbed_element;
	} @{$elements_aref};

	return \@scrubbed_elements;
}

sub __serialize
{
	my ($self) = @_;
}

sub __deserialize
{
	my ($self) = @_;
}

sub __load_all_keys
{
	my ($self) = @_;

	return io($self->filename);
}

sub __store_all_keys
{
	my ($self) = @_;

	return ($self->serialize > io($self->filename));
}

sub __instantiate_crypt_cbc
{
        my ($self, $secret_key) = @_;

        return Crypt::CBC->new(
                '-key' => $secret_key,
                '-cipher' => 'Rijndael'
        );
}

sub __encrypt
{
	my ($self, $secret_key, $plaintext) = @_;

	return _instantiate_crypt_cbc($secret_key)->encrypt($plaintext);
}

sub __decrypt
{
	my ($self, $secret_key, $ciphertext) = @_;

	return _instantiate_crypt_cbc($secret_key)->decrypt($ciphertext);
}

sub match_keys
{
	my ($self, $patterns) = @_;
}

sub match_scrubbed_keys
{
	my ($self, $patterns) = @_;

	return $self->__scrub_hidden_keys($self->match_keys($patterns));
}

=head1 AUTHOR

Nathaniel Reindl, C<< <nrr at corvidae.org> >>

=head1 BUGS

Bugs? Hopefully, none, but if there are any, send me mail.

This distribution needs more meaningful tests.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc IO::File::Combinators

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=IO-File-Combinators>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/IO-File-Combinators>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/IO-File-Combinators>

=item * Search CPAN

L<http://search.cpan.org/dist/IO-File-Combinators/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2012 Nathaniel Reindl.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

__PACKAGE__->meta->make_immutable; # End of IO::File::Combinators
