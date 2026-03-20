/ip/dhcp-client/
:if ([get equipment_testing status]="bound") do={
    :local server [/ip/dhcp-client/get value-name=dhcp-server number=[find comment~"equipment_testing"]];
    :put $server;
    /ip/dns/static remove numbers=[find name~"equip.home.arpa"];
    /ip/dns/static add name=equip.home.arpa address=$server
    }
