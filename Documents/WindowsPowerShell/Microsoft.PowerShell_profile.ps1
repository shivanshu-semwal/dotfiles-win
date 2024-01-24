# function to open the profile file
# open file use this
# function Pro {code $PROFILE}
# open workspace use this
# function Pro {code $((Split-Path $profile -Parent))}

# modules
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'

Write-Output "Loding config...."
oh-my-posh init pwsh --config ~/.oh_my_posh.json | Invoke-Expression

# psreadline
# Get-PSReadLineKeyHandler - list all the keybindings
if ($host.Name -eq 'ConsoleHost') {
    Write-Output "Loading Kebinds...."
    Import-Module PSReadLine
    Set-PSReadLineOption -EditMode Emacs
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
    Set-PSReadlineOption -BellStyle None
    # fzf

    Write-Output "Loading fzf..."
    Import-Module PSFzf
    # replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
    Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
    # Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
}

# git in the prompt
Import-Module posh-git

# icons for files in terminal
Write-Output "Loading Icons"
Import-Module Terminal-Icons

# jump location module
Write-Output "loading zoxide"
Import-Module ZLocation

function gotToParent() { Set-Location .. }
function lss() { Get-ChildItem | Format-Wide }

Write-Output "loading alias.."
# some simple alias
Set-Alias -Name l -Value lss
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name touch -Value New-Item
Set-Alias -Name .. -Value gotToParent

# Invoke-Expression (& {
#     $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
#     (zoxide init --hook $hook powershell | Out-String)
# })