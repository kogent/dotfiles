# get certificate
function getcert {
  host=${1}
  port=${2:-443}
  echo | openssl s_client -connect ${host}:${port} 2>/dev/null | sed -n '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/p'
}

# consumed memory of processes matching a pattern
function psmem() {
  ps aux | awk -v pat="${1}" 'tolower($0) ~ pat {sum += $6} END { printf "%dMB", sum/1024 }'
}

# whois without TOS
function whois {
  /usr/bin/whois $@ | sed -e '/TERMS OF USE/,$d'
}

#set the title of the terminal tab
function set_tab_title() {
  if [[ "$(uname -s)" == 'Darwin' ]] && [[ $BASH_VERSION == '3.2.57(1)-release' ]]; then
    env echo -n -e "\e]0;${1}\a"
  else
    echo -n -e "\e]0;${1}\a"
  fi
}

# aws
function ec2_get_instance_by_tag_name()   { aws ec2 describe-instances --filter "Name=tag:Name,Values=${1}"; }
function ec2_get_instanceid_by_tag_name() { aws ec2 describe-instances --output text --filter "Name=tag:Name,Values=${1}" --query "Reservations[*].Instances[*].InstanceId"; }
function ec2_start_instance_by_tag_name() { aws ec2 start-instances --instance-ids $(ec2_get_instanceid_by_tag_name  "${1}"); }
function ec2_stop_instance_by_tag_name()  { aws ec2 stop-instances  --instance-ids $(ec2_get_instanceid_by_tag_name  "${1}"); }
function ec2_ami_build_state() { aws ec2 describe-images --owner self --filter "Name=tag:Name,Values=${1}" --query "Images[*].State" --output text; }
function ec2_get_password_data() { 
    instance_id="${1}"
    key_id="${2}"
    aws ec2 get-password-data --instance-id "${instance_id}" --priv-launch-key "${key_id}"
}
function ec2_get_password_data_by_name() { 
    instance_name="${1}"
    key_id="${2}"
    instance_id="$(ec2_get_instanceid_by_tag_name "${instance_name}")"
    if [ -n "${instance_id}" ]; then
        ec2_get_password_data "${instance_id}" "${key_id}"
    else
        echo "No instance found with matching Name tag" && false
    fi
}
function aws_ssm_run() {
  # TODO vet this function, expecially the $ in the final echo
  for instance_id in $(aws ec2 describe-instances | jq -r .Reservations[].Instances[].InstanceId); do 
      echo $'Instance: '${instance_id}; 
      command_id=$(aws ssm send-command --instance-ids "${instance_id}" --document-name "AWS-RunShellScript" --comment "kernel version" --parameters commands="uname -r" --output text --query "Command.CommandId"); 
      sleep 5; 
      aws ssm list-command-invocations --instance-id "${instance_id}" --command-id "${command_id}" --details  | jq -r '.CommandInvocations[].CommandPlugins[].Output';
      echo $'----end----\n'; 
  done
}

# generate a string of random chars. defaults to 32 chars in length
function random-string {
  cat /dev/urandom | env LC_CTYPE=C tr -dc "a-zA-Z0-9,:_" | head -c ${1:-32}
}

# (⌐■_■)
function fliptable () {
  echo "（╯°□°）╯ ┻━┻"
}

function flip() {
  echo -en "( º_º）  ┬─┬     \r"; sleep .2;
  echo -en " ( º_º） ┬─┬     \r"; sleep .2;
  echo -en "  ( ºДº）┬─┬     \r"; sleep .4;
  echo -en "  (╯'Д'）╯︵⊏    \r"; sleep .2;
  echo -en "  (╯'□'）╯︵ ⊏   \r"; sleep .1;
  echo     "  (╯°□°）╯︵ ┻━┻ ";   sleep .4;
}
alias flipdesk='flip'
alias deskflip='flip'
alias tableflip='flip'

function sunglasses() {
  echo -en " ( •_•)     \r"; sleep .5;
  echo -en " ( •_•)>⌐■-■\r"; sleep 1;
  echo     " (⌐■_■)     ";   sleep 1;

}
