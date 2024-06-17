class aws_poc::filesystem_blazegraph_main_efs () {
  file { '/blazegraph-main-efs':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  mount { 'blazegraph-main-efs':
    ensure  => 'mounted',
    name    => '/blazegraph-main-efs',
    atboot  => false,
    fstype  => 'nfs',
    device  => 'blazegraph-main-efs.shapes-registry.org:/',
    options => 'nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport',
  }
}
