# Can I run puppet to control stuff inside of a firewall ? 

Hell yes.

# how ?

Puppet works via SSL authentication - so you need to make sure that the external master is named using an internal IP address that can work as a proxy.  In this case, you get that in virtualbox on the hypervisor.  In a datacenter, you might get that through another type of proxy.

# PROVE IT

Gladly, its super easy ... just run these two vagrant recipes , they are coupled - the agent has to run after the master is serving.  Note this is in flux, so they might have some kinks.

1) Vagrant up your host, on one subnet that is private.
2) Vagrant up your 'datacenter', note that its on a *totally different subnet, also private*

# So what ?

Youll notice the data center talks through `.1` to a the puppet agent, the .1 address represents
your hypervisor - i.e. the loop back to your host.  

Now, in the vagrantfile for the hosts - you'll see that we bridge a port - thats the puppet master port !

So, what happens is that the "datacenter" nodes talk through the .1 IP address into your puppet master, and can thus
update their config via one way TCP requests. 

*That is simulating your hypervisor or proxy into the agent.*

# How does this apply to the real world ? 

That `.1` ip address thats hardcoded in the datacenter/ recipe is your an internal proxy or gateway to a puppet master 
that allows outgoing TCP connections.

You should get a succesfull agent registration:

```
Debug: Starting connection for https://master.local:8140
Debug: Caching connection for https://master.local:8140
Warning: Unable to fetch my node definition, but the agent run will continue:
Warning: undefined method `include?' for nil:NilClass
Debug: Evicting cache entry for environment 'production'
Debug: Caching environment 'production' (ttl = 0 sec)
Info: Retrieving pluginfacts
Debug: /File[/var/lib/puppet/facts.d]/seluser: Found seluser default 'system_u' for /var/lib/puppet/facts.d
Debug: /File[/var/lib/puppet/facts.d]/selrole: Found selrole default 'object_r' for /var/lib/puppet/facts.d
Debug: /File[/var/lib/puppet/facts.d]/seltype: Found seltype default 'puppet_var_lib_t' for /var/lib/puppet/facts.d
Debug: /File[/var/lib/puppet/facts.d]/selrange: Found selrange default 's0' for /var/lib/puppet/facts.d
Debug: Evicting cache entry for environment 'production'
Debug: Caching environment 'production' (ttl = 0 sec)
Debug: Evicting cache entry for environment 'production'
Debug: Caching environment 'production' (ttl = 0 sec)
Debug: Failed to load library 'msgpack' for feature 'msgpack'
Debug: Puppet::Network::Format[msgpack]: feature msgpack is missing
Debug: file_metadata supports formats: pson b64_zlib_yaml yaml raw
Debug: Using cached connection for https://master.local:8140
Debug: Caching connection for https://master.local:8140
Debug: Finishing transaction 19810520
Info: Retrieving plugin
Debug: /File[/var/lib/puppet/lib]/seluser: Found seluser default 'system_u' for /var/lib/puppet/lib
Debug: /File[/var/lib/puppet/lib]/selrole: Found selrole default 'object_r' for /var/lib/puppet/lib
Debug: /File[/var/lib/puppet/lib]/seltype: Found seltype default 'puppet_var_lib_t' for /var/lib/puppet/lib
Debug: /File[/var/lib/puppet/lib]/selrange: Found selrange default 's0' for /var/lib/puppet/lib
Debug: Failed to load library 'msgpack' for feature 'msgpack'
Debug: Puppet::Network::Format[msgpack]: feature msgpack is missing
Debug: file_metadata supports formats: pson b64_zlib_yaml yaml raw
Debug: Using cached connection for https://master.local:8140
Debug: Caching connection for https://master.local:8140
Debug: Finishing transaction 19766200
Debug: Evicting cache entry for environment 'production'
Debug: Caching environment 'production' (ttl = 0 sec)
Debug: Loading external facts from /var/lib/puppet/facts.d
Debug: Failed to load library 'msgpack' for feature 'msgpack'
Debug: Puppet::Network::Format[msgpack]: feature msgpack is missing
Debug: catalog supports formats: pson b64_zlib_yaml yaml dot raw
Debug: Using cached connection for https://master.local:8140
Debug: Caching connection for https://master.local:8140
Info: Caching catalog for slave1.local
Debug: Creating default schedules
Info: Applying configuration version '1555269291'
Debug: Finishing transaction 28658300
Debug: Storing state
Info: Creating state file /var/lib/puppet/state/state.yaml
Debug: Stored state in 0.00 seconds
Notice: Finished catalog run in 0.01 seconds
Debug: Using cached connection for https://master.local:8140
Debug: Caching connection for https://master.local:8140
Debug: Closing connection for https://master.local:8140
Debug: Closing connection for https://master.local:8140
```


