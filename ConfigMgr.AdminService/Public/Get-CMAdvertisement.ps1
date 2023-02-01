function Get-CMAdvertisement {
    [cmdletbinding()]
    param (
        [string]$CollectionID,
        [string]$AdvertisementID
    )

    try {
        $Result = if ($DeploymentID) {
            Invoke-CMGet -URI "$($script:ASWmiURI)SMS_Advertisement($AdvertisementID)"    
        }
        else {
          $FilterObjs = foreach ($key in ($PSBoundParameters.keys | Where-Object { $_ -notin ("Verbose","Debug") })) {
              Get-FilterObject $Key $PSBoundParameters[$key]
          }
          $Filter = $FilterObjs | Get-FilterString
          Invoke-CMGet -URI "$($script:ASWmiURI)SMS_Advertisement$($Filter)"
        }
        return $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*
    }
    catch {
      throw $_
    }
}