
group { "puppet":
  ensure => "present",
}

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
  content => "Welcome to your DataBox Dev Box v0.1!"
}

Exec["/usr/bin/apt-get update -y"] -> Package <| |>
Exec["/usr/bin/apt-get upgrade -y"] -> Package <| |>


exec { "/usr/bin/apt-get update -y":
  user => "root",
  timeout => 3600,
}


exec { "/usr/bin/apt-get upgrade -y":
  user => "root",
  timeout => 3600,
}




user { "vagrant":
  ensure     => "present",
  managehome => true,
}

package { "git-core":
 ensure => installed,
}

package { "vim":
 ensure => installed,
}

package { "build-essential":
 ensure => installed,
}

package { "libopenssl-ruby":
 ensure => installed,
}

package { "subversion":
 ensure => installed,
}

package { "wget" :
  ensure => installed,
}



