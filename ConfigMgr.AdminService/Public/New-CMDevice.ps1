function New-CMDevice {
    [cmdletbinding(DefaultParameterSetName="col")]    
    param (
        [parameter(Mandatory=$True, ParameterSetName="UUID")]
        [parameter(mandatory=$true, ParameterSetName="mac")]
        [parameter(mandatory=$true, ParameterSetName="Col")]
        [string]$Name,
        [parameter(Mandatory=$True, ParameterSetName="UUID")]
        [Parameter(Mandatory=$false, ParameterSetName="mac")]
        [parameter(mandatory=$true, ParameterSetName="Col")]
        [string]$SMBIOSGUID,
        [parameter(Mandatory=$false, ParameterSetName="UUID")]
        [parameter(mandatory=$false, ParameterSetName="mac")]
        [parameter(mandatory=$true, ParameterSetName="Col")]
        [string]$CollectionID,
        [parameter(mandatory=$true, ParameterSetName="mac")]
        [parameter(mandatory=$false, ParameterSetName="UUID")]
        [parameter(mandatory=$true, ParameterSetName="Col")]
        [string]$MacAddress,
        [parameter(mandatory=$true, ParameterSetName="Col")]
        [validatescript({ if ($pscmdlet.parametersetname -eq "col" -and $_ -eq $true) { $true } else {throw "Overwrite must be true to add to collection"}})]
        [switch]$overwrite

    )

    process {
    try {

        $Body = @{
          NetbiosName         = $Name
          OverwriteExistingRecord = $overwrite.tostring()
        }

        if ($smbiosguid) { $body.add("SMBIOSGUID") = $smbiosguid}
        if ($macaddress) { $body.add("MacAddress") = $MacAddress}

        $Result = Invoke-CMPost -URI "$($script:ASWmiURI)SMS_Site.ImportMachineEntry" -Body $Body
        #$result = $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*

        if ($CollectionID) {
          $colrule = new-cmdirectrule -ResourceId $result.resourceid -RuleName $name -Type Device
          $Body = @{
            NetbiosName       = $Name
            SMBIOSGUID = $SMBIOSGUID            
            MacAddress = $macaddress
            OverwriteExistingRecord = "true"
            AddToCollection = "true"
            CollectionRule = $colrule
            CollectionId = $CollectionID
          }
          $Result = Invoke-CMPost -URI "$($script:ASWmiURI)SMS_Site.ImportMachineEntry" -Body $Body
          #Return $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*

        }
        Return $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*
    }
    catch {
        throw $_
    }
    }
}