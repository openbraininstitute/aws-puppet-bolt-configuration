class aws_poc::bastion_hosts_packages () {
  $packages = [ 'strace', 'nmap-ncat', 'nmap', 'wget', 'vim', 'tmux', 'tcpdump', 'net-tools', 'curl', 'jq' ]
  package { $packages:
    ensure => 'installed'
  }
}