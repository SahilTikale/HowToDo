 How to create ssh tunnel to remote webgui servers.
====

I need to access a webgui server running on a remote linux machine that requires a jump server to login. 
* I configured the required method to ssh to the server (via jump server) in the .ssh/config file of my laptop

```
Host sparkcontroller
        Hostname <ip address of the server>
        user root
        # using the jump server.
        ProxyCommand ssh ip-bm-research-bmi -W %h:%p
        ForwardAgent yes
```
* It is assumed that you can ssh to the remote server using the above configuration. 

## From a laptop that runs linux baremetal:
*  Say I have a linux laptop. I want to access the webgui server using local browser.
* I will install the program "sshuttle" onto my laptop.
* For Ubuntu that would be:
```
 sudo apt install sshuttle
```
* Open a terminal and use the followng command to connect to the webgui server on the remote machine. Assuming I know which port the services is listening on.

```
sshuttle -r sparkcontroller 172.26.0.104/24 
output:
client: Connected.
```
* Leave the connection open in the terminal. Open the local browser and type in the address bar:
```
172.26.0.104:<port no of the service>
```
It will start showing the web page of the webgui service.

## From a Windows 11 host using wsl2:
* Say I have windows 11 laptop with Ubuntu installed (20.04 lts) as wsl2. 
* I will set up the method to ssh to the remote server exactly like described above in the .ssh/config of the wsl2. Test that I can ssh to the remote server successfully using that method.
* Then create a ssh tunnel using the following command:
```
ssh -N -L 127.0.0.1:8080:172.26.0.104:8080 sparkcontroller
Output: None
``` 
* Leave the terminal open with the connection running. Open any browser on the windows 11 host and point to the web page by writing in the address bar:

```
localhost:8080 
```

* You should see the web page rendered by the webgui program on the remote server on your local browser. 

