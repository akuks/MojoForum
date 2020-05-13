package mojoForum::Controller::Thread;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub show {
    my $self = shift;

    my $dbh = $self->app->{dbh};			# Database handler
    my $paginate = $self->app->{paginate};	# paginate

    my $total_threads = $dbh->resultset('Thread')->search({})->count;

    # Fetch all the threads from the thread table;
    my @threads = $dbh->resultset('Thread')->search({}, { rows => $paginate });
    
    @threads = map { { 
        title => $_->title,
        body  => $_->body,
        user  => $_->user->full_name,
        id    => $_->id
    } } @threads;
    
    $self->render(
        template => 'thread',				# Template name, thread.html.ep under the templates folder.
        threads  => \@threads,				# Pass thread array ref to the template
        total_pages => $total_threads / $paginate
    );
}

1;