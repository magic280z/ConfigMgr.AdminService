function Get-CMCollection {
    [cmdletbinding()]
    param (
        [string]$CollectionID,
        [string]$Name,
        [CollectionType]$CollectionType,
        [string]$ObjectPath
    )

    try {
        $Result = if ($CollectionID) {
            Invoke-CMGet -URI "$($script:ASWmiURI)SMS_Collection('$($CollectionID)')"    
        }
        else {
            $FilterObjs = foreach ($key in ($PSBoundParameters.keys | Where-Object { $_ -notin ("CollectionID","Verbose","Debug") })) {
                Get-FilterObject $Key $PSBoundParameters[$key]
            }
            $Filter = $FilterObjs | Get-FilterString
            Invoke-CMGet -URI "$($script:ASWmiURI)SMS_Collection$($Filter)" -verbose
        }
        return $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*
    }
    catch {

    }
}