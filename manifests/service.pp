# Ensure ssm service is running.
class ssm::service inherits ssm {
  case $::operatingsystem {
    'Ubuntu': {
      service { 'amazon-ssm-agent':
        ensure  => 'running',
        require => Class['ssm::install'],
      }
    }
    default: { fail("The ${module_name} module is not supported on ${::osfamily}/${::operatingsystem}.") }
  }
}
