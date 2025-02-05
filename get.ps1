# Get the directory of the running script (current directory)
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Set the target directory for Google Fonts
$targetDir = Join-Path -Path $scriptDir -ChildPath "google_fonts"

# Create the target directory if it doesn't exist
if (-not (Test-Path -Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir
}

# Find all .ttf files in the subdirectories of the current script directory
$ttfFiles = Get-ChildItem -Path $scriptDir -Recurse -Filter "*.ttf"

# Move the .ttf files to the target directory
foreach ($file in $ttfFiles) {
    $targetPath = Join-Path -Path $targetDir -ChildPath $file.Name

    # Move the file
    Move-Item -Path $file.FullName -Destination $targetPath

    Write-Host "Moved: $($file.Name) to $targetDir"
}

Write-Host "All .ttf files have been moved to $targetDir"
