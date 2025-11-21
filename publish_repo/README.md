# publish_repo

This folder contains helper files to create a new GitHub repository and publish the local `dbt_demo` project.

Files included:

- `publish.ps1` - PowerShell script that uses the GitHub CLI (`gh`) to create a repo and push the `dbt_demo` folder.
- `.gitignore` - sensible defaults for a dbt/Python project.
- `LICENSE` - MIT license template.
- `EXPORT_INSTRUCTIONS.md` - manual steps and troubleshooting when `gh` is not available.

Prerequisites

- `git` installed and available in PATH
- `gh` (GitHub CLI) installed and authenticated (recommended)
- PowerShell (Windows PowerShell 5.1 or newer)

Quick usage

Open PowerShell in the repository root (`c:\Users\JohnMuthoka\DBT_DEMO`) and run:

```powershell
.\publish_repo\publish.ps1 -RepoName MyNewRepo -Visibility public
```

This will create a GitHub repository and push the local `dbt_demo` folder as the repository contents.
