# check for intel opt package
if [[ -d /opt/intel/parallel_studio_xe_2018/ ]]; then
	source /opt/intel/parallel_studio_xe_2018/amplxe-vars.sh > /dev/null 2>&1 
fi

if [[ $(lsb_release -is) == "CentOS" ]]; then
  #
  # CentOS specific features
  #

  # alternative git
  [[ -f /opt/rh/rh-git29/enable ]] && source /opt/rh/rh-git29/enable

  # alternative python
  [[ -f /opt/rh/rh-python36/enable ]] && source /opt/rh/rh-python36/enable
fi
