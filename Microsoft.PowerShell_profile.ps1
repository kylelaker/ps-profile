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
