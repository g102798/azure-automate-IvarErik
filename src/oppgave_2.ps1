[CmdletBinding()]
param (
    [Parameter(HelpMessage = "Ivar Erik", Mandatory = $true)]
    [string]
    $Navn,
    $status
)
Write-Host "Hei $Navn $status"