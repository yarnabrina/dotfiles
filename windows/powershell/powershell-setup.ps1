# install module to customise command line editing
Install-Module PSReadLine

# install custom prompt engine
winget install oh-my-posh

# # link powershell prompt configuration (need administrative rights)
# New-Item ~/customised_powerlevel10k_lean.omp.json -ItemType SymbolicLink -Target prompt-configurations.json

# copy powershell prompt configuration
Copy-Item prompt-configurations.json ~/customised_powerlevel10k_lean.omp.json

# # link powershell profile script (need administrative rights)
# New-Item $profile -ItemType SymbolicLink -Target powershell-profile.ps1

# copy powershell profile script
Copy-Item powershell-profile.ps1 $profile
