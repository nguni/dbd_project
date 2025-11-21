# Export Instructions

If the `publish.ps1` script can't run because `gh` is not available or you prefer manual control, follow these steps.

1. Create a new repository on GitHub via the website. Note the HTTPS remote URL (e.g. `https://github.com/youruser/yourrepo.git`).
2. In PowerShell, run:

```powershell
cd c:\Users\JohnMuthoka\DBT_DEMO\dbt_demo
git init
git add -A
git commit -m "Initial import of dbt_demo"
git remote add origin https://github.com/youruser/yourrepo.git
git branch -M main
git push -u origin main
```

Troubleshooting

- If push fails due to authentication, set up a personal access token or use `gh auth login` to authenticate.
- To keep history out of the exported repo, create an archive instead:

```powershell
cd c:\Users\JohnMuthoka\DBT_DEMO
Compress-Archive -Path dbt_demo\* -DestinationPath dbt_demo.zip
```
