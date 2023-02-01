function Get-CMAdvertisementInfo {
    [cmdletbinding()]
    param (
        [string]$CollectionID,
        [string]$AdvertisementID
    )

    try {
        $Result = if ($AdvertisementID) {
            Invoke-CMGet -URI "$($script:ASWmiURI)SMS_AdvertisementInfo('$AdvertisementID')" -verbose  
        }
        else {
          $FilterObjs = foreach ($key in ($PSBoundParameters.keys | Where-Object { $_ -notin ("Verbose","Debug") })) {
              Get-FilterObject $Key $PSBoundParameters[$key]
          }
          $Filter = $FilterObjs | Get-FilterString
          Invoke-CMGet -URI "$($script:ASWmiURI)SMS_AdvertisementInfo$($Filter)" -verbose
        }
        return $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*
    }
    catch {
      throw $_
    }
}