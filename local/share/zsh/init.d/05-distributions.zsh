# check for intel opt package
if [[ -d /opt/intel/vtune_amplifier ]]; then
	# Add quiet flag to shut up that annoying message
	source /opt/intel/vtune_amplifier/amplxe-vars.sh "quiet"
fi

if [[ $(lsb_release -is) == "CentOS" ]]; then
  #
  # CentOS specific features
  #

  # check for alternative git
  [[ -f /opt/rh/rh-git29/enable ]] && source /opt/rh/rh-git29/enable
  [[ -f /opt/rh/rh-python36/enable ]] && source /opt/rh/rh-python36/enable
fi
