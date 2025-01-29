class aws::bastion_hosts_packages () {
  $packages = [ 'strace', 'nmap-ncat', 'nmap', 'wget', 'vim', 'tmux', 'tcpdump', 'net-tools', 'curl', 'jq', 'nfs-utils', 'zsh', 'bash', 'postgresql' ]
  package { $packages:
    ensure => 'installed'
  }
}
