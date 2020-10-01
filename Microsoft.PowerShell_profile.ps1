function Set-AwsProfile {
    param(
        [string]$ProfileName
    )

    $env:AWS_PROFILE = $ProfileName
}

function Get-AwsProfile {
    Write-Host $env:AWS_PROFILE
}

function Out-Edge {
    [CmdletBinding()]
    Param(
        [ValidateNotNullOrEmpty()]
        [string]$FilePath = ".\index.html"
    )

    $FullPath = (Convert-Path -path $Filepath).Replace('\', '/')
    $Uri = "file:///$FullPath"
    Write-Verbose $Uri
    Start-Process "msedge" "$Uri"
}

function Set-Export {
    [CmdletBinding()]
    param (
        [string]$Declaration
    )
    $Option = [System.StringSplitOptions]::RemoveEmptyEntries
    $KeyValue = $Declaration.Split("=", 2, $Option)
    [System.Environment]::SetEnvironmentVariable($KeyValue[0], $KeyValue[1])
}

Set-Alias -Name export Set-Export
