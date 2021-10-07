# safex-node
Docker: <a href="https://hub.docker.com/r/safexninja/safex-node-arm">hub.docker.com/r/safexninja/safex-node-arm</a><br>
<br><b><u>This image is for processors with ARM architecture (like Raspbery Pi). </u></b><br> 
This will run the daemon from <a href="https://github.com/safex/safexcore" target="_blank">Safex Core</a> as a node only. No mining. No RPC-node. The in/out peers are set to 50.<br>
To receive <b>in</b>-peers make sure port range 17400-17403 is open on the router/network and if needed portforwarded to the docker-host, or the host is connected to the internet directly. When the node is running type <code>status</code> to see the synchronization status and the amount of peers.<br><br>
Be aware: when starting the node for the fist time it will start synchronizing with the network. This may take up to a few hours on high end hardware, and multiple days on low end hardware<br>

<h1>Supported Tags</h1>
<ul>
<li><code>latest</code></li>
<li><code>7.0.2</code></li>
</ul>
<br>
<h1>Runing the node</h1>
<br>
<h2>With default data location</h2><br>
<code>$ docker run -i -p 17400-17403:17400-17403 safexninja/safex-node-arm</code>

<br><h2>Recommended: With mount local volume (on the host) to /data folder in the container</h2>
<code>$ docker run -i -p 17400-17403:17400-17403 -v [volume]:/data safexninja/safex-node-arm</code><br><br><br>
<b>example linux/mac</b><br>
<code>$ docker run -i -p 17400-17403:17400-17403 -v <b>/home/.safex</b>:/data safexninja/safex-node-arm</code><br>
this will persist the blockchain data in <i>/home/.safex</i> on the host<br><br>
<b>example windows</b><br>
<code>$ docker run -i -p 17400-17403:17400-17403 -v <b>/c/data/.safex</b>:/data safexninja/safex-node-arm</code><br>
this will persist the blockchain data in <i>c:/data/.safex</i> on the host<br>

<br>
<h1>Help & Commands</h1>
While the node is running type <code>help</code> to get a list of available commands<br>
<br>

<h1>Exit</h1>
To exit the node type <code>save</code> followed by <code>exit</code>. The container will be exited<br>
<br>
<h1>Installing Docker & Runing the node</h1>
Installing Docker on Debian based linux distro (i.e. Raspbian, Raspberry Pi Os, Ubuntu) and run the latest node.<br>
If you have not installed docker yet, follow these steps:<br><br>

<code>$ sudo apt update</code><br>
<code>$ sudo apt install snapd</code><br>
<code>$ sudo snap install core</code><br>
<code>$ sudo snap install docker</code><br>
<code>$ sudo reboot</code> to reboot the machine<br> 
<code>$ docker run -i -p 17400-17403:17400-17403 -v <b>/home/.safex</b>:/data safexninja/safex-node-arm</code><br><br>
If you have docker correctly installed already (i.e. Docker Desktop on Mac), then just run the last command only
<br><br>
<h3>Errors</h3>
You might get an error on pre-loading of a lib. To resolve this comment a line in a file:<br>
<code>$ sudo nano /etc/ld.so.preload</code> to open the file<br> then
comment this line <code>/usr/lib/arm-linux-gnueabihf/libarmmem.so</code> by adding a # in front<br> like:
<code>#/usr/lib/arm-linux-gnueabihf/libarmmem.so</code> and the save and exit<br>
<br><br>
If you get permission denied on docker.sock then do this command:<br>
<code>$ sudo chmod 777 /var/run/docker.sock</code><br><br>


