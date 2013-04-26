
$Test::Class::TREC::Sender::VERSION = '0.0000.000001'; #vvery vvery beta
use lib qw( C:\johns\Dropbox\Code_Base\CPAN\Test-Class-Rig\lib );
#use lib 'C:\Users\John Scoles\Dropbox\Code_Base\CPAN\Test-Class-Rig\lib';
#           C:\Users\John Scoles\Dropbox\Code_Base\CPAN\Test-Class-Rig\lib\Test\Class);
{ package
  Test::Class::TREC::Sender;
  use Test::Class::Rig();
  use Mail::Sender;;
  use Exporter();
  @ISA = qw(Exporter Mail::Sender);
  use Data::Dumper;
  $trecrh = undef;	# holds client handle once initialized
  sub client {
    return $trecrh if $trecrh;
    my($class, $attr) = @_;
    $class .= "::trec";
    # not a 'my' since we use it above to prevent multiple clients
    #warn("end here agent $class");
    $trecrh = Test::Class::Rig::_new_trecrh($class,"Mail::Sender", {
        'Name' => 'Sender',
        'Version' => $VERSION,
        'Err'    => \my $err,
        'Errstr' => \my $errstr,
        'Attribution' => "TREC::Sender $VERSION using Test::Class::Rig by John Scoles",
        });
    return $trecrh;
}
{ package
  Test::Class::TREC::Sender::trec;
  use strict;
  sub load_agent {
    my $self = shift;
    my ($attr)= @_;
    $attr = {$attr,cookie_jar => {}, autocheck => 0};
    my $agent  = Test::Class::Rig::rig::_new_agent($self,$attr);
    return $agent;
  }
  sub ping {
    warn("this is trec ping 'Test::Class::TREC::Sender::trec'\n")
  }
} #Test::Class::TRA::Sender::tra
} #Test::Class::TRA::Sender;
1;
__END__
