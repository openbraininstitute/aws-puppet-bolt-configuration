plan aws () {
  # Prepare all targets of any groups that are listed in the inventory file
  apply_prep('all')

  # Apply some manifest to create local users on the group ssh_bastion_hosts
  apply('ssh_bastion_hosts') {
    $node_type = 'bastion'
    include aws::bastion_hosts_packages
    include aws::filesystem_compute_efs
    include aws::obi_users
    include aws::selinux
  }
  return 'done'
}
