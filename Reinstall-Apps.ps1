#Requires -RunAsAdministrator

[CmdletBinding(SupportsShouldProcess)]
param (
    [string[]]$AppsToInstall
)

function Reinstall-Apps {
    param (
        [string[]]$appsList
    )

    foreach ($app in $appsList) {
        Write-Output "Attempting to reinstall $app..."
        try {
            winget install --accept-source-agreements --accept-package-agreements --id $app
        }
        catch {
            Write-Host "Error: Failed to reinstall $app. It might not be available in the winget repository or the package name is incorrect." -ForegroundColor Red
        }
    }
}

Reinstall-Apps -appsList $AppsToInstall
