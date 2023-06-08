# Create local user accounts for the participants of the AWS POC.
# Each account will need some ssh key so users can login.
class aws_poc::bbp_users () {
  notify { 'print_node_type':
    message => "node_type is currently ${node_type}",
  }

  $bbp_users = [
    {
      'name'               => 'kenyon',
      'public_key'         => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPWvRJ0DJf4R45xM2pf9Ok0XmP/kgFkrb+DB5gLCmmSy mike 2023 sbo aws testing',
      'sudo_on_bastion'    => true,
      'create_on_compute'  => true,
      'sudo_on_compute'    => true,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => true,
      'uid'                => 1001,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'verachte',
      'public_key'         => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCw84Bv2npIvI5l9F8KeHPbdxPhykNduYetKMzeFT6BlEN7GKeDsgP5hHjf54aYugYovEgPO6fVf9L+NVHh8NaXgOSnhXjI7r4Iz4hDkOIxHdDHk0VHXZ3aaKA3XhZteJtKXfez1PMFon/AOXSEZuou/kpyFYZdsGKpX1V6RcF8f3Xd1HmIDrFQ4i136RJZzWMgjZAdFEqLdQRk1uiN1MvsHOnCAyMBvgid7gYvmgJIJNLFlh6yQlketZDEnQuHsPO+q43GeakWQ4CF7nfJyds1PD8jjsI/Nhk8ZWDj4A5v1ULVdNqYMcVslC87PdhsuPEw+RA8zAquEq7TGZjmJqzPE9OEq0iD+sj8qq7ziPStp+JNHJdDaSeO3g08SeQiklFvvcQv5rNkh+uNKeln2lXPOgrNV8oajpYsomNKif/ORz1t9tUKbsIiWXeNnJyJrsDZlkll8xEJtbNJY2PDL47KdAdADEZZjOvNAo3L2jWDmA/swRBnZRX9yYaJ7zxmFuFpw4/KFpUhXH5kbckZ+BfjENuRdm/PUDtyyeYICpL6AFaGzMF91b2CGftfHI4Nq7D2Xf1yQcEwP4ZHymDwlAu+H247WGprYD71bCbKYDHGzIDgG8f4jL2PdbwuNZ0fIP42K334IfFRpfK0fhJ8kSkr0xT4Sdg8NeNHba6Vcg+uiQ== Dries Verachtert - mac',
      'sudo_on_bastion'    => true,
      'create_on_compute'  => true,
      'sudo_on_compute'    => true,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => true,
      'uid'                => 1002,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'awile',
      'public_key'         => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBNo9qa6OHKkstsoa2k4aPxFNZ3xXFDTofHDcxcm3NAl omar.awile@bbp_aws',
      'sudo_on_bastion'    => false,
      'create_on_compute'  => true,
      'sudo_on_compute'    => true,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => true,
      'uid'                => 1003,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'edelattr',
      'public_key'         => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAMdlSFLj4dIZosuHhNN2PvnxiNveBesnj2HuAx9EZpE36r34SYXCLngOH29Su3vjubalKK8J4mD2LG6lALrncN7B7B6LMowMtt0I/KiY0DumUv4jdho+xODhdnXEq6lGwuN7vJMRDX0srzzGkjB/v4sMHHM94hByqgXlwmmiwp2y0asZVt/GkyBMHtS1cZmRC/d0KSHW5YMzp5uDxQMUXGyxef3jQK4LpcT9E7gCgo69V+ishObz/ctHbrOor9zmyVLpB0K+7oA+hWeO1SCm84nMW8ExdqKP8TefJM42jZIcxEjEGnGacQHzbSQM9sj7yytEptOzcdPF4B2MwMVcgwKCffMl5bgq0HXMyqzpwDGm7/37fMs/ZFRxltm2A8aNlB2AD+sFVuVYSaAxTK1+o3nVKcBhbjSYD1PRjKH4xyl0/8Fm9q6/aI9km36zCR+hnlBAeKFSXFOKBXDVzIBdhZnFvsIUGjWEvYYa1YNtW6BeJWaS1Iwj6JfcquJNjPoE=',
      'sudo_on_bastion'    => false,
      'create_on_compute'  => true,
      'sudo_on_compute'    => false,
      'create_on_pcluster' => false,
      'sudo_on_pcluster'   => false,
      'uid'                => 1004,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'dbell',
      'public_key'         => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFXDpuUndoYsKAYprPQ3ulORJv0Gc48h6P8JuLPMzkw5 shinyhappydan@gmail.com',
      'sudo_on_bastion'    => false,
      'create_on_compute'  => true,
      'sudo_on_compute'    => false,
      'create_on_pcluster' => false,
      'sudo_on_pcluster'   => false,
      'uid'                => 1005,
    },
    {
      'name'               => 'magkanar',
      'public_key'         => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHdskRd816hFtV2SC01KvAtKFTq8gEfQw7ewFylGo/RO ioannis.magkanaris@epfl.ch',
      'sudo_on_bastion'    => false,
      'create_on_compute'  => true,
      'sudo_on_compute'    => true,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => true,
      'uid'                => 1006,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'kumbhar',
      'public_key'         => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ4yQxkIFJ/QVFsvLL1of5j0EeaWt5EBkZJJR7ooZBRm AWS HPC PoC Testing 2023',
      'sudo_on_bastion'    => false,
      'create_on_compute'  => true,
      'sudo_on_compute'    => true,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => true,
      'uid'                => 1007,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'srivas',
      'public_key'         => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEIlqFDPBHsNjwBGJsfoQEwLrhpNS0/J0DO2irrcvoHl AWS HPC PoC Testing 2023',
      'sudo_on_bastion'    => false,
      'create_on_compute'  => true,
      'sudo_on_compute'    => true,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => true,
      'uid'                => 1008,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'krepl',
      'public_key'         => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+TXTyvSJMLC6pI3d8KUaZD0vYv6l5WzHP/h2QdH9QbFbsR5VEfhbvd81m0A8ICXkXXtrvv/YevqM38ZaZcY9c9ZPmFd7Z2osFqRMmzZxjUgGY0RJocQwbg9evsbgMblnkdgorGZSkMbf9YDIR3GeC5wyNR/O4fNpsff+dt0cNPwfyi4ubFlnrQRGFP47T7vVbeR4gB9uyES/QavU5aFoTK1s48IiEaiLu4f+o/hlh9NywxuDlONA7HJLnA2TYu2fMc4URhli3Exit2g3nK9PGNZyOhPmdMZYmJvj5glGMOaYFI8GijWlQhNHGmBwgnN4U88IAb8j/w1nZIgfLI9BHMYDFLbLKA007KConv662xwAZVknOIs7WmII4Wv89kKYcTbKY6xPAC8e/igHZyJWorIJhzfTbxl5vLXUYNlhMqD60U0PMvlkjq2di4Hj531wTFOxtOSanC25Jv5eq8nHe+GYw4bjkcmBh06AsNOWKCWbVICPRBD03qG6wE0Z2qRE= krepl@bb-c02g10cdq6lw.epfl.ch',
      'sudo_on_bastion'    => false,
      'create_on_compute'  => true,
      'sudo_on_compute'    => false,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => false,
      'uid'                => 1009,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'matwolf',
      'public_key'         => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICByzT/43w/0uNeVPydcb/UIwtD9jsJ+FrCslA8/6O5B matwolf@bbl-1k9vhr3',
      'sudo_on_bastion'    => false,
      'create_on_compute'  => true,
      'sudo_on_compute'    => true,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => true,
      'uid'                => 1010,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'gevaert',
      'public_key'         => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBCRTRSpJMLRRk0GuIcQ/OU5fGwgX0YhIMsy/sSgdzQc gevaert@theend',
      'sudo_on_bastion'    => false,
      'create_on_compute'  => true,
      'sudo_on_compute'    => false,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => false,
      'uid'                => 1011,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'nfrank',
      'public_key'         => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJgSbMMZ1KDAuxUBxI04PqBoU6v4eoU3B6sjh0iTx864 aws',
      'sudo_on_bastion'    => false,
      'create_on_compute'  => true,
      'sudo_on_compute'    => false,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => false,
      'uid'                => 1012,
      'shell'              => '/bin/bash',
    },
  ]

  $bbp_users.each |$person| {
    $user_name = $person['name']
    $public_key = $person['public_key']
    $sudo_on_bastion = $person['sudo_on_bastion']
    $create_on_compute = $person['create_on_compute']
    $sudo_on_compute = $person['sudo_on_compute']
    $create_on_pcluster = $person['create_on_pcluster']
    $sudo_on_pcluster = $person['sudo_on_pcluster']
    $uid = $person['uid']
    $home_dir = "/compute-efs/home/${user_name}"
    $shell = $person['shell']
    
    if (($node_type == "bastion") or (($node_type == "compute") and $create_on_compute) or (($node_type == "pcluster") and $create_on_pcluster)) {
      notify { "print_user_${user_name}":
        message => "Checking ${user_name}: to be created on this node with type ${node_type}",
      }
      group { $user_name:
        ensure => present,
        gid    => $uid,
      }
      user { $user_name:
        ensure => present,
        uid    => $uid,
        home   => $home_dir,
        gid    => $uid,
        shell  => $shell,
      }
      file { "${home_dir}":
        ensure  => directory,
        owner   => $user_name,
        group   => $user_name,
        mode    => '0755',
        seltype => 'user_home_dir_t',
      }
      file { "${home_dir}/.ssh":
        ensure  => directory,
        owner   => $user_name,
        group   => $user_name,
        mode    => '0700',
        seltype => 'ssh_home_t',
      }
      file { "${home_dir}/.ssh/authorized_keys":
        ensure  => present,
        owner   => $user_name,
        group   => $user_name,
        mode    => '0700',
        seltype => 'ssh_home_t',
      }
      file_line { "ssh public key for ${user_name}":
        ensure => present,
        path   => "${home_dir}/.ssh/authorized_keys",
        line   => $public_key,
      }

      exec { "generate_ssh_keypair_for_${user_name}":
        command => "ssh-keygen -t rsa -b 4096 -C ${user_name} -f /compute-efs/home/${user_name}/.ssh/id_rsa -N ''",
        creates => "${home_dir}/.ssh/id_rsa",
        user    => $user_name,
        group   => $user_name,
        path    => ['/bin', '/usr/bin'],
      }
      
      exec { "add_public_key_to_authorized_keys_for_${user_name}":
        require => Exec["generate_ssh_keypair_for_${user_name}"],
        command => "cat ${home_dir}/.ssh/id_rsa.pub >> ${home_dir}/.ssh/authorized_keys",
        user    => $user_name,
        group   => $user_name,
        path    => ['/bin', '/usr/bin'],
      }

      if ((($node_type == "bastion") and $sudo_on_bastion) or (($node_type == "compute") and $sudo_on_compute) or (($node_type == "pcluster") and $sudo_on_pcluster)) {
        # Also give sudo
        notify { "create sudo for ${user_name}":
          message => "User ${user_name} will get sudo on node of type ${node_type}",
        }
        file { "/etc/sudoers.d/${user_name}":
          ensure  => present,
          owner   => 'root',
          group   => 'root',
          mode    => '0700',
          content => "${user_name} ALL = NOPASSWD: ALL",
        }
      } else {
        notify { "remove sudo for ${user_name}":
          message => "User ${user_name} will not get sudo on node of type ${node_type}",
        }
        file { "/etc/sudoers.d/${user_name}":
          ensure => absent,
        }
      }
    }
  }
}
