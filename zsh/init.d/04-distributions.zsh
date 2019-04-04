# check for intel opt package
if [[ -d /opt/intel/parallel_studio_xe_2018/ ]]; then
  source /opt/intel/parallel_studio_xe_2018/psxevars.sh &> /dev/null
fi


if [[ $(hostname) -eq "ny4-collector-01" ]]; then
  export VOLERA_FH_HOME="${HOME}/workspace/SWFeedHandler"
  export ENV="NY4Dev"
  export PATH=$PATH:$VOLERA_FH_HOME/bin
fi

if [[ $(lsb_release -is) == "CentOS" ]]; then
  # -------------------------------
  # CentOS specific features
  # -------------------------------

  # alternative git
  [[ -f /opt/rh/rh-git29/enable ]] && source /opt/rh/rh-git29/enable

  # alternative python3
  # [[ -f /opt/rh/rh-python36/enable ]] && source /opt/rh/rh-python36/enable

  # alternative python2
  # [[ -f /opt/rh/python27/enable ]] && source /opt/rh/python27/enable

  # alternative gcc
  [[ -f /opt/rh/devtoolset-7/enable ]] && source /opt/rh/devtoolset-7/enable
fi
