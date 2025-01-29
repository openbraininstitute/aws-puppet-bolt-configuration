class aws::filesystem_compute_efs () {
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
    device  => 'fs-0c2a2f3ad1b1beeca.efs.us-east-1.amazonaws.com:/',
    options => 'nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport',
  }
}
