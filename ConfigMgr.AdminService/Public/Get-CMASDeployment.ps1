function Get-CMASDeployment {
    [cmdletbinding()]
    param (
        [string]$CollectionID
    )

    try {
        $FilterObjs = foreach ($key in ($PSBoundParameters.keys | Where-Object { $_ -notin ("Verbose","Debug") })) {
            Get-FilterObject $Key $PSBoundParameters[$key]
        }
        $Filter = $FilterObjs | Get-FilterString
        Invoke-CMGet -URI "$($script:ASWmiURI)SMS_Advertisement$($Filter)" -verbose

        return $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*
    }
    catch {

    }
}