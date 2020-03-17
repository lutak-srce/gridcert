# Class: gridcert
#
# This module installs host grid certificate
# and key
#
class gridcert (
  $hostcert = 'puppet:///private/gridcert/hostcert.pem',
  $hostkey  = 'puppet:///private/gridcert/hostkey.pem',
) {
  include gridcert::package
  file { '/etc/grid-security/hostcert.pem':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0444',
    source  => $hostcert,
    require => Package['ca-policy-egi-core'],
  }
  file { '/etc/grid-security/hostkey.pem':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0400',
    source  => $hostkey,
    require => Package['ca-policy-egi-core'],
  }
}
