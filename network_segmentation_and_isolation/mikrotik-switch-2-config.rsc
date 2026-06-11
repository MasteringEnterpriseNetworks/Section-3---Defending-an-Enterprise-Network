/system/identity
set name=switch-2

/ip/dhcp-client
remove 0

/interface/bridge
add name=bridge1 vlan-filtering=no

/interface/bridge/port
add bridge=bridge1 interface=ether3
add bridge=bridge1 interface=ether10 pvid=10

/interface/bridge/vlan
add bridge=bridge1 tagged=ether3 untagged=ether10 vlan-ids=10
add bridge=bridge1 tagged=bridge1,ether3 vlan-id=99

/interface/vlan
add interface=bridge1 name=VLAN99 vlan-id=99

/ip/address
add address=99.99.99.3/24 interface=VLAN99

/interface/bridge
set bridge1 vlan-filtering=yes
