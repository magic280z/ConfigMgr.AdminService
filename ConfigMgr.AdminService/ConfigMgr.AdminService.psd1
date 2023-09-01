#
# Module manifest for module 'ConfigMgr.AdminService'
#
# Generated by: Adam Gross (@AdamGrossTX)
#
# Generated on: 9/1/2023
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'ConfigMgr.AdminService.psm1'

# Version number of this module.
ModuleVersion = '1.0.230901'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '144dd97b-9025-48bd-837f-a9fb2fa2cb20'

# Author of this module
Author = 'Adam Gross (@AdamGrossTX)'

# Company or vendor of this module
CompanyName = 'A Square Dozen'

# Copyright statement for this module
Copyright = '(c) Adam Gross. All rights reserved.'

# Description of the functionality provided by this module
Description = 'This is a new build'

# Minimum version of the Windows PowerShell engine required by this module
# PowerShellVersion = ''

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Add-CMCollectionRule', 'Add-CMCollectionRules', 'Approve-CMScript', 
               'Deny-CMScript', 'Get-CMAdvertisement', 'Get-CMAdvertisementInfo', 
               'Get-CMApplication', 'Get-CMAuthToken', 'Get-CMAuthTokenInsecure', 
               'Get-CMCollection', 'Get-CMDeployment', 'Get-CMDevice', 
               'Get-CMDeviceExtensionData', 'Get-CMDeviceWMI', 'Get-CMEntity', 
               'Get-CMFullCollectionMembership', 'Get-CMKeyVault', 
               'Get-CMObjectName', 'Get-CMPackage', 'Get-CMScript', 
               'Get-CMScriptResult', 'Get-CMTaskSequence', 
               'Get-CMTaskSequencePackage', 'Get-CMUser', 
               'Get-CMUserMachineRelationship', 'Initialize-CMAdminService', 
               'Invoke-ClientAction', 'Invoke-CMApplicationInstall', 
               'Invoke-CMApplicationUninstall', 'invoke-CMCollection', 
               'Invoke-CMRunScript', 'New-CMApplication', 'New-CMCollection', 
               'New-CMDevice', 'New-CMDeviceExtensionData', 'New-CMDirectRule', 
               'New-CMKeyVault', 'New-CMMsiApplicationObject', 'New-CMScript', 
               'New-CMScriptApplicationObject', 'New-CMUserMachineRelationship', 
               'Remove-CMCollection', 'Remove-CMDevice', 'Remove-CMUser', 
               'Remove-CMUserMachineRelationship', 'Set-CMConfig', 
               'Set-CMDeviceExtensionData', 'Set-CMKeyVaultValues'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = 'Add-CMCollectionRule', 'Add-CMCollectionRules', 'Approve-CMScript', 
               'Deny-CMScript', 'Get-CMAdvertisement', 'Get-CMAdvertisementInfo', 
               'Get-CMApplication', 'Get-CMAuthToken', 'Get-CMAuthTokenInsecure', 
               'Get-CMCollection', 'Get-CMDeployment', 'Get-CMDevice', 
               'Get-CMDeviceExtensionData', 'Get-CMDeviceWMI', 'Get-CMEntity', 
               'Get-CMFullCollectionMembership', 'Get-CMKeyVault', 
               'Get-CMObjectName', 'Get-CMPackage', 'Get-CMScript', 
               'Get-CMScriptResult', 'Get-CMTaskSequence', 
               'Get-CMTaskSequencePackage', 'Get-CMUser', 
               'Get-CMUserMachineRelationship', 'Initialize-CMAdminService', 
               'Invoke-ClientAction', 'Invoke-CMApplicationInstall', 
               'Invoke-CMApplicationUninstall', 'invoke-CMCollection', 
               'Invoke-CMRunScript', 'New-CMApplication', 'New-CMCollection', 
               'New-CMDevice', 'New-CMDeviceExtensionData', 'New-CMDirectRule', 
               'New-CMKeyVault', 'New-CMMsiApplicationObject', 'New-CMScript', 
               'New-CMScriptApplicationObject', 'New-CMUserMachineRelationship', 
               'Remove-CMCollection', 'Remove-CMDevice', 'Remove-CMUser', 
               'Remove-CMUserMachineRelationship', 'Set-CMConfig', 
               'Set-CMDeviceExtensionData', 'Set-CMKeyVaultValues'

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'configmgr','osd'

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        # ProjectUri = ''

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '
{{NewVersion}}
    - initial build'

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        ExternalModuleDependencies = @('Az.KeyVault','msal.ps','Microsoft.PowerShell.SecretManagement')

    } # End of PSData hashtable

 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

