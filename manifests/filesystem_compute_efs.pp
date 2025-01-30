class aws::filesystem_compute_efs (
  String $efs_dns_name,
) {
  file { '/sbo':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  file { '/sbo/home':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  mount { 'compute-efs':
    ensure  => 'mounted',
    name    => '/sbo/home',
    atboot  => false,
    fstype  => 'nfs',
    device  => $efs_dns_name,
    options => 'nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport',
  }
}
