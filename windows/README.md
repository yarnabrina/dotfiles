# Steps

Run the following command to set up the profile:

```powershell
pwsh.exe -File .\powershell-setup.ps1
```

It may require the following:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

Alternatively, lines in `powershell-setup.ps1` can be executed manually to the same effect.

## Add Git Configurations

1. Install Git for Windows

```powershell
winget install -e --id Git.Git
```

2. Copy gitconfig

```powershell
Copy-Item ~\dotfiles\unix-like\git\global-git-configurations.gitconfig ~\.gitconfig
```

3. Copy gitignore

```powershell
Copy-Item ~\dotfiles\unix-like\git\global-git-ignore-files.gitignore ~\.gitignore
```

4. Copy gitattributes

```powershell
Copy-Item ~\dotfiles\unix-like\git\global-git-attributes.gitattributes ~\.gitattributes
```
