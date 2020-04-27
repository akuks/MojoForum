#!/Users/ashutosh/perl5/perlbrew/perls/perl-5.28.0/bin/perl

=head1 NAME

This script is to generate the fake data for our application. This is not written perfectly
following the Perl standards. This script is quick and dirty to generate some fake data for 
our SQL tables.

NOTE:- this is wriiten using the vim and I am lazy enough to convert the default settings. 
By default tab eq 2 spaces in vim.

=cut

use strict;
use warnings;

use Text::Lorem;

my $text = Text::Lorem->new();

my $user_file   = "User.csv";
my $thread_file = "Thread.csv";
my $post_file   = "Post.csv";

open (my $ufh, '>', $user_file);
open (my $tfh, '>', $thread_file);
open (my $pfh, '>', $post_file);

my $counter = 1;
my $post_id = 1;
my $user_id = 1;

# Generate User Data
while ( $user_id <= 20 ) {
  my $first_name  = $text->words(1);
  my $middle_name = $text->words(1);
  my $last_name   = $text->words(1);
  my $email       = $first_name.'.'.$last_name.'@email.com';
  my $password    = "123456";
  
  print $ufh "$first_name, $middle_name, $last_name, $email, $password\n"; 

  $user_id++;
}

while($counter <=50) {
  my $title = $text->words(5);

	my $i = 1;

	while ($i <= 50) {
    my $p_usr = int( rand(18) ) + 1;
		my $post_body = $text->sentences(4);

		print $pfh "$post_id, $p_usr, $counter, $post_body\n";
		$i++;
		$post_id++;
	}
  
  my $user = int( rand(18) ) + 1;
  my $thread_body = $text->sentences(5);

	print $tfh "$counter, $user, $title, $thread_body\n";

	$counter++;

}
