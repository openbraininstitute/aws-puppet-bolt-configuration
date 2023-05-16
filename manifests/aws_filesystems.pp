class aws_poc::aws_filesystems () {
  package { 'nfs-utils':
    ensure => 'installed'
  }
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
  file { '/nexus-app-efs':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  mount { 'nexus-app-efs':
    name    => '/nexus-app-efs',
    ensure  => 'mounted',
    atboot  => false,
    fstype  => 'nfs',
    device  => 'nexus-app-efs.shapes-registry.org:/',
    options => 'nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport',
  }
  file { '/compute-efs':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  mount { 'compute-efs':
    name    => '/compute-efs',
    ensure  => 'mounted',
    atboot  => false,
    fstype  => 'nfs',
    device  => 'compute-efs.shapes-registry.org:/',
    options => 'nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport',
  }  
}
