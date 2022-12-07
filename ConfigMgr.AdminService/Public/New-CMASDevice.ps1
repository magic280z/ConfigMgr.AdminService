function New-CMASDevice {
    [cmdletbinding()]    
    param (
        [parameter(Mandatory=$True, ParameterSetName="SMBIOSGUID",HelpMessage="Target computer desired netbiosname")]
        [parameter(mandatory=$true, ParameterSetName="MacAddress",HelpMessage="Target computer desired netbiosname")]
        [parameter(mandatory=$true, ParameterSetName="Add_Collection",HelpMessage="Target computer desired netbiosname")]
        [string]$Name,
        [parameter(Mandatory=$True, ParameterSetName="SMBIOSGUID",HelpMessage="Target computer BIOS UUID/GUID")]
        [Parameter(Mandatory=$false, ParameterSetName="MacAddress",HelpMessage="Target computer BIOS UUID/GUID")]
        [parameter(mandatory=$true, ParameterSetName="Add_Collection",HelpMessage="Target computer BIOS UUID/GUID")]
        [string]$SMBIOSGUID,
        [parameter(mandatory=$true, ParameterSetName="Add_Collection",HelpMessage="Collection to add computer to")]
        [string]$CollectionID,
        [parameter(mandatory=$true, ParameterSetName="MacAddress",HelpMessage="Target computer WinPE MAC Address")]
        [parameter(mandatory=$false, ParameterSetName="SMBIOSGUID",HelpMessage="Target computer WinPE MAC Address")]
        [parameter(mandatory=$true, ParameterSetName="Add_Collection",HelpMessage="Target computer WinPE MAC Address")]
        [string]$MacAddress,
        [parameter(mandatory=$true, ParameterSetName="Add_Collection",HelpMessage="Overwrite current device record.  Must be true when adding to collection.")]
        [validatescript({ if ($CollectionID -and $_ -eq $true) { $True } else {throw "Overwrite must be true to add to collection $($pscmdlet.parametersetname) $_"}})]
        [switch]$overwrite

    )

    process {
    try {

        $Body = @{
          NetbiosName         = $Name
          OverwriteExistingRecord = $overwrite.tostring()
        }

        if ($smbiosguid) { $body.add("SMBIOSGUID",$smbiosguid)}
        if ($macaddress) { $body.add("MACAddress",$MacAddress)}

        #$body

        $Result = Invoke-CMPost -URI "$($script:ASWmiURI)SMS_Site.ImportMachineEntry" -Body $Body
        #$result = $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*

        if ($CollectionID) {
          $colrule = new-cmdirectrule -ResourceId $result.resourceid -RuleName $name -Type Device
          $Body = @{
            NetbiosName       = $Name
            SMBIOSGUID = $SMBIOSGUID            
            MACAddress = $macaddress
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