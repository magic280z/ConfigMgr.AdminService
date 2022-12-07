function Get-CMASTaskSequence {
    [cmdletbinding()]
    param (
        [parameter(mandatory=$true)]
        [string]$PackageID
    )

    try {
        $Result = if ($CI_ID) {
            Invoke-CMGet -URI "$($script:ASWmiURI)SMS_TaskSequencePackage($($packageid))"
        }
        else {
            $FilterObjs = foreach ($key in ($PSBoundParameters.keys | Where-Object { $_ -notin ("Verbose", "Debug")})) {
                Get-FilterObject $Key $PSBoundParameters[$key]
            }
            #write-host $filter.tostring()
            $Filter = $FilterObjs | Get-FilterString

            Invoke-CMGet -URI "$($script:ASWmiURI)SMS_TaskSequencePackage$($Filter)"
  
        }
        return $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*


    }
    catch {

    }
}
