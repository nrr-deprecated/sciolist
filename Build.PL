use common::sense;
use Module::Build;

my $build = Module::Build->new(
    dist_author => 'Nathaniel R. Reindl <nrr@corvidae.org>',
    dist_abstract =>
        'Multi-backend password/key management utility',
    module_name          => 'App::sciolist',
    license              => 'artistic',
    recursive_test_files => 1,
    create_readme        => 1,
    create_makefile_pl   => 'traditional',
    configure_requires   => { 'Module::Build' => '0', },
    build_requires       => { 'Test::More' => '0', },
    requires             => {
	'Dancer' => '0',
        'Data::Dumper'     => '0',
        'IO::Socket::INET' => '0',
        'IO::Socket::UNIX' => '0',
        'CLI::Framework'   => '0'
    },
);

$build->create_build_script();
