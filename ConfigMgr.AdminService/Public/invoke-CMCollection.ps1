function invoke-CMCollection {
    [cmdletbinding()]
    param (
        [parameter(mandatory=$true)]
        [string]$CollectionID,
        [parameter(mandatory=$true)]
        [string]$Method
    )


    if ($method){
      try {

        #$body = [hashtable]$psboundparameters

        #$body.remove('Method')

        $Result = Invoke-CMPost -URI "$($script:ASWmiURI)SMS_Collection('$collectionid')/AdminService.$method" -Body $Body
        return $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*
      } catch {
        throw $_
      }
    }

    try {
        $Result = if ($CollectionID) {
            Invoke-CMGet -URI "$($script:ASWmiURI)SMS_Collection('$($CollectionID)')"    
        }
        else {
            $FilterObjs = foreach ($key in ($PSBoundParameters.keys | Where-Object { $_ -notin ("CollectionID","Verbose","Debug") })) {
                Get-FilterObject $Key $PSBoundParameters[$key]
            }
            $Filter = $FilterObjs | Get-FilterString
            Invoke-CMGet -URI "$($script:ASWmiURI)SMS_Collection$($Filter)"
        }
        return $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*
    }
    catch {

    }
}