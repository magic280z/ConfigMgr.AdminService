function Get-CMAdvertisement {
    [cmdletbinding()]
    param (
        [string]$CollectionID,
        [string]$AdvertisementID,
        [parameter(HelpMessage="SMS_Advertisement method to execute")]
        [ValidateSet("GetAdvertisements","GetNextID","RiskyDeploymentStatusMessage")]
        [string]$Method,
        [parameter(HelpMessage="configmgr resourceid")]
        [int64]$ResourceID,
        [string]$ProgramName
    )

    #execute method getadvertisements
    if ($method){
      try {

        $body = [hashtable]$psboundparameters

        $body.remove('Method')

        $Result = Invoke-CMPost -URI "$($script:ASWmiURI)SMS_Advertisement.$method" -Body $Body -verbose
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