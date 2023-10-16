# Create local user accounts for the participants of the AWS POC.
# Each account will need some ssh key so users can login.
class aws_poc::bbp_users () {
  notify { 'print_node_type':
    message => "node_type is currently ${::node_type}",
  }

  $bbp_users = [
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
      'shell'              => '/bin/bash',
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
      'sudo_on_compute'    => true,
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
    {
      'name'               => 'heeren',
      'public_key'         => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICCwlGHR/vz8esSOTMtXT0qnO7zg+kjPJYicxjyryO3h heeren@bbd-fsczyl3',
      'sudo_on_bastion'    => false,
      'create_on_compute'  => true,
      'sudo_on_compute'    => false,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => true,
      'uid'                => 1013,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'grabinsk',
      'public_key'         => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGKRXj2BuiD0EU4f3UhQxsWd5VbENRmkcZZlYb/j/EoK',
      'sudo_on_bastion'    => false,
      'create_on_compute'  => true,
      'sudo_on_compute'    => false,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => false,
      'uid'                => 1014,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'ivaska',
      'public_key'         => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0+0u4HRr2E8JXZVW8x2upa0ZRcx/RW4seZWFK1Bk/9WKSOkMyCNozblvvZE3w1U/ndNFgZSk+zgdOyTc3He8tU0cVyKKG15gugCXAsx1TyfcHCKRBmtT7rf/Ab7/r1NTKAjz9zG5tddFQOuIX3Mn0CR5v7ICqnw8la7loG9a4x9+gx7rIUP7DBdXdsW2bt8RWDcE31NluHmG1mytaI1rDgQcagz9skbzJC7dJTwT100Tci3tGZXERU7PknwiFOOgtP31rmYUFHFru2IyPnrZ4Vqrc5jOvWjtDdBrgy3JadK9cjQwqb2Yw71MjhVIVR8tGucMnebdauOoacM6Xmn9R ivaska@bluebrain',
      'sudo_on_bastion'    => false,
      'create_on_compute'  => true,
      'sudo_on_compute'    => false,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => false,
      'uid'                => 1015,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'bbp-workflow-sa',
      'public_key'         => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0+0u4HRr2E8JXZVW8x2upa0ZRcx/RW4seZWFK1Bk/9WKSOkMyCNozblvvZE3w1U/ndNFgZSk+zgdOyTc3He8tU0cVyKKG15gugCXAsx1TyfcHCKRBmtT7rf/Ab7/r1NTKAjz9zG5tddFQOuIX3Mn0CR5v7ICqnw8la7loG9a4x9+gx7rIUP7DBdXdsW2bt8RWDcE31NluHmG1mytaI1rDgQcagz9skbzJC7dJTwT100Tci3tGZXERU7PknwiFOOgtP31rmYUFHFru2IyPnrZ4Vqrc5jOvWjtDdBrgy3JadK9cjQwqb2Yw71MjhVIVR8tGucMnebdauOoacM6Xmn9R ivaska@bluebrain',
      'sudo_on_bastion'    => false,
      'create_on_compute'  => false,
      'sudo_on_compute'    => false,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => false,
      'uid'                => 1016,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'agarner',
      'public_key'         => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDqOoT/0acCCgQJpc2GUpRQszbjCu3T/wTF+u75sYHgBVLcI5FSE1dlepZEUAdkJLthDrAX+QYac+3bByRZpgJrMeIU8xQjX++udaVvCprBUKagSlUN3oxGl4JSWRMvybzEYxV9QU7xiPJ4XYpXzkTpIuQC+TKylNZtKx9ixrJ2NHD1YGcwAL43B7jLC2lWSsS62m0oMQfZPHxCYGJq0xTtAjq9N9e9B5I2o7Ig1bAGVjRKSK8LdP5JPGoCILv2Wa6fEhFASOCcNbiJg+hXR/YxzDn7IdjJU0CENorPuvZk+7qWDZ07LA9lte/ESXv9BPlb5KkDKgSZ8Cvb2qWxh84/OYqQm251zqS5/ppjUs75q1MrqgFxbf+esRvR59b2B5/nFNV5UPaEBOYwYzLskfDZQ9/xA+v5g0DBR89HAqh2WyhBjUuEg7aS23/Kqj88P6HJTO/ODMpHpGtMiqFzQyqQHlrj+lI/MKdxgPmhRULcwxJ2vlkY24rEjkA6oxq9CqM= agarner@bbd-1w2mlh3',
      'sudo_on_bastion'    => true,
      'create_on_compute'  => true,
      'sudo_on_compute'    => true,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => true,
      'uid'                => 1017,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'pigueira',
      'public_key'         => 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPBdCyCV8hkvVzMdJjFw7UkOlbO9ldLxfEPqUSP+nwvy',
      'sudo_on_bastion'    => true,
      'create_on_compute'  => true,
      'sudo_on_compute'    => true,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => true,
      'uid'                => 1018,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'danielfr',
      'public_key'         => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCmYehUxUHM6RkLCHqvV4tsd7n2RspH3xATM7TIH6IF5TsiF4nBKk//FsdB6U5XJ4KMQTQpWTswRFwVyOgfSCYaGY9RGRZV+54ufqXkXwrvnF3p1CkMNvimFe4zFAsnxs5Uc3PXN3QKtsNrVx4Xt9KyEj5LyYuMKoBbQkgVB8hsvOa+jJQV7HtBqioECaXTz6NOkjDYkzsLc1lU8ldk4YMrbX846c41lVdTssVNlL8tnRH+onUuGYe0JZecm2EU/72N1gJXbT5FPBIfmLLAX8onlUtarFcQRa2CyuPd0pIv5GDcBmD2Z0otKH3eZXPBW5bwB3/BLHSiSFcyMmjAiotBkp0AgPBXzaVbsXUSnH92VvfUaCnM754Z+En9uq+7IxgBgtlBg3o75RuVuAuMB7A5zPXGNc3HUs0y9xvzjhMsCDHveUws35qGJoFBR+v3sdfTSfdl/fu2YYprVxSBVtuq8unTO5MNUShVkOaq7M1Ed7yrsFGfC7vHzpydQeD5L3FKSuRr+om003ZlCprNR3CsKKTQvaDdIk8Ur9PQgOw2rxLWhPN8wyagugOSdPhZ4c0ClMOXZe72iQPIEhpMK5dMoNnTLVXHdG8ZY5+FMgctqF/e6pdZn21wGyd629iH/r7WGNsx7eqbajhkF9OWQpP5Oar2wT0/t8KbmPo6nSuvWQ== danielfr@epfl',
      'sudo_on_bastion'    => true,
      'create_on_compute'  => true,
      'sudo_on_compute'    => true,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => true,
      'uid'                => 1019,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'acfleury',
      'public_key'         => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDGMR9HxLSiu8/7Lhij+0yT1kGIzLLXosyoOi1MiF/mENrTR863ekNlH6AfIsOjRPCTGLct5x2au+6X2D5xuQ7THQUl7xQ+JX5rJsMIIIynWBScbjVTOzWZm43J1eqGF+CoiCF7PjqTbRYk/BQ2ZDUgM+fDZ/1TKTqGJ8m1YoCtIDx5D01TkOzRvyZH/4g6SFxpQmHAyQX7lK5AK7uMRc3TnAohjjKMVdkfsj+mkj67ebRUnrLjGOAJhuawB/h+ZLZ+IP5E5h3Loh7tHtwiir6Xb/YZmO1ct663gNYrlzmEEgIl6uRELGFlPJTCHrvbbDUj7CVBzEKewQTHU7WLSC1UaUkiG+lxrFTv1DpD4Zc3zqBaPN1J+/jJ8Rpem+NyebJVAeRR5yQinujVzwxFzGBMylCSSXpcau1dw+O4k48YxtRrWc1BE4394QjJ0tWXAQd7T2dCRSye+QlAlGYXL8nCgrLK5wQ8D/NCNjFqaVdpe9XgnakHW7OgQs1UVqdQPY11Cw9fZ9Av7VKlfVmE0HAdJCPt9gH1eJb/yrhytynbmuRFv1DLiBZyB3/iMFe0shqT48yo7ipwD5hHc9e0pri8qGgTLkDP/Q+8BCAnIkNFFf0tgongNXzd7zUxw1X8k+QeN3LNno4oDGbUSQS0OV1jbwDoJLGeuoC3LkJr/u1nPw== acfleury@bbd-3yxwrb3',
      'sudo_on_bastion'    => false,
      'create_on_compute'  => true,
      'sudo_on_compute'    => false,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => false,
      'uid'                => 1020,
      'shell'              => '/bin/bash',
    },
    {
      'name'               => 'podhajsk',
      'public_key'         => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAs3rWWl4AitIQvsx89Z9RH1ktvIVQtCi0E8e7MVRJIcAAvO3A+fIrDP+2lr2j413ycPQDQfSjRlI4q/QllzBWO9M/WRFxOhoyNiQHQRoRMin978eBwev3V8eOgNinvQvNrjHX2JMec0lUiKg6Ik/KLWkbuf7Oij9S5oHyUNl3yTIj2CtII1q3TW95jHmfo6ZMqyyOWQM79NkeC9dMv8jVpw+SwCCWQ3+M0XkDKtAw9xmjV0F0CvrSWcDXwDqQMJm+xn2uzvueRDmgExTHaAzp2hFHGvk+1SWXQLqCG9nMr1zrXIA+mOBc3kmPqXh06HHzvQf5fDePOMnJ7yzJagZoA4I/rQO70gX33JaOgqr/SRgO6mUqgWUfDzRlCLKCSzFHqhFmHM6Nhgm5Nx/fzpNaaZzzqUhecIhmgyr7nZ/hrh0R/EpgqkIOkq1MQ+wRemzvNkAVdbyEZMF9D2QodzU6bVxkquDLyEronL2w3csgCRee8g8Wa8AKvmIQH19M830= podhajsk@ub',
      'sudo_on_bastion'    => false,
      'create_on_compute'  => true,
      'sudo_on_compute'    => false,
      'create_on_pcluster' => true,
      'sudo_on_pcluster'   => false,
      'uid'                => 1021,
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
    $home_dir = "/sbo/home/${user_name}"
    $shell = $person['shell']

    if (($::node_type == 'bastion') or (($::node_type == 'compute') and $create_on_compute) or (($::node_type == 'pcluster') and $create_on_pcluster)) {
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
        shell  => $shell,
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

      if ((($::node_type == 'bastion') and $sudo_on_bastion) or (($::node_type == 'compute') and $sudo_on_compute) or (($::node_type == 'pcluster') and $sudo_on_pcluster)) {
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
  # Generate users json file for Omar's parallelcluster compute node initialization script
  if ($::node_type == 'bastion') {
    file { '/sbo/home/resources':
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0700',
    }
    file { '/sbo/home/resources/users.json':
      ensure  => file,
      content => epp("${module_name}/users.json.epp", {'bbp_users' => $bbp_users}),
      owner   => 'root',
      group   => 'root',
      mode    => '0700',
    }
  }
}
