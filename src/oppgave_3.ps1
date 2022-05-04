
[CmdletBinding()]
param (
    # parameter er ikke obligatorisk siden vi har default verdi
    [Parameter(HelpMessage = "URL til kortstokk", Mandatory = $false)]
    [string]
    # når paramater ikke er gitt brukes default verdi
    $UrlKortstokk = 'http://nav-deckofcards.herokuapp.com/shuffle'
)

$webRequest = Invoke-WebRequest -Uri $kortstokk


$ErrorActionPreference = 'Stop'

$webRequest = Invoke-WebRequest -Uri "http://nav-deckofcards.herokuapp.com/shuffle"

$kortstokkJson = $webRequest.Content

# se ./src/hints/kortstokk.json for formatert utgave

$kortstokk = ConvertFrom-Json -InputObject $kortstokkJson



foreach ($kort in $kortstokk) {
    Write-Output $kort
}

# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.1#subexpression-operator--

foreach ($kort in $kortstokk) {
    Write-Output "$($kort.suit[0])+$($kort.value)"
}

# 3. utgave - ønsker egentlig hele kortstokken som en streng og den koden som en funksjon (gjenbruk)

function kortstokkTilStreng {
    [OutputType([string])]
    param (
        [object[]]
        $kortstokk
    )
    $streng = " "
    foreach ($kort in $kortstokk) {
        $streng = $streng + "$($kort.suit[0])" + $($kort.value) +  ","
    }
    return $streng
}


Write-Output "Kortstokk: $(kortStokkTilStreng -kortstokk $kortstokk)"

# hvorfor kommer det et komma ',' etter siste kort?
# frivillig oppgave - kan du forbedre funksjonen 'kortTilStreng' - ikke skrive ut komma etter siste kort?