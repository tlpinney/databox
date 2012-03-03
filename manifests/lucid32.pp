
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

package { "python-software-properties":
   ensure => installed,
}

exec { "/usr/bin/add-apt-repository ppa:chris-lea/node.js":
       require => Package['python-software-properties']
}


exec { "/usr/bin/apt-get update -y && true":
  user => "root",
  timeout => 3600,
  require => Exec["/usr/bin/add-apt-repository ppa:chris-lea/node.js"] 
}


package { "nodejs": 
    ensure => installed,
    require => Exec["/usr/bin/apt-get update -y && true"]
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


package { "wget" :
  ensure => installed,
}



