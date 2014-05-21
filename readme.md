# softether vpn

### usage

```
current just install the package.

#official website suggests create a local bridge to have a better performance

host -> create interface for vpn_only without dhcp, add to vpn_vm as eth1

vpn_vm -> create local bridge then enable only dhcp in securenat and add static route to push
```
