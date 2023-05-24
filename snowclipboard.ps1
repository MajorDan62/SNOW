# PS Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# PS Unblock-File -Path 
# Designer Mike Jordan 18th Nov 2021
# Updated  8th Aug 2022 : added 10-13 options and fixed bug with flushing variables//resized window
# Updated 27th Jan 2023 : added new option (15)

function Last_reboot(){return  (gcim Win32_OperatingSystem).LastBootUpTime} 

mode con:cols=60 lines=23
do{
Clear-Host
$info=$false;$inc=$false;$memory=$false;$ips=$false;$wilko=$false;$wilko_modem=$false;$wilko_password=$False
$wilko_modemOK=$false;$wilko_highmem=$false;$wilko_modemOK=$false;$wilko_modem_ISP=$false;$ipf_ntp_daemon=$false
$ipf_change=$false;$no_traffic=$false;$ipf_hu=$false
if ($args.count -gt 0)
{
	for ($i=0;$i -lt $args.count;$i++)
	{
		# if ($args[$i] -eq "?"){$about=$True}
		if ($args[$i] -eq "1"){$info=$True}
		if ($args[$i] -eq "2"){$inc=$True}
		if ($args[$i] -eq "3"){$memory=$True}
		if ($args[$i] -eq "4"){$ips=$True}
		if ($args[$i] -eq "5"){$wilko=$True}
		if ($args[$i] -eq "6"){$wilko_modem=$True}
		if ($args[$i] -eq "7"){$wilko_password=$True}
		if ($args[$i] -eq "8"){$wilko_highmem=$True}	
		if ($args[$i] -eq "9"){$wilko_modemOK=$True}	
		if ($args[$i] -eq "10"){$wilko_modem_ISP=$True}	
		if ($args[$i] -eq "11"){$ipf_ntp_daemon=$True}	
		if ($args[$i] -eq "12"){$ipf_change=$True}	
		if ($args[$i] -eq "13"){$ipf_hu=$True}	
		if ($args[$i] -eq "14"){$no_traffic=$True}	
		if ($args[$i] -eq "15"){$ms_team_OOO=$True}	
		if ($args[$i] -eq "16"){$pa_memory=$True}	
	}
}
else
{
	$_lr_	=	last_reboot
	write-host -f white -b green "    Standard S-Now Messages    "
	write-host "Last Reboot $_lr_ "
	write-host ""
	write-host " 1.  Standard More Information Message	[All]"
	write-host " 2.  Standard Not a Incident Message	[All]"
	write-host " 3.  Standard Memory Issue		[Whitbread] "
	write-host " 4.  Standard SIEM Issue		[IPF]"
	write-host " 5.  Standard Memory Usage		[Wilko] "
	write-host " 6.  Standard Modem Flapping Issue	[Wilko] "
	write-host " 7.  Admin password			[Wilko] "
	write-host " 8.  High CPU Detected			[Wilko] "
	write-host " 9.  Checked Modem - No Issues		[Wilko] "
	write-host " 10. Reconfigured ISP Modem		[Wilko] "
	write-host " 11. IPF NTP Daemon			[IPF] "
	write-host " 12. IPF Marketing Change	        [IPF] "
	write-host " 13. IPF Engineer Change & Reference	[IPF] "
	
	write-host " 14. No traffic observed in FW log	[All] "
	write-host -f magenta " 15. Microsoft Teams OOO Message	[All] "
	write-host " 16. Palo Alto Memory/CPU Issues	[SGN] "
	


	write-host ""
	Write-Host 'Choose Standard Message to Copy [1-16]' -nonewline
	$reply =  Read-Host

	if ($reply -eq "1"){$info=$True}
	elseif ($reply -eq "2"){$inc=$True}
	elseif ($reply -eq  "3"){$memory=$True}
	elseif ($reply -eq "4"){$ips=$True}
	elseif ($reply -eq "5"){$wilko=$True}
	elseif ($reply -eq "6"){$wilko_modem=$True}
	elseif ($reply -eq "7"){$wilko_password=$True}
	elseif ($reply -eq "8"){$wilko_highmem=$True}
	elseif ($reply -eq "9"){$wilko_modemOK=$True}
	elseif ($reply -eq "9"){$wilko_modemOK=$True}
	elseif ($reply -eq "10"){$wilko_modem_ISP=$True}
	elseif ($reply -eq "11"){$ipf_ntp_daemon=$True}
	elseif ($reply -eq "12"){$ipf_hu=$True}
	elseif ($reply -eq "13"){$ipf_change=$True}

	elseif ($reply -eq "14"){$no_traffic=$True}
	elseif 	($reply -eq "15"){$ms_team_OOO=$true}
	elseif 	($reply -eq "17"){$wilko_password=$true}

}

if ($info) 
{
write-output "We require more information to progress
(1) Source IP Address(es)
(2) Destination IP Address(es)
**Any machine names or URLs listed in this incident must be resolved
**into IP addresses as the firewalls only filter by IP
(3) TCP Ports/Protocols Used
(4) Has this ever worked in the Past, if so when did it fail?
(5) Please supply username of failing users
(6) How many users are impacted?
(7) Supply a trace route from source to destination
Note : Make sure the user is connected to the corporate network before producing above results
Please update the incident with this information" | clip
write-host "Standard No Information requires Message copied"
}

elseif ($inc)
{
write-output "This is not an incident, it is a request for new access through the FW's
therefore we can't progress this under a fault call and we request
the end-user raise a change request to progress this work
with the appropriate details
(1) Source IP Address(es)
(2) Destination IP Address(es)
(3) TCP Ports/Protocols Used"| clip
write-host "Standard Not a FW Issue Message copied"
}

elseif ($memory) 
{
write-output "This is a known issue and has been for a while, there's a problem ticket open
please raise no further incidents for this issue. PRB0049159 "| clip
write-host "Standard WHB memory Issue Message copied"
}

elseif ($ips)
{
write-output "This is a automatic update carried out by the System created a new object for use of IpsProtectionUserSettings & ThreatIpsProtectionOverride engine's"| clip
write-host "Standard IPF IPS Issue Message copied"
}

elseif ($wilko)
{
write-output "Checked CPU Usage of the quoted time frames, no  issue reported  in the system event logs 
CPU Usage is currently at  <xx> % , CPU may have spiked briefly, but is now within normal parameters"| clip
write-host "Standard Wilko CPU Usage Message copied"
}

elseif ($wilko_modem)
{
write-output "Unfortunately using the steps in the Wilko support guide we have been unable to get a signal or a stable signal from the carriers, please arrange for an alternative solution
see below for output:
Modem has flapped <xx>  times in the past 7 days." | clip
write-host "Standard Wilko Modem Flapping Message copied"
}

elseif ($wilko_password)
{
write-output "ApPl34ndP3aR5" | clip
write-host "Wilko Admin Password Copied"
}

elseif ($wilko_highmem)
{
write-output "Checked system log on firewall ovr the quoted time frame and CPU usage is elevated at <xx>% since 
firewall will require restarting by the NOC  -  Out of Hours." | clip
write-host -f red "Standard Wilko High CPU Usage detected  Message copied"
}

elseif ($wilko_modemOK)
{
write-output "Logged onto firewall, checked modem, no issues & IP Address assigned" | clip
write-host -f red "Standard Wilko Modem No issues detected  Message copied"
}

elseif ($wilko_modem_ISP)
{
write-output "Modem ISP is now <ISP>, IP address assigned, see snapshot" | clip
write-host -f red "Standard Wilko Modem ISP Changed message"
}
elseif ($ipf_ntp_daemon)
{
write-output "Due to the network time protocol syncing the device time with the time protocol server
** this is a normal function and should not be logged as a fault **" | clip
write-host -f red "IPF NTP Daemon Message copied"
}

elseif ($ipf_change)
{
write-output "This change <CHANGE REF> was completed by the firewall engineer <ENGINEER NAME>" | clip
write-host -f red "IPF Engineer Change Message copied"
}

elseif ($no_traffic)
{

write-output "We have checked the supported firewall(s) and can't see any traffic in the logs over the last 7 days 
coming from quoted source going to the quoted destination IP Addreses.
the traffic is either being dropped before reaching the supported firewalls or is not routed via them 
we can't assist until we can confirm the traffic is arriving at the supported firewall(s)"| clip
write-host -f red "No traffic observed massage"
}

elseif ($ms_team_OOO)
{
write-output "All, I have to drop the daughter at work, will be OOO approx. 08:15 ish , hence I started at 7am this morning" | clip
write-host -f red "Standard OOO Team Message"
}

elseif ($pa_memory)
{
write-output "this is a known issue with this device, this device is to be upgraded and then rebooted
this should resolve the issue, the SDM is aware and a date isn to be set for the upgrade via a change request" | clip
write-host -f red "Standard PA Memmory/CPU Message"
}

elseif ($ipf_hu)
{
write-output "change completed by marketing, exception rule for HU. please pass to marketing to investigate
to be reassigned to HU_IT_L1_Service_Desk" |  clip
write-host -f red "Standard Marketing Change Message"
}

write-host -f white -b red  " Do you wish to [Q]uit "  -nonewline
$restart =  Read-Host
}
until (($restart -eq 'Q') -or ($restart -eq 'q'))
