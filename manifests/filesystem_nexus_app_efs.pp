class aws_poc::filesystem_nexus_app_efs () {
  file { '/nexus-app-efs':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  mount { 'nexus-app-efs':
    ensure  => 'mounted',
    name    => '/nexus-app-efs',
    atboot  => false,
    fstype  => 'nfs',
    device  => 'nexus-app-efs.shapes-registry.org:/',
    options => 'nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport',
  }
}
