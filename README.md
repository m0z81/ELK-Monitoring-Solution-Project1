# ELK-Monitoring-Solution-Project1
Here I display a solution for two vulnerable web application servers via an ELK stack monitoring system.

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[Project1_Network_Diagram](https://github.com/m0z81/ELK-Monitoring-Solution-Project1/blob/main/Diagrams/Project1_Network_Diagram.PNG)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Project 1 Network Diagram file may be used to install only certain pieces of it, such as Filebeat.

[filebeat-playbook.yml](https://github.com/m0z81/ELK-Monitoring-Solution-Project1/blob/main/Ansible/filebeat-playbook.yml.txt)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
- Beats in Use
- Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

- The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly functional, in addition to restricting heavy traffic to the network.

- What aspect of security do load balancers protect? 

They help defend individuals or organisations against distributed denial-of-service (DDoS) attacks.

- What is the advantage of a jump box? 

It provides improved security by preventing other VM's on the network to be exposed to the public as well as easy logging and monitoring from a single box. 
Mitigating risks from online attacks.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network and system logs.
- What does Filebeat watch for? 

Filebeat monitors log files and log data/events.

- What does Metricbeat record? 

It collects metrics from the operating system and from programs.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function  | IP Address | Operating System |
|----------|-----------|------------|------------------|
| Jump Box | Gateway   | 10.0.0.4   |  Linux           |
| Web-1    |Webserver  | 10.0.0.5   |  Linux           |
| Web-2    |Webserver  | 10.0.0.6   |  Linux           |
| ELK VM   |Monitoring | 10.1.0.4   |  Linux           |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 194.193.262.158 Local workstation IP

Machines within the network can only be accessed by the Jump-Box
-  Which machine did you allow to access your ELK VM? 

Jump-Box

What was its IP address? 

10.0.0.4 Private 

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses              |
|----------|---------------------|-----------------------------------|
| Jump-Box | Yes                 | 194.193.262.158 Local workstation |
| Web-1    | No                  | 10.0.0.4                          |
| Web-2    | No                  | 10.0.0.4                          |
| ELK VM   | No                  | 10.0.0.4                          |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- What is the main advantage of automating configuration with Ansible?

Ansible can be run from the command line without the use of configuration files for simple tasks. This allows for simple installion via playbooks without the need for additional software.


The playbook implements the following tasks:


- SSH into Jump-Box, start and attach docker container 'loving_beaver'
- Create Elk playbook in /etc/ansible/roles 'install-elk.yml' 
- Ensured that  `docker.io` `python3-pip` `docker` modules are included
- Ensure memory is increase to '262144' and exposing correct ports
- Launching playbook followed by SSH into ELK to verify installation.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

[ELK-VM_Docker_PS](https://github.com/m0z81/ELK-Monitoring-Solution-Project1/blob/main/Images/ELK-VM_Docker_%20PS.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 "10.0.0.5"
- Web-2 "10.0.0.6"

We have installed the following Beats on these machines:
- [Filebeat-Module-Status-Screenshot](https://github.com/m0z81/ELK-Monitoring-Solution-Project1/blob/main/Images/Filebeat-Module-Status-Screenshot.PNG)
- [Filebeat-System-ECS](https://github.com/m0z81/ELK-Monitoring-Solution-Project1/blob/main/Images/Filebeat-System-ECS.PNG)
- [Metricbeat-Module-Status-Screenshot](https://github.com/m0z81/ELK-Monitoring-Solution-Project1/blob/main/Images/Metricbeat-Module-Status-Screenshot.PNG)
- [Metricbeat-Docker-ECS](https://github.com/m0z81/ELK-Monitoring-Solution-Project1/blob/main/Images/Metricbeat-Docker-ECS.PNG)

These Beats allow us to collect the following information from each machine:
 
- Filebeat is a lightweight shipper for forwarding and centralizing log data.

- Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 


SSH into the control node and follow the steps below:

- Copy the install-elk.yml file to /etc/ansible/roles/elk-install.yml.
- Update the hosts file to include the group [ELK] with the servers ip "10.1.0.4" followed by ansible_python_interpreter=/usr/bin/python3
- Run the playbook, and navigate to http://[elk_server_ip]:5601/app/kibana to check that the installation worked as expected.

---
_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._


* Filebeat installation process:
Login to Kibana > Logs : Add log data > System logs > DEB > Getting started follow instructions detailed on webpage.


Copy commands to filebeat-playbook.yml

    curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.1-amd64.deb
    
    dpkg -i filebeat-7.4.0-amd64.deb


Update the filebeat-config.yml file using "nano filebeat-config.yml" to include:

output.elasticsearch:
  
  #Array of hosts to connect to.
 
 hosts: ["10.1.0.4:9200"]
  
  username: "elastic"
  
  password: "changeme” 

 
 setup.kibana:
  
  host: "10.1.0.4:5601"

Your configured playbook should look similar to this: 

[filebeat-playbook.yml](https://github.com/m0z81/ELK-Monitoring-Solution-Project1/blob/main/Ansible/filebeat-playbook.yml.txt)

Run the playbook using the following command " ansible-playbook filebeat-playbook.yml "

then navigate to Kibana > Logs : Add log data > System logs > 5:Module Status > Check data to verify the installation worked as expected.

---
* Metricbeat installation process:
Login to Kibana > Add Metric Data > Docker Metrics > DEB > Getting Started

Copy commands to metric-playbook.yml
    
    curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.6.1-amd64.deb

    dpkg -i metricbeat-7.4.0-amd64.deb

Update the metricbeat-config.yml file using "nano metricbeat-config.yml" to include:

 
 output.elasticsearch: |

 #Array of hosts to connect to.

 hosts: ["10.1.0.4:9200"]
  
  username: "elastic"
  
  password: "changeme"

 setup.kibana:                      
                              
 host: "10.1.0.4:5601"         


Your configured playbook should look similar to this: 

[metricbeat-playbook.yml](https://github.com/m0z81/ELK-Monitoring-Solution-Project1/blob/main/Ansible/metricbeat-playbook.yml.txt)

Run the playbook using the following command " ansible-playbook metricbeat-playbook.yml " 

then navigate to Kibana > Add Metric Data > Docker Metrics > Module Status to verify that the installation worked as expected.
