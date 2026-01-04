:local DnsIp 192.168.10.10
:local DnsAvailable false;
:if ([/ping $DnsIp interval=1 count=10] > 9) do={
    :if ($DnsAvailable true) do={
        /ip/dns set server=$DnsIp
        }
    } else={
        /ip/dns set server=1.1.1.1,8.8.8.8
        };


