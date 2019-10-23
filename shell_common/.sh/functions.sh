# get certificate
getcert() {
  host=${1}
  port=${2:-443}
  echo | openssl s_client -connect ${host}:${port} 2>/dev/null | sed -n '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/p'
}

# consumed memory of processes matching a pattern
psmem() {
  ps aux | awk -v pat="${1}" 'tolower($0) ~ tolower(pat) {sum += $6} END { printf "%dMB", sum/1024 }'
}

# whois without TOS
function whois() {
  whois $@ | sed -e '/TERMS OF USE/,$d'
}

#set the title of the terminal tab
set_tab_title() {
  if [[ "$(uname -s)" == 'Darwin' ]] && [[ $BASH_VERSION == '3.2.57(1)-release' ]]; then
    env echo -n -e "\e]0;${1}\a"
  else
    echo -n -e "\e]0;${1}\a"
  fi
}

# aws
ec2_get_instance_by_tag_name()   { aws ec2 describe-instances --filter "Name=tag:Name,Values=${1}"; }
ec2_get_instanceid_by_tag_name() { aws ec2 describe-instances --output text --filter "Name=tag:Name,Values=${1}" --query "Reservations[*].Instances[*].InstanceId"; }
ec2_start_instance_by_tag_name() { aws ec2 start-instances --instance-ids $(ec2_get_instanceid_by_tag_name  "${1}"); }
ec2_stop_instance_by_tag_name()  { aws ec2 stop-instances  --instance-ids $(ec2_get_instanceid_by_tag_name  "${1}"); }
ec2_ami_build_state() { aws ec2 describe-images --owner self --filter "Name=tag:Name,Values=${1}" --query "Images[*].State" --output text; }
ec2_get_password_data() {
    instance_id="${1}"
    key_id="${2}"
    aws ec2 get-password-data --instance-id "${instance_id}" --priv-launch-key "${key_id}"
}
ec2_get_password_data_by_name() {
    instance_name="${1}"
    key_id="${2}"
    instance_id="$(ec2_get_instanceid_by_tag_name "${instance_name}")"
    if [ -n "${instance_id}" ]; then
        ec2_get_password_data "${instance_id}" "${key_id}"
    else
        echo "No instance found with matching Name tag" && false
    fi
}
aws_ssm_run() {
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
random_string() {
  cat /dev/urandom | env LC_CTYPE=C tr -dc "a-zA-Z0-9,:_" | head -c ${1:-32}
}

# (⌐■_■)
fliptable () {
  echo "（╯°□°）╯ ┻━┻"
}

flip() {
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

sunglasses() {
  echo -en " ( •_•)     \r"; sleep .5;
  echo -en " ( •_•)>⌐■-■\r"; sleep 1;
  echo     " (⌐■_■)     ";   sleep 1;

}

# TODO linux specific
straceall() {
  strace $(pidof "${1}" | sed 's/\([0-9]*\)/-p \1/g')
}

# https://coderwall.com/p/0q1v-w/change-iterm2-profile-from-the-terminal
it2_profile() {
  echo -e "\033]50;SetProfile=$1\x7"
}

sshdelhkey() {
  ssh-keygen -R $@
}

sshgethkey() {
  ssh-keyscan $@ | sed -e '/^#/d' | tee -a "${HOME}/.ssh/known_hosts"
}

sshresethkey() {
  sshdelhkey $@
  sshgethkey $@
}

sshpushkey() {
  ssh-copy-id -i ~/.ssh/id_rsa.pub $@
}

sshdate() {
  ssh $@ "date"
}

sshfixdate() {
  ssh $@ "date -s \"$(date)\""
}

sshepel6() {
  ssh $@ "yum -y install https://dl.fedoraproject.org/pub/epel/6/x86_64/Packages/e/epel-release-6-8.noarch.rpm"
  ssh $@ "yum -y install open-vm-tools"
}

sshepel7() {
  ssh $@ "yum -y install https://dl.fedoraproject.org/pub/epel/6/x86_64/Packages/e/epel-release-6-8.noarch.rpm"
  ssh $@ "yum -y install open-vm-tools"
}

sshgetos() {
  ssh $@ "cat /etc/redhat-release || cat /etc/debian-release || cat /etc/issue"
}

sshreboot() {
  ssh $@ "reboot"
}

function sshpowerdown() {
  ssh $@ "shutdown -P now"
}

sshshowkey() {
  ssh-keygen -Lf $@
}

gitresetago(){
  branch="master"
  git reset --hard ${branch}@{"$@ ago"}
}

dockerboot(){
  docker-machine start
  echo "Setting Env Vars..."
  dockerenv=$(docker-machine env)
  echo "${dockerenv}" | sed -e "/^\#/d" -e "s/^export //"
  eval "${dockerenv}"
  echo "docker-machine status: $(docker-machine status)"
}

dockerstop(){
  docker-machine stop
  echo "Unsetting Env Vars: DOCKER_TLS_VERIFY, DOCKER_HOST, DOCKER_CERT_PATH, DOCKER_MACHINE_NAME"
  unset DOCKER_TLS_VERIFY
  unset DOCKER_HOST
  unset DOCKER_CERT_PATH
  unset DOCKER_MACHINE_NAME
  unset dockerenv
  echo "docker-machine status: $(docker-machine status)"
}

eight_digit_pin(){
  shuf -i 0-99999999 -n 1 | xargs printf "%08d\n"
}

rgless(){
	rg --color always $@ | less -R
}

function codesearch() {
  code $(rg $@ | fzf -m | cut -d':' -f1 | sort | uniq)
}

function vimsearch() {
  vim $(rg $@ | fzf -m | cut -d':' -f1 | sort | uniq)
}

function urlencode() {
  python3 -c "import urllib.parse;print(urllib.parse.quote('${1}'))"
}
