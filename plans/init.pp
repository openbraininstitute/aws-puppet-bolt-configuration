plan aws_poc () {
  out::message("Hello from plan aws_poc")

  # Prepare all targets of any groups that are listed in the inventory file
  apply_prep('all')

  # Apply some manifest to create local users on the group ssh_bastion_hosts
  apply('ssh_bastion_hosts') {
    $only_hpc = false
    include aws_poc::bbp_users
  }
  apply('hpc_compute_vms') {
    $only_hpc = true
    include aws_poc::bbp_users
  }
  return "done"
}
