1) Vagrant up your host
2) Vagrant up your 'datacenter'

Youll notice the data center talks through .1 to a the puppet agent.

That is simulating your hypervisor or proxy into the agent.

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


