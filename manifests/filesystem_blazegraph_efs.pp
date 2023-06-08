class aws_poc::filesystem_blazegraph_efs () {
  file { '/blazegraph-efs':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  mount { 'blazegraph-efs':
    name    => '/blazegraph-efs',
    ensure  => 'mounted',
    atboot  => false,
    fstype  => 'nfs',
    device  => 'blazegraph-efs.shapes-registry.org:/',
    options => 'nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport',
  }
}
