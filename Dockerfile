FROM ubuntu

ARG apikey

# Step 1
RUN apt-get update
RUN apt-get install dialog apt-utils -y
RUN apt-get install -y apt-transport-https

# Step 2
RUN sh -c "echo 'deb https://apt.datadoghq.com/ stable 6' > /etc/apt/sources.list.d/datadog.list"
RUN apt-get install gnupg -y
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 382E94DE

# Step 3
RUN apt-get install ca-certificates -y
RUN apt-get update
RUN apt-get install datadog-agent

# Step 4
RUN echo $apikey > /tmp/apikey.txt
RUN sh -c "sed 's/api_key:.*/api_key: `cat /tmp/apikey.txt`/' /etc/datadog-agent/datadog.yaml.example > /etc/datadog-agent/datadog.yaml"


#RUN echo $apikey > /tmp/apikey.txt
#RUN sh -c "sed 's/api_key:.*/api_key: `cat /tmp/apikey.txt`/' /etc/datadog-agent/datadog.yaml.example > /etc/datadog-agent/datadog.yaml"

# Step 5
#RUN systemctl restart datadog-agent.service

#RUN apt-get install -y curl wget 



# Additional tools
RUN apt-get install vim curl net-tools -y