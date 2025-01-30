plan aws () {
  # Prepare all targets of any groups that are listed in the inventory file
  apply_prep('all')


  $efs_dns_name_prod    = get_target('production').vars['efs_dns_name']
  $efs_dns_name_staging = get_target('staging').vars['efs_dns_name']

  # Apply some manifest to create local users on the group ssh_bastion_hosts
  apply('production') {
    $node_type = 'bastion'
    include aws::bastion_hosts_packages
    include aws::selinux

    class{ 'aws::filesystem_compute_efs':
      efs_dns_name => $efs_dns_name_prod
    }

    # configure users after EFS is mounted
    include aws::obi_users
  }

  apply('staging') {
    $node_type = 'bastion'
    include aws::bastion_hosts_packages
    include aws::selinux

    class{ 'aws::filesystem_compute_efs':
      efs_dns_name => $efs_dns_name_staging
    }

    # configure users after EFS is mounted
    include aws::obi_users
  }
  return 'done'
}
