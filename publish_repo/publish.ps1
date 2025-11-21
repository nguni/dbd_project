param(
    [Parameter(Mandatory=$true)]
    [string]$RepoName,

    [Parameter(Mandatory=$false)]
    [ValidateSet('public','private')]
    [string]$Visibility = 'public',

    [Parameter(Mandatory=$false)]
    [string]$Owner = ''
)

# publish.ps1
# Creates a new GitHub repo using gh (if available) and pushes the local `dbt_demo` folder.

function Write-ErrAndExit($msg){ Write-Host $msg -ForegroundColor Red; exit 1 }

$root = Split-Path -Parent $MyInvocation.MyCommand.Definition
$projectDir = Join-Path $root '..' | Resolve-Path -Relative
$projectDir = (Resolve-Path (Join-Path $root '..\dbt_demo')).ProviderPath

if (-not (Test-Path $projectDir)){
    Write-ErrAndExit "Project folder not found: $projectDir"
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)){
    Write-ErrAndExit "git not found in PATH. Install git and try again."
}

$useGh = (Get-Command gh -ErrorAction SilentlyContinue) -ne $null

Push-Location $projectDir
try {
    if (-not (Test-Path .git)){
        git init | Out-Null
        git add -A
        git commit -m "Initial import of dbt_demo" | Out-Null
    }

    if ($useGh){
        $ownerArg = if ($Owner -ne '') { "--owner $Owner" } else { "" }
        gh repo create $RepoName --$Visibility $ownerArg --source=. --remote=origin --push --confirm
        if ($LASTEXITCODE -ne 0){ Write-ErrAndExit "gh repo create failed with exit $LASTEXITCODE" }
    } else {
        Write-Host "gh (GitHub CLI) not found; creating repo manually."
        $remoteUrl = Read-Host 'Enter the Git remote URL (e.g. https://github.com/user/repo.git)'
        git remote add origin $remoteUrl
        git push -u origin main
    }
    Write-Host "Repository published: $RepoName"
} finally { Pop-Location }
