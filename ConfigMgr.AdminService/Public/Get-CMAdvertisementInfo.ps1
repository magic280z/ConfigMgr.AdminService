function Get-CMAdvertisementInfo {
    [cmdletbinding()]
    param (
        [string]$CollectionID,
        [string[]]$AdvertisementID
    )

    try {
        $Result = if ($AdvertisementID.Count -eq 1) {
          Write-Verbose "direct get"
            Invoke-CMGet -URI "$($script:ASWmiURI)SMS_AdvertisementInfo('$AdvertisementID')"
        }
        elseif ($AdvertisementID -is [array]) {

          write-verbose "advertisement array"

          $FilterObjs = $AdvertisementID | foreach-object {get-filterobject "AdvertisementID" $_}

          #$FilterObjs

          $Filter = Get-FilterString -jointype or -FilterObjs $FilterObjs

          #$filter
          Invoke-CMGet -URI "$($script:ASWmiURI)SMS_AdvertisementInfo$($Filter)"
        } else {
          Write-Verbose "building filter"
          $FilterObjs = foreach ($key in ($PSBoundParameters.keys | Where-Object { $_ -notin ("Verbose","Debug") })) {
              Get-FilterObject $Key $PSBoundParameters[$key]
          }
          $Filter = $FilterObjs | Get-FilterString 
          Invoke-CMGet -URI "$($script:ASWmiURI)SMS_AdvertisementInfo$($Filter)"
        }
        return $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*
    }
    catch {
      throw $_
    }
}