# Ensure ssm service is running.
class ssm::service inherits ssm {
  case $::operatingsystem {
    'Ubuntu': {
      service { 'amazon-ssm-agent':
        ensure  => 'running',
        require => Class['ssm::install'],
        enable  => true,
      }
    }
    'Amazon', 'RedHat', 'CentOS': {
      notify { 'cannot manage service':
        message => "The amazon-ssm-agent service connot be managed by puppet on ${::operatingsystem}"
      }
    }
    default: { fail("The ${module_name} module is not supported on ${::osfamily}/${::operatingsystem}.") }
  }
}
