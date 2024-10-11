##########################################################
#  // pingcheck.ps1	by Chase Timmons		 #
#  // Ping a list of addresses to test connectivity      #
#  //  	 	                                         #
##########################################################

# List of addresses by name/IP
# Add additional nodes here
$items = @(
	[pscustomobject]@{Name="Location1";IP="1.1.1.1"}
	[pscustomobject]@{Name="Location2";IP="1.1.1.2"}
	[pscustomobject]@{Name="Location3";IP="1.1.1.3"}
)

#Reset the counter
$count = 0

# Clear the terminal window
Clear-Host	
# Print the title
"Ping Check"
# Print the date
Get-Date
"================================================"

# Loop through addresses and ping them once
# Incread -Count for additional pings
foreach ($i in $items)
{
	$count += 1
	if(Test-Connection -Cn $i.IP -BufferSize 16 -Count 1 -ea 0 -quiet)
	{
		Write-Host $count "`t" $i.Name "`t" $i.IP "is up" -ForegroundColor Green
	}
	else {Write-Host $count "`t" $i.Name "`t" $i.IP "is down" -ForegroundColor Red}
}

"================================================"
# Don't automatically close the window when done
pause
