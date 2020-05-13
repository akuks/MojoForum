use utf8;
package mojoForum::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

mojoForum::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=item * L<DBIx::Class::EncodedColumn>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn");

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 first_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 25

=head2 middle_name

  data_type: 'varchar'
  is_nullable: 1
  size: 25

=head2 last_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 25

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 password

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "first_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 25 },
  "middle_name",
  { data_type => "varchar", is_nullable => 1, size => 25 },
  "last_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 25 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "password",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 replies

Type: has_many

Related object: L<mojoForum::Schema::Result::Reply>

=cut

__PACKAGE__->has_many(
  "replies",
  "mojoForum::Schema::Result::Reply",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 threads

Type: has_many

Related object: L<mojoForum::Schema::Result::Thread>

=cut

__PACKAGE__->has_many(
  "threads",
  "mojoForum::Schema::Result::Thread",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-04-28 21:43:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SCr+ToZGYR0+s9ZnqCLjZQ

sub full_name {
    my $self = shift;
    return $self->first_name . ' ' . $self->last_name;
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
