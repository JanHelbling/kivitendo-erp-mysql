package SL::Dev::File;

use strict;
use base qw(Exporter);
our @EXPORT_OK = qw(create_scanned create_uploaded create_created);
our %EXPORT_TAGS = (ALL => \@EXPORT_OK);

use SL::DB::File;

my %common_params = (
  object_id   => 1,
  object_type => 'sales_order',
);

sub create_scanned {
  my (%params) = @_;
  $params{source}    = 'scanner1';
  $params{file_type} = 'document';
  $params{file_path} = '/var/tmp/'.$params{file_name} if !$params{file_path};
  open(OUT,"> ".$params{file_path});
  print OUT $params{file_contents};
  close(OUT);
  delete $params{file_contents};
  my $file = _create_file(%params);
  unlink($params{file_path});
  return $file;
}

sub create_uploaded {
  my (%params) = @_;
  $params{source}    = 'uploaded';
  $params{file_type} = 'attachment';
  return _create_file(%params);
}

sub create_created {
  my (%params) = @_;
  $params{source}    = 'created';
  $params{file_type} = 'document';
  return _create_file(%params);
}

sub _create_file {
  my (%params) = @_;

  my $fileobj = SL::File->save(
    %common_params,
    mime_type          => 'text/plain',
    description        => 'Test File',
    file_type          => $params{file_type},
    source             => $params{source},
    file_name          => $params{file_name},
    file_contents      => $params{file_contents},
    file_path          => $params{file_path}
  );
  return $fileobj;
}

sub get_all          { SL::File->get_all         (%common_params, @_) }
sub get_all_count    { SL::File->get_all_count   (%common_params, @_) }
sub get_all_versions { SL::File->get_all_versions(%common_params, @_) }
sub delete_all       { SL::File->delete_all      (%common_params, @_) }

1;

__END__

=head1 NAME

SL::Dev::File - create file objects for testing, with minimal defaults

=head1 FUNCTIONS

=head2 C<create_scanned %PARAMS>

=head2 C<create_uploaded %PARAMS>

=head2 C<create_created %PARAMS>

=head1 AUTHOR

Martin Helmling E<lt>martin.helmling@opendynamic.deE<gt>

=cut
