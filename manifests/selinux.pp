class aws::selinux () {
  # reason: the homedirs are on an EFS filesystem which does not support selinux contexts
  # => ssh could not read the authorized_keys files.
  class { 'selinux':
    mode => 'disabled',
    type => 'targeted',
  }
}
