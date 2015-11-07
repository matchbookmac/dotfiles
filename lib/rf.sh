#!/bin/sh

### RUMBLEFISH STUFFS
# RF logins
ftp='10.20.20.219'
rfserver ()
{
  ssh -i ~/.ssh/rumblefish-vpc.pem 'ubuntu@'$1''
}
# alias ftpserver="ssh -i ~/.ssh/rumblefish-vpc.pem ubuntu@10.20.20.219"

# RF niceties
# Restarts rabbitmq and deletes all queues, exchanges, etc. Make sure you want to do this
alias rmqrestart="rabbitmqctl stop_app && rabbitmqctl reset && rabbitmqctl start_app"
