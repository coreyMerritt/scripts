param (
    [string]$diskNumber
)

if (-not $diskNumber) {
    Write-Host "Usage: .\script.ps1 <diskNumber>"
    exit 1
}

$script = @"
select disk $diskNumber
clean
create partition primary
format fs=ntfs quick
assign
exit
"@

$script | diskpart

