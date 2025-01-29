# Create local user accounts on the AWS bastion host.
# Each account will need some ssh key so users can login.
class aws::obi_users () {
  notify { 'print_node_type':
    message => "node_type is currently ${::node_type}",
  }

  $obi_users = [
    {
      'name'               => 'verachte',
      'public_key'         => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCw84Bv2npIvI5l9F8KeHPbdxPhykNduYetKMzeFT6BlEN7GKeDsgP5hHjf54aYugYovEgPO6fVf9L+NVHh8NaXgOSnhXjI7r4Iz4hDkOIxHdDHk0VHXZ3aaKA3XhZteJtKXfez1PMFon/AOXSEZuou/kpyFYZdsGKpX1V6RcF8f3Xd1HmIDrFQ4i136RJZzWMgjZAdFEqLdQRk1uiN1MvsHOnCAyMBvgid7gYvmgJIJNLFlh6yQlketZDEnQuHsPO+q43GeakWQ4CF7nfJyds1PD8jjsI/Nhk8ZWDj4A5v1ULVdNqYMcVslC87PdhsuPEw+RA8zAquEq7TGZjmJqzPE9OEq0iD+sj8qq7ziPStp+JNHJdDaSeO3g08SeQiklFvvcQv5rNkh+uNKeln2lXPOgrNV8oajpYsomNKif/ORz1t9tUKbsIiWXeNnJyJrsDZlkll8xEJtbNJY2PDL47KdAdADEZZjOvNAo3L2jWDmA/swRBnZRX9yYaJ7zxmFuFpw4/KFpUhXH5kbckZ+BfjENuRdm/PUDtyyeYICpL6AFaGzMF91b2CGftfHI4Nq7D2Xf1yQcEwP4ZHymDwlAu+H247WGprYD71bCbKYDHGzIDgG8f4jL2PdbwuNZ0fIP42K334IfFRpfK0fhJ8kSkr0xT4Sdg8NeNHba6Vcg+uiQ== Dries Verachtert - mac',
      'sudo_on_bastion'    => true,
      'uid'                => 1002,
    },
    {
      'name'               => 'krepl',
      'public_key'         => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+TXTyvSJMLC6pI3d8KUaZD0vYv6l5WzHP/h2QdH9QbFbsR5VEfhbvd81m0A8ICXkXXtrvv/YevqM38ZaZcY9c9ZPmFd7Z2osFqRMmzZxjUgGY0RJocQwbg9evsbgMblnkdgorGZSkMbf9YDIR3GeC5wyNR/O4fNpsff+dt0cNPwfyi4ubFlnrQRGFP47T7vVbeR4gB9uyES/QavU5aFoTK1s48IiEaiLu4f+o/hlh9NywxuDlONA7HJLnA2TYu2fMc4URhli3Exit2g3nK9PGNZyOhPmdMZYmJvj5glGMOaYFI8GijWlQhNHGmBwgnN4U88IAb8j/w1nZIgfLI9BHMYDFLbLKA007KConv662xwAZVknOIs7WmII4Wv89kKYcTbKY6xPAC8e/igHZyJWorIJhzfTbxl5vLXUYNlhMqD60U0PMvlkjq2di4Hj531wTFOxtOSanC25Jv5eq8nHe+GYw4bjkcmBh06AsNOWKCWbVICPRBD03qG6wE0Z2qRE= krepl@bb-c02g10cdq6lw.epfl.ch',
      'sudo_on_bastion'    => false,
      'uid'                => 1009,
    },
    {
      'name'               => 'gevaert',
      'public_key'         => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBCRTRSpJMLRRk0GuIcQ/OU5fGwgX0YhIMsy/sSgdzQc gevaert@theend',
      'sudo_on_bastion'    => false,
      'uid'                => 1011,
    },
    {
      'name'               => 'nfrank',
      'public_key'         => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJgSbMMZ1KDAuxUBxI04PqBoU6v4eoU3B6sjh0iTx864 aws',
      'sudo_on_bastion'    => false,
      'uid'                => 1012,
    },
    {
      'name'               => 'heeren',
      'public_key'         => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICCwlGHR/vz8esSOTMtXT0qnO7zg+kjPJYicxjyryO3h heeren@bbd-fsczyl3',
      'sudo_on_bastion'    => false,
      'uid'                => 1013,
    },
    {
      'name'               => 'danielfr',
      'public_key'         => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCmYehUxUHM6RkLCHqvV4tsd7n2RspH3xATM7TIH6IF5TsiF4nBKk//FsdB6U5XJ4KMQTQpWTswRFwVyOgfSCYaGY9RGRZV+54ufqXkXwrvnF3p1CkMNvimFe4zFAsnxs5Uc3PXN3QKtsNrVx4Xt9KyEj5LyYuMKoBbQkgVB8hsvOa+jJQV7HtBqioECaXTz6NOkjDYkzsLc1lU8ldk4YMrbX846c41lVdTssVNlL8tnRH+onUuGYe0JZecm2EU/72N1gJXbT5FPBIfmLLAX8onlUtarFcQRa2CyuPd0pIv5GDcBmD2Z0otKH3eZXPBW5bwB3/BLHSiSFcyMmjAiotBkp0AgPBXzaVbsXUSnH92VvfUaCnM754Z+En9uq+7IxgBgtlBg3o75RuVuAuMB7A5zPXGNc3HUs0y9xvzjhMsCDHveUws35qGJoFBR+v3sdfTSfdl/fu2YYprVxSBVtuq8unTO5MNUShVkOaq7M1Ed7yrsFGfC7vHzpydQeD5L3FKSuRr+om003ZlCprNR3CsKKTQvaDdIk8Ur9PQgOw2rxLWhPN8wyagugOSdPhZ4c0ClMOXZe72iQPIEhpMK5dMoNnTLVXHdG8ZY5+FMgctqF/e6pdZn21wGyd629iH/r7WGNsx7eqbajhkF9OWQpP5Oar2wT0/t8KbmPo6nSuvWQ== danielfr@epfl',
      'sudo_on_bastion'    => true,
      'uid'                => 1019,
    },
    {
      'name'               => 'ficarell',
      'public_key'         => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDTQQu/jmTIhy7MjfoOlW6pqgjKpUa4r86UKlME7Tu0/l46xcmvnu64SvE99rLNUolNXdbv7PcnW/yzZpQery4ZCUtAzHLpPZQomu5v3AGa60JGXHRqtKu6ogv83VLgbsoEOPW50+WeBxJJYdrHq6kwc4AwFHlG1L8OsAj/b41HH530nAH7ytFcd8Z5JbUeXbvvT4Eouu+BUuSxvdq5Heq4G4OoYTLc9k+Eby4rjzTv1y5cn6nEmkX/fxhEs6ac+QIyyx1DyUD4LuSRvnpmUrSDcpVtHu61vJzTktVqbylU7J5GcBV5RDoAoOm/WnS3thNbWa3Y//x57OVgUCYd9JLM83zLbanaVPGwIoO77uWfmarKOnmLC7ycdr1B9ZPtZog0HyOh7qT7zXe4PCos3BVEUkQbOfXtXpU9pfJ8ce6LG6T+CUdkc8BHBlxVitsT2m+0kQr9LbilBJcw1sWyHMv5N984q9TQfz3IuX1sMtnVMEVe45TNT6M7goBJqdJsaatiunN7B19EVw1mtvQ58wOhHuA9GBIFWbQ5KJb1vK/JXsyjeE1CCa2oKoIAJOJgxwPnmvjGBnuIiP61b+fRo8UVfwXW+KdD1drgoC4y2D8NfdfvPip/atFnPKciWL9NK6Ur1CXNHilrDeKVTG4T2Pk1/iE0FdCTblmvoCO7No92VQ== gianluca.ficarelli@epfl.ch',
      'sudo_on_bastion'    => false,
      'uid'                => 1027,
    },
    {
      'name'               => 'getta',
      'public_key'         => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHxrb0uKrJ0XqWA7lFLSNjk9OpfuB34q1wucUrhVOZAD pavlo.getta@openbraininstitute.org'
      'sudo_on_bastion'    => false,
      'uid'                => 1028,
    },
    {
      'name'               => 'saxena',
      'public_key'         => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC9xeUD/FhL9egEXZdY7RL67AIYu7O7Lv9LM5SHUh7zJMgYzj4e/gV2maH7HiKXUcyRiYPCj0wFdEsoit1bv4BX48haURKeyt3ITZJ3nQcg8bbtLaTxhGM4YJePuhPTy09J49rifAiWxPqMmydepntBoXrUyjal60UBYHfrsh4iL9xk2isfDEjIHViO+8vY2sToy8VfMjqk3m6gD/YwMV+8LZXHsiOfpoqsz3qvN6vJL1TBW92MIZDZBpaCpvUS9ioaUCniSKoAspxdzpF9J0oHdHO5YNI2Bey021yupTuPiVjM7L7uEQ3KUxgx0LQ4HyFIzCS0G7seIUWmHEEgW7SNiDN2zXtB7Y4Y7fXByoHwm4vdDrFQVvpwr950L4fCZVOoSVnlSt4DK8OI4O+Oh4tOwlwaLE9JQw4eIcViN69rtzE2eWDLq2W6LtHBY8205Oa0Q0RY16NCH39ACprzKdS7qfXJC1aK7UddW85ijoQ7fQzqv/y8B7CgNjcX/EkuhZ7VXC+Pqtg88Jgq0Gvc7DLm/ah1vnIDdRHogOWs7qsNwXYdpVFUpZ/7yovB3VNcVD5JY6oBDI/yLivY47kEY41+MUF9+sINIfEap8CZzyR9E99cdnfFs6N8onq2YDJamEHRMFxiIAYISbkEmiyHc2gdknoR1C2bGYmdGRxihmZwLQ== dinikasaxenas@gmail.com',
      'sudo_on_bastion'    => false,
      'uid'                => 1029,
    },
    {
      'name'               => 'bilal',
      'public_key'         => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/2LjrMo7vBtjWx5lqCry4CGHa26MjcruWYTwnOf8etCrJX/M1cejObRO2lVAajRaFmdAyLXrmZET3lzaAVKRkzIzmZMrDf3XsMp/iDvyl20UtZVf6ieCdwXn1Hxdw5D0bQsAJkdkH2JqAPGRcAbRy7E9zXlxzpT4zAlm6Jy/ILLyECEWckcAg1ON0GPJjXSI9Ss+Ol7LtEt3n/qi4hGFHYLyGciiB3lnHjS/lZNpsqKOGCh2pannyhLypRiz6WKrhFq2mpezP9Gke1FU9pqxfrGuGyEEUBg+NcRfYP91fkcscpjVTl8wePNpOevHf9q7WN8meyDJ39Qes5gWMihFWlbA2dGd6Y3gEQJB7YBIeR5i+Qg9FXVittls5rcuVS5MfPoET6eX/QPoH4iMMQO56VVhF9n6h9tCicNWl+pBzRU0UvY/1aAwJUDuBeyPwjY27hxuOrUjnKLDq4ojUw9K7Ucyq63ObIXvyJ42MXCuNOqvU+4neHH73JmbQ/jzVBFFfPc+WJlHHcT8sSUaUWdZF+7TOSvUcL08ft1gHau+yec8aSIAFtCxPxDqKxFYDTJYNESOSGLyRhCJzCN3otTN2WjIfIDgRf+ZGlXKM7E2HAjs2bnr2i2eB9mtES57jnhjKBMLG+cY3728gSNRfV1tgvi3OD6eZ3HckZ+4b8qVS1Q== meddah@bb-pggwpwnhqj.epfl.ch',
      'sudo_on_bastion'    => false,
      'uid'                => 1031,
    },
    {
      'name'               => 'bergsma',
      'public_key'         => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEtJ5W8bXdNWUtgxXTT2F5HsnMquuPIpnmsEPzrHgTEY aws',
      'sudo_on_bastion'    => false,
      'uid'                => 1035,
    }
  ]

  $obi_users.each |$person| {
    $user_name = $person['name']
    $public_key = $person['public_key']
    $sudo_on_bastion = $person['sudo_on_bastion']
    $uid = $person['uid']
    $home_dir = "/sbo/home/${user_name}"

    if ($::node_type == 'bastion') {
      notify { "print_user_${user_name}":
        message => "Checking ${user_name}: to be created on this node with type ${::node_type}",
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
        shell  => "/bin/bash",
      }
      file { $home_dir:
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
        command => "ssh-keygen -t rsa -b 4096 -C ${user_name} -f /${home_dir}/.ssh/id_rsa -N ''",
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

      if ($::node_type == 'bastion' and $sudo_on_bastion) {
        # Also give sudo
        notify { "create sudo for ${user_name}":
          message => "User ${user_name} will get sudo on node of type ${::node_type}",
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
          message => "User ${user_name} will not get sudo on node of type ${::node_type}",
        }
        file { "/etc/sudoers.d/${user_name}":
          ensure => absent,
        }
      }
    }
  }
}
