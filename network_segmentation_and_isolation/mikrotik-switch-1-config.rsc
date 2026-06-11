/system/identity
set name=switch-1

/ip/dhcp-client
remove 0

/interface/bridge
add name=bridge1 vlan-filtering=no

/interface/bridge/port
add bridge=bridge1 interface=ether1
add bridge=bridge1 interface=ether3
add bridge=bridge1 interface=ether23 pvid=10
add bridge=bridge1 interface=ether24 pvid=10
add bridge=bridge1 interface=ether10 pvid=20
add bridge=bridge1 interface=ether11 pvid=20

/interface/bridge/vlan
add bridge=bridge1 tagged=ether1,ether3 untagged=ether23,ether24 vlan-ids=10
add bridge=bridge1 tagged=ether1,ether3 untagged=ether10,ether11 vlan-ids=20
add bridge=bridge1 tagged=bridge1,ether1,ether3 vlan-ids=99

/interface/vlan
add interface=bridge1 name=VLAN99 vlan-id=99

/ip/address
add address=99.99.99.2/24 interface=VLAN99

/interface/bridge
set bridge1 vlan-filtering=yes
