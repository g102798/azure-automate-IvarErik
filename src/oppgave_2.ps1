[CmdletBinding()]
param (
    [Parameter(HelpMessage = "Ivar Erik", Mandatory = $true)]
    [string]
    $Navn
)
Write-Host "Hei $Navn"