# Class: ssm
# ===========================
#
# Downloads and installs the amazon-ssm-agent, i.e. the EC2 run command agent
#
# Parameters
# ----------
#
# * `region`
# The region to download the agent in. Default is undef.
#
# Examples
# --------
#
# @example
#    class { 'ssm':
#      region => 'us-east-1',
#    }
#
# Authors
# -------
#
# Todd Courtnage <todd@courtnage.ca>
#
# Copyright
# ---------
#
# Copyright 2016 Todd Courtnage
#
class ssm (
  $region     = $ssm::params::region,
) {
  include ssm::params

  if $region {
    validate_string($region)
  }

  class { 'ssm::install':
    region => $region
  }
  include ssm::service
  anchor { 'ssm::begin': } -> Class['ssm::install'] -> Class['ssm::service'] -> anchor { 'ssm::end': }
}
