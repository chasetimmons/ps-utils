##########################################################
#  // pingcheck.ps1	by Chase Timmons		 			#
#  //                                           		#
#  //  	 	                                            #
##########################################################

# List of Addresses by Name/IP	  
$items = @(
    [pscustomobject]@{Name="Location1";IP="1.1.1.1"}
	[pscustomobject]@{Name="Location2";IP="1.1.1.2"}
	[pscustomobject]@{Name="Location3";IP="1.1.1.3"}
)

$count = 0

Clear-Host		
"Ping Check"
Get-Date
"================================================"

# Loop through addresses and ping them once
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

pause