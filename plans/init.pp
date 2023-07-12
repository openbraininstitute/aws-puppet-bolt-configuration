plan aws_poc () {
  out::message('Hello from plan aws_poc')

  # Prepare all targets of any groups that are listed in the inventory file
  apply_prep('all')

  # Apply some manifest to create local users on the group ssh_bastion_hosts
  apply('ssh_bastion_hosts') {
    $node_type = 'bastion'
    include aws_poc::bastion_hosts_packages
    include aws_poc::filesystem_blazegraph_efs
    include aws_poc::filesystem_compute_efs
    include aws_poc::filesystem_nexus_app_efs
    include aws_poc::bbp_users
    include aws_poc::selinux
  }
  # Also creates users on the HPC compute VMs
  apply('hpc_compute_vms') {
    $node_type = 'compute'
    include aws_poc::filesystem_compute_efs
    include aws_poc::compute_vms_packages
    include aws_poc::bbp_users
  }
#  apply('pcluster_host') {
#    $node_type = 'pcluster'
#    include aws_poc::filesystem_compute_efs
#    include aws_poc::bbp_users
#  }
  return 'done'
}
