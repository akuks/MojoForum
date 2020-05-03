package mojoForum;
use Mojo::Base 'Mojolicious';

use mojoForum::Model::DB;

# This method will run once at server start
sub startup {
    my $self = shift;

    # Load configuration from hash returned by config file
    my $config = $self->plugin('Config');

    # Configure the application
    $self->secrets( $config->{secrets} );

    $self->_db_handler();

    # Router
    my $r = $self->routes;

    # Normal route to controller
    $r->get('/')->to(controller => 'Thread', action => 'show');
}

sub _db_handler {
    my $self = shift;

    $self->{dbh} = mojoForum::Model::DB->new();

    return $self;
}

1;
