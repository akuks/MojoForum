package mojoForum::Model::DB;

use mojoForum::Schema;
use DBIx::Class ();

use strict;

my ($schema_class, $connect_info);

BEGIN {
    $schema_class = 'mojoForum::Schema';
    $connect_info = {
        dsn      => 'dbi:mysql:mojoForum',
        user     => 'root',
        password => '',
    };
}

sub new {
    return __PACKAGE__->config( $schema_class, $connect_info );
}

sub config {
    my $class = shift;
    
    my $self = {
        schema       => shift,
        connect_info => shift,
    };
    
    my $dbh = $self->{schema}->connect(
        $self->{connect_info}->{dsn}, 
        $self->{connect_info}->{user}, 
        $self->{connect_info}->{password}
    );

    return $dbh;
}

1;