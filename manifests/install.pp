# Install the ssm package
class ssm::install inherits ssm {
  case $::operatingsystem {
    'Ubuntu': {
      wget::fetch { 'ssm-agent':
        source      => "https://amazon-ssm-${::region}.s3.amazonaws.com/latest/debian_amd64/amazon-ssm-agent.deb",
        destination => '/tmp/amazon-ssm-agent.deb',
        cache_dir   => '/var/cache/wget',
      } ~>
      package { 'amazon-ssm-agent.deb':
        provider => 'dpkg',
        source   => '/tmp/amazon-ssm-agent.deb',
      }
    }
    default: { fail("The ${module_name} module is not supported on ${::osfamily}/${::operatingsystem}.") }
  }
}
