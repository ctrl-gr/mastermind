$ErrorActionPreference = 'Stop'

$pluginRoot = Split-Path -Parent $PSScriptRoot
$source = Join-Path $pluginRoot 'assets\agents'
$destination = Join-Path $env:USERPROFILE '.codex\agents'
$globalGuidanceSource = Join-Path $pluginRoot 'assets\global\AGENTS.md'
$globalGuidanceDestination = Join-Path $env:USERPROFILE '.codex\AGENTS.md'
$globalOverrideDestination = Join-Path $env:USERPROFILE '.codex\AGENTS.override.md'

New-Item -ItemType Directory -Path $destination -Force | Out-Null
Copy-Item -LiteralPath (Join-Path $source 'test-engineer.toml') -Destination (Join-Path $destination 'test-engineer.toml') -Force
Copy-Item -LiteralPath (Join-Path $source 'code-reviewer.toml') -Destination (Join-Path $destination 'code-reviewer.toml') -Force

Write-Output "Installed test_engineer and code_reviewer in $destination"

if (-not (Test-Path -LiteralPath $globalGuidanceDestination) -and -not (Test-Path -LiteralPath $globalOverrideDestination)) {
    Copy-Item -LiteralPath $globalGuidanceSource -Destination $globalGuidanceDestination
    Write-Output "Installed global Mastermind guidance in $globalGuidanceDestination"
}
else {
    Write-Warning 'Global Codex guidance already exists. Mastermind did not overwrite it.'
}
