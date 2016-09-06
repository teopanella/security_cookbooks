#!/usr/bin/env bash
#####################################################
######## - Script for install nessus agent - ########
#													#
#####################################################
agent=/opt/nessus_agent/nessuscli
if [ -f $agent ]; then 
	exit
fi

#Download package from your repo.
wget <%=node['nessus_cloud']['download']%>/Nessus_amazon_64.rpm --no-check-certificate --quiet
mv Nessus_amazon_64.rpm /tmp/Nessus_amazon_64.rpm
rpm -ihv /tmp/Nessus_amazon_64.rpm
sleep 30
rm /tmp/Nessus_amazon_64.rpm

#Linking the agent with Nessus Cloud.
/opt/nessus_agent/sbin/nessuscli agent link --key=<%=node['nessus_cloud']['key']%> --host=cloud.tenable.com --port=443 --groups=<%=node['nessus_cloud']['group']%>
/etc/init.d/nessusagent start