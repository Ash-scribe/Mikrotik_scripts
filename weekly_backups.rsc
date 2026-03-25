:local date [/sys/clock/get date as-string];
:local weekly "/flash/weekly_backups/";

/sys/backup save name=($weekly . $date)

/file
:local i 1;
:local backups [:toarray ""];
:foreach file in=[find where type~"backup" && name~"weekly_backups"] do={
    :set ($backups->"$i") $file
    :set i ($i+1)

};

:set i ($i-1);

:if ($i>12) do={
    remove (backups -> $i)
    };
