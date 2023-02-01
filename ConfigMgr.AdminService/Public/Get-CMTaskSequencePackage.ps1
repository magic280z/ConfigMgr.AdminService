function Get-CMTaskSequencePackage {
    [cmdletbinding()]
    param (
      [string]$PackageID, 
      [string]$Name        
    )

    try {
        $Result = if ($AdvertisementID) {
            Invoke-CMGet -URI "$($script:ASWmiURI)SMS_TaskSequencePackage('$PackageID')" -verbose  
        }
        else {
          $FilterObjs = foreach ($key in ($PSBoundParameters.keys | Where-Object { $_ -notin ("Verbose","Debug") })) {
              Get-FilterObject $Key $PSBoundParameters[$key]
          }
          $Filter = $FilterObjs | Get-FilterString
          Invoke-CMGet -URI "$($script:ASWmiURI)SMS_TaskSequencePackage$($Filter)" -verbose
        }
        return $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*
    }
    catch {
      throw $_
    }
}