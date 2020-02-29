function CleanupAzureNetworkInterfaces
{

[CmdletBinding(SupportsShouldProcess=$true,
   ConfirmImpact="High")]

Param
{
    # Specify Name of Resource Group from which Network Interfaces are to be retrieved
    [Parameter (Mandatory=$true,
                ValueFromPipelineByPropertyName=$true,
                Position=0)]
    [string]$ResourceGroup,
    [switch]$ListOnly
}

Begin
{
    If 
}


}
