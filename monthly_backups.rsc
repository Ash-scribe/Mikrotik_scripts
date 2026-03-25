:local date [/sys/clock/get date as-string];
:local monthly "/flash/monthly_backups/";

/sys/backup save name=($monthly . $date)

/file
:local i 1;
:local backups [:toarray ""];
:foreach file in=[find where type~"backup" && name~"monthly_backups"] do={
    :set ($backups->"$i") $file
    :set i ($i+1)

};

:set i ($i-1);

:if ($i>12) do={
    remove (backups -> $i)
    };
