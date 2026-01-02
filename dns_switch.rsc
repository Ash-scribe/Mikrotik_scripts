# 2026-01-02 22:45:53 by RouterOS 7.20.5
# software id = X8EC-24C8
#
# model = RBD53iG-5HacD2HnD
# serial number = HCX087BBSDV
/system script
add dont-require-permissions=no name=dns_switch owner=sevil policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local DnsIp 192.168.10.10\
    \n:local DnsAvailable false;\
    \nwhile (true) do={\
    \n    :if ([/ping \$DnsIp interval=1 count=10] > 9) do={\
    \n        :if (\$DnsAvailable true) do={\
    \n            /ip/dns set server=\$DnsIp\
    \n            }\
    \n        } else={\
    \n            /ip/dns set server=1.1.1.1,8.8.8.8\
    \n            }\
    \n:delay 5s;\
    \n}"
