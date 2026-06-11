/system/identity
set name=edge-router

/ip/dhcp-client
remove 0

/interface/vlan
add name=VLAN10 vlan-id=10 interface=ether1
add name=VLAN20 vlan-id=20 interface=ether1
add name=VLAN99 vlan-id=99 interface=ether1

/ip/address
add address=56.148.10.1/24 interface=VLAN10
add address=56.148.20.1/24 interface=VLAN20
add address=99.99.99.1/24 interface=VLAN99

/ip/firewall/address-list
add address=56.148.10.0/24 list=users
add address=56.148.20.0/24 list=users
add address=99.99.99.0/24 list=management

/ip/firewall/filter
add action=drop chain=forward dst-address-list=management src-address-list=users
add action=drop chain=input dst-address-list=management src-address-list=users
