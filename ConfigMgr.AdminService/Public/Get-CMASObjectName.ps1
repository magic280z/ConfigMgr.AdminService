function Get-CMASObjectName {
    [cmdletbinding()]
    param (
        [string]$ObjectKey
    )

    try {
        $FilterObjs = foreach ($key in ($PSBoundParameters.keys | Where-Object { $_ -notin ("Verbose","Debug") })) {
            Get-FilterObject $Key $PSBoundParameters[$key]
        }
        $Filter = $FilterObjs | Get-FilterString
        Invoke-CMGet -URI "$($script:ASWmiURI)SMS_ObjectName$($Filter)"

        return $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*
    }
    catch {

    }
}