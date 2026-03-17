:if ([/ip/dhcp-client/get value-name=status number=equipment_testing] !="bound") do={
    /ip/dhcp-client/enable [find .id comment~"equipment_testing"]
    :delay 12s
    };
:local server [/ip/dhcp-client/get value-name=dhcp-server number=equipment_testing];
:if ($server=[]) do={
    /ip/dhcp-client/disable [find .id comment~"equipment_testing"]
    } else={
        :if ([/ping $server interval=1 count=5] <1) do={
        /ip/dhcp-client/disable [find .id comment~"equipment_testing"]
        }};
