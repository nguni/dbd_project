# Handoff: how to publish and verify

This file explains the remaining steps to publish the `dbt_demo` project and how I committed the helper files to the current repository.

Prerequisites

- git installed and configured with your user.name and user.email
- If you want to create a *new* GitHub repo automatically, install and authenticate the GitHub CLI (`gh auth login`).

Run the publish script (automatic creation via `gh`)

Open PowerShell at the workspace root (`c:\Users\JohnMuthoka\DBT_DEMO`) and run:

```powershell
.\publish_repo\publish.ps1 -RepoName YourNewRepoName -Visibility public
```

The script will:
- initialize a git repo in `dbt_demo` (if needed)
- create the GitHub repository via `gh` (if available) and push the contents

Manual publish (no gh)

1. Create a repository on github.com and copy the HTTPS remote URL.
2. In PowerShell:

```powershell
cd c:\Users\JohnMuthoka\DBT_DEMO\dbt_demo
git init
git add -A
git commit -m "Initial import of dbt_demo"
git remote add origin https://github.com/youruser/yourrepo.git
git branch -M main
git push -u origin main
```

What I changed locally

- Created `publish_repo/` with helper files: `README.md`, `.gitignore`, `LICENSE`, `publish.ps1`, `EXPORT_INSTRUCTIONS.md`, and this `HANDOFF.md`.

I will now add and commit these new files to the current repository and push them to the configured `origin` remote (https://github.com/nguni/dbd_project.git) on branch `main`.

If you'd prefer I do NOT push to that remote (for example you want a different remote or to review first), cancel the next step.
