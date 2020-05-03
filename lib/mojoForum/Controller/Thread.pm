package mojoForum::Controller::Thread;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub show {
    my $self = shift;

    my $dbh = $self->app->{dbh};			# Database handler
    
    # Fetch all the threads from the thread table;
    my @threads = $dbh->resultset('Thread')->search({});
    
    @threads = map { { 
        title => $_->title,
        body  => $_->body,
        user  => $_->user->first_name. ' ' . $_->user->last_name
    } } @threads;

    $self->render(
        template => 'thread',				# Template name, thread.html.ep under the templates folder.
        threads  => \@threads				# Pass thread array ref to the template
    );
}

1;