function Get-CMEntity {
    [cmdletbinding()]
    param (
            
    )

    try {
        $Result = if (!($PSBoundParameters.keys)) {
            Invoke-CMGet -URI "$($script:ASVerURI)"
        }
        else {
          $FilterObjs = foreach ($key in ($PSBoundParameters.keys | Where-Object { $_ -notin ("Verbose","Debug") })) {
              Get-FilterObject $Key $PSBoundParameters[$key]
          }
          $Filter = $FilterObjs | Get-FilterString
          Invoke-CMGet -URI "$($script:ASVerURI)$($Filter)"
        }
        return $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*
    }
    catch {
      throw $_
    }
}