package UnRTF;
use Modern::Perl;
use Moose;

has file => (is => 'rw', isa => 'Str', required => 1);

sub unrtf {
  open STDERR, '>', '/dev/null';
  open(UNRTF, "unrtf @_ |") or die $!;
  local $/ = undef;
  my $OUTPUT = <UNRTF>;
  close UNRTF;
  $OUTPUT;
}

sub convert {
  my ($self, %args) = @_;
  unrtf("--$args{format}", $self->file);
}

1;
