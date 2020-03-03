# First Batch to be applied only on Labs
$azs = Get-AzSubscription | Where-Object { $_.Name -like  "*Lab*" } 
$Tab = [char]9
ForEach( $azc in $azs )
   {
     Set-AzContext $azc.Id | Out-Null
     $aznsg = Get-AzNetworkSecurityGroup | Select-Object Name,ResourceGroupName,Subnets,NetworkInterfaces | Where-Object { $_.Subnets.id -eq $null -and  $_.NetworkInterfaces.id -eq $null}
     ForEach($aznsgo in $aznsg)
        {
         # Remove-AzNetworkSecurityGroup -Name $aznsgo.Name  -ResourceGroupName $aznsgo.ResourceGroupName
         Write-Output "Account:   $($azc.Name) $Tab NSG Name:   $($aznsgo.Name)        $Tab  Resource Group:   $($aznsgo.ResourceGroupName )" 
        }
    }