:local date [/sys/clock/get date as-string];
:local daily "/flash/daily_backups/";

/sys/backup save name=($daily . $date)

/file
:local i 1;
:local backups [:toarray ""];
:foreach file in=[find where type~"backup" && name~"daily_backups"] do={
    :set ($backups->"$i") $file
    :set i ($i+1)

};

:set i ($i-1);

:if ($i>10) do={
    remove (backups -> $i)
    };
