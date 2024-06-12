class aws_poc::filesystem_nexus_delta_efs () {
  file { '/nexus-delta-efs':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  mount { 'nexus-delta-efs':
    ensure  => 'mounted',
    name    => '/nexus-delta-efs',
    atboot  => false,
    fstype  => 'nfs',
    device  => 'nexus-delta-efs.shapes-registry.org:/',
    options => 'nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport',
  }
}
