function CleanSecGroups {
# Parameter help description

[CmdletBinding(SupportsShouldProcess=$true,
   ConfirmImpact="High")]
    Param
    (
        # Specifies the name of the subscriptions to clean up or list Security groups
        # The variable can be used for like command. For example, to set all Lab accounts use "*Lab*"
        [Parameter(Mandatory=$true)]
        [string]$AzSubscriptionInputParam,

        [Parameter(Mandatory=$true)]
        [ValidateSet('List','Remove')]
        [string]$ListRemove 

    )

    Begin
    {
        
    }

    Process 
    {
        # First Batch to be applied only on Labs
        $azs = Get-AzSubscription | Where-Object { $_.Name -like  $AzSubscriptionInputParam } 
        $Tab = [char]9
        ForEach( $azc in $azs )
        {        
            Set-AzContext $azc.Id | Out-Null
            $aznsg = Get-AzNetworkSecurityGroup | Select-Object Name,ResourceGroupName,Subnets,NetworkInterfaces | Where-Object { $_.Subnets.id -eq $null -and  $_.NetworkInterfaces.id -eq $null}
            ForEach($aznsgo in $aznsg)
            {
                If ($ListRemove  -eq "List") {
                    Write-Output "Account:   $($azc.Name) $Tab NSG Name:   $($aznsgo.Name)        $Tab  Resource Group:   $($aznsgo.ResourceGroupName )"  
                } Elseif ($ListRemove -eq "Remove") {
                    Remove-AzNetworkSecurityGroup -Name $aznsgo.Name  -ResourceGroupName $aznsgo.ResourceGroupName -WhatIf
                } Else {
                    Write-Error -Message "Problem wih Input Parameters. Need to choose List or Remove"
                }
                       
            }
        }
    }

}