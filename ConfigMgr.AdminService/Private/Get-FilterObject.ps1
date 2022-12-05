function Get-FilterObject {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Property,

        [Parameter(Mandatory = $false)]
        [string]$Value,

        [Parameter(Mandatory = $false)]
        [string]$Operator = "eq"
    )

    $Value = if ($Value -is [SourceType] -or $Value -is [ClientAction] -or $Value -is [RelationshipType] -or $Value -is [collectionType]) {
        $Value.Value__
    }
    else {
        $Value
    }
    if ($value -eq "True") {
      [PSCustomObject]@{
          Property = $Property
      }

    } else {
      [PSCustomObject]@{
          Property = $Property
          Operator = $Operator
          Value    = $Value
      }
    }
}