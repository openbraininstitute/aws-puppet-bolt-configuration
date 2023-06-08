class aws_poc::compute_vms_packages () {
  $packages = [ 'build-essential', 'libseccomp-dev', 'libglib2.0-dev', 'pkg-config', 'squashfs-tools', 'cryptsetup', 'runc', 'mpich', 'nfs-common', 'wget', 'curl', 'vim', 'zsh', 'bash' ]
  package { $packages:
    ensure => 'installed'
  }
  exec { 'get_singularity':
    creates => '/root/singularity-ce_3.11.3-jammy_amd64.deb',
    command => 'wget https://github.com/sylabs/singularity/releases/download/v3.11.3/singularity-ce_3.11.3-jammy_amd64.deb',
    path    => [ '/bin', '/usr/bin' ],
    cwd     => '/root',
    user    => 'root',
  }
  package { 'singularity-ce':
    ensure => 'installed',
    source => '/root/singularity-ce_3.11.3-jammy_amd64.deb',
  }
}
