$script = @"
list disk
"@

$script | diskpart | Out-Host

Read-Host "Press Enter..."

