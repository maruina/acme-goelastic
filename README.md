This repository creates 2 machines with Vagrant, Saltstack and Bash:  
 - 'Elastic': machine with the Elasticsearch. Ip: 192.168.33.99  
 - 'Go': machine with the Go app, managed by [Supervisor](http://supervisord.org/). Ip: 192.168.33.90  


##USAGE
Install Vagrant and Virtualbox.  
Clone the repository and cd into it.  
```vagrant up```   
Connect to 192.168.33.90:8000 to run the application.  

If you need to change the ip address due an ip conflict, open the Vagrantfile and change the lines
```elastic.vm.network :private_network, ip: "192.168.33.99"```  
```go.vm.network :private_network, ip: "192.168.33.90"```  

If you want to connect to a particular machine:  
```vagrant ssh elastic``` or ```vagrant ssh go```


##TODO
- Enable iptables with a Salt formula
- Improve Elasticseach configuration, still very basic
- Improve Saltstack formulas


##NOTES
- On Debian we added the line ```JAVA_OPTS="$JAVA_OPTS -Djava.net.preferIPv4Stack=true"``` to ```elasticsearch.in.sh```, otherwise Elasticsearch will listen only for ipv6 connections.
- If you have some trouble with the app, log in to the go machine with ```vagrant ssh go``` and try to connect to elasticsearch ```curl 192.168.33.99:9200``` to check the connection between the machines.


##PROOF
https://www.dropbox.com/s/vrs60wlucqfag7h/Screenshot%202015-09-08%2012.34.17.png?dl=0