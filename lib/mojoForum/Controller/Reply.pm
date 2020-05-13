package mojoForum::Controller::Reply;
use Mojo::Base 'Mojolicious::Controller';

sub show {
    my $self = shift;

    my $dbh = $self->app->{dbh};
    my $thread_id = $self->stash('id');
    
    my @thread = $dbh->resultset('Thread')->search(
        { 'me.id' => $thread_id },
        { prefetch => 'replies'}
    );

    @thread = map { { 
        thread_id => $_->id,
        title     => $_->title,
        replies   => [ map { {
                user => $_->user->full_name,
                body => $_->body 
            } } $_->replies
        ],
        author    => $_->user->full_name,
    } } @thread;

    my @replies = $dbh->resultset('Reply')->search({ thread_id => $thread_id });
    
    $self->stash(template => 'reply', thread => \@thread);
}

1;