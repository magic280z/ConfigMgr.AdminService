function New-CMDevice {
    [cmdletbinding()]
    param (
        [string]$Name,
        [string]$SMBIOSGUID,
        [string]$CollectionID,
        [string]$MacAddress,
        [switch]$overwrite,
        [CollectionType]$Type = "Device",
        [string]$Comment = "",
        [string]$LimitToCollectionID = "SMS00001"
    )
    try {

        $Body = @{
            NetBiosName         = $Name
            SMBIOSGUID = $SMBIOSGUID
            CollectionID        = $collectionid
            MacAddress = $macaddress
            OverwriteExistingRecord = $overwrite
        }

        $ExistingDevice = Get-CMDevice -Name $Name
        if ($ExistingDevice) {
            Write-Host "Another device exists with the name $($Name). Device not created." -ForegroundColor Yellow
            Return $ExistingDevice | Select-Object -Property * -ExcludeProperty _*, `@odata*
        }
        else {
            $Result = Invoke-CMPost -URI "$($script:ASWmiURI)/SMS_Site.ImportMachineEntry" -Body $Body
            Return $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*
        }
    }
    catch {
        throw $_
    }
}