function Get-CMFullCollectionMembership {
    [cmdletbinding()]
    param (
        [parameter(mandatory=$true,ParameterSetName='Key')]
        [string]$CollectionID,
        [string]$Name,
        [CollectionType]$CollectionType,
        [string]$ObjectPath,
        [parameter(mandatory=$true,ParameterSetName='Key')]
        [int64]$ResourceID
    )

    try {
        $Result = if ($CollectionID) {
            Invoke-CMGet -URI "$($script:ASWmiURI)SMS_FullCollectionMembership(CollectionID='$($CollectionID)',ResourceID=$resourceid)"    
        }
        else {
            $FilterObjs = foreach ($key in ($PSBoundParameters.keys | Where-Object { $_ -notin ("Verbose","Debug") })) {
                Get-FilterObject $Key $PSBoundParameters[$key]
            }
            $Filter = $FilterObjs | Get-FilterString
            Invoke-CMGet -URI "$($script:ASWmiURI)SMS_FullCollectionMembership$($Filter)"
        }
        return $Result | Select-Object -Property * -ExcludeProperty _*, `@odata*
    }
    catch {

    }
}