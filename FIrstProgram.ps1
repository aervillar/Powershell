# Import Azure Powershell Module and Login if required
$pSubsc = Get-AzSubscription
If ($pSubsc.State -ne "Enabled") {
Import-Module -Name Az
Connect-AzAccount
$pSubsc = Get-AzSubscription }

# Define Azure Variables
$pResGroup = Get-AzResourceGroup 

Get-AzNetworkSecurityGroup
