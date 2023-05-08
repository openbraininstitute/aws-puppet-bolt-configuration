# Create local user accounts for the participants of the AWS POC.
# Each account will need some ssh key so users can login.
class aws_poc::bbp_users () {
  notify { 'print_only_hpc':
    message => "only_hpc is currently ${only_hpc}",
  }

  $bbp_users = [
    {
      'name'       => 'kenyon',
      'public_key' => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPWvRJ0DJf4R45xM2pf9Ok0XmP/kgFkrb+DB5gLCmmSy mike 2023 sbo aws testing',
      'hpc'        => false,
    },
    {
      'name'       => 'verachte',
      'public_key' => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCw84Bv2npIvI5l9F8KeHPbdxPhykNduYetKMzeFT6BlEN7GKeDsgP5hHjf54aYugYovEgPO6fVf9L+NVHh8NaXgOSnhXjI7r4Iz4hDkOIxHdDHk0VHXZ3aaKA3XhZteJtKXfez1PMFon/AOXSEZuou/kpyFYZdsGKpX1V6RcF8f3Xd1HmIDrFQ4i136RJZzWMgjZAdFEqLdQRk1uiN1MvsHOnCAyMBvgid7gYvmgJIJNLFlh6yQlketZDEnQuHsPO+q43GeakWQ4CF7nfJyds1PD8jjsI/Nhk8ZWDj4A5v1ULVdNqYMcVslC87PdhsuPEw+RA8zAquEq7TGZjmJqzPE9OEq0iD+sj8qq7ziPStp+JNHJdDaSeO3g08SeQiklFvvcQv5rNkh+uNKeln2lXPOgrNV8oajpYsomNKif/ORz1t9tUKbsIiWXeNnJyJrsDZlkll8xEJtbNJY2PDL47KdAdADEZZjOvNAo3L2jWDmA/swRBnZRX9yYaJ7zxmFuFpw4/KFpUhXH5kbckZ+BfjENuRdm/PUDtyyeYICpL6AFaGzMF91b2CGftfHI4Nq7D2Xf1yQcEwP4ZHymDwlAu+H247WGprYD71bCbKYDHGzIDgG8f4jL2PdbwuNZ0fIP42K334IfFRpfK0fhJ8kSkr0xT4Sdg8NeNHba6Vcg+uiQ== Dries Verachtert - mac',
      'hpc'        => true,
    },
    {
      'name'       => 'awile',
      'public_key' => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBNo9qa6OHKkstsoa2k4aPxFNZ3xXFDTofHDcxcm3NAl omar.awile@bbp_aws',
      'hpc'        => true,
    },
    {
      'name'       => 'edelattr',
      'public_key' => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAMdlSFLj4dIZosuHhNN2PvnxiNveBesnj2HuAx9EZpE36r34SYXCLngOH29Su3vjubalKK8J4mD2LG6lALrncN7B7B6LMowMtt0I/KiY0DumUv4jdho+xODhdnXEq6lGwuN7vJMRDX0srzzGkjB/v4sMHHM94hByqgXlwmmiwp2y0asZVt/GkyBMHtS1cZmRC/d0KSHW5YMzp5uDxQMUXGyxef3jQK4LpcT9E7gCgo69V+ishObz/ctHbrOor9zmyVLpB0K+7oA+hWeO1SCm84nMW8ExdqKP8TefJM42jZIcxEjEGnGacQHzbSQM9sj7yytEptOzcdPF4B2MwMVcgwKCffMl5bgq0HXMyqzpwDGm7/37fMs/ZFRxltm2A8aNlB2AD+sFVuVYSaAxTK1+o3nVKcBhbjSYD1PRjKH4xyl0/8Fm9q6/aI9km36zCR+hnlBAeKFSXFOKBXDVzIBdhZnFvsIUGjWEvYYa1YNtW6BeJWaS1Iwj6JfcquJNjPoE=',
      'hpc'        => false,
    },
    {
      'name'       => 'dbell',
      'public_key' => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFXDpuUndoYsKAYprPQ3ulORJv0Gc48h6P8JuLPMzkw5 shinyhappydan@gmail.com',
      'hpc'        => false,
    },
    {
      'name'       => 'magkanar',
      'public_key' => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHdskRd816hFtV2SC01KvAtKFTq8gEfQw7ewFylGo/RO ioannis.magkanaris@epfl.ch',
      'hpc'        => true,
    },
  ]

  $bbp_users.each |$person| {
    $user_name = $person['name']
    $public_key = $person['public_key']
    $user_is_hpc = $person['hpc']
    
    if (!($only_hpc) or ($only_hpc and $user_is_hpc)) {
      notify { "print_user_${user_name}":
        message => "Checking ${user_name}",
      }
      user { $user_name:
        ensure => present,
      }
      file { "/home/${user_name}":
        ensure => directory,
        owner  => $user_name,
        group  => $user_name,
        mode   => '0755',
      }
      file { "/home/${user_name}/.ssh":
        ensure => directory,
        owner  => $user_name,
        group  => $user_name,
        mode   => '0700',
      }
      file { "/home/${user_name}/.ssh/authorized_keys":
        ensure => present,
        owner  => $user_name,
        group  => $user_name,
        mode   => '0700',
      }
      file_line { "ssh public key for ${user_name}":
        ensure => present,
        path   => "/home/${user_name}/.ssh/authorized_keys",
        line   => $public_key,
      }
      if ($only_hpc) {
        # Also give sudo
        file { "/etc/sudoers.d/${user_name}":
          ensure  => present,
          owner   => 'root',
          group   => 'root',
          mode    => '0700',
          content => "${user_name} ALL = NOPASSWD: ALL",
        }
      }
    }
  }
}
