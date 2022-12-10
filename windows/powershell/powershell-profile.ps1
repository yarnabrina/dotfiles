# Import the modules
Import-Module PSReadLine

# Enable Prompt
oh-my-posh init pwsh --config "~\customised_powerlevel10k_lean.omp.json" | Invoke-Expression

# Enable Transient Prompt
Enable-PoshTransientPrompt

# Enable Predictive IntelliSense
Set-PSReadLineOption -PredictionSource History

# Move cursor to the end of history search
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

# Replace the current input with the 'previous' item from PSReadLine history that matches the characters between the start and the input and the cursor
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward

# Replace the current input with the 'next' item from PSReadLine history that matches the characters between the start and the input and the cursor
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Attempt to perform completion on the text surrounding the cursor. If there are multiple possible completions, the longest unambiguous prefix is used for completion
Set-PSReadLineKeyHandler -Key Tab -Function Complete

# Adjust the current selection to include the next word using ForwardWord
Set-PSReadLineKeyHandler -Chord "Ctrl+RightArrow" -Function ForwardWord
