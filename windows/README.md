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
