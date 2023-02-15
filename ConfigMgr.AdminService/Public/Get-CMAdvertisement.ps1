function Get-CMAdvertisement {
    [cmdletbinding()]
    param (
        [string]$CollectionID,
        [string]$AdvertisementID,
        [parameter(Mandatory=$True, ParameterSetName="GetAdvertisements",HelpMessage="Method get resource advertisement")]
        [switch]$GetAdvertisements,
          [parameter(Mandatory=$True, ParameterSetName="GetAdvertisements",HelpMessage="configmgr resourceid")]
        [int]$ResourceID
    )

    #execute method getadvertisements
    if ($getadvertisements){
      try {
        $Body = @{
          ResourceID         = $ResourceId          
        }

        #$Body

        $Result = Invoke-CMPost -URI "$($script:ASWmiURI)SMS_Advertisement.GetAdvertisements" -Body $Body -verbose
        return $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*
      } catch {
        throw $_
      }
    } else {
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
}