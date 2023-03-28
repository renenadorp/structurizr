Import-Module -Name Az
Connect-AzAccount
$vmName = 'WingtiptoysVM'
$resourceGroup = 'WingtiptousRG'

$adminCredential = Get-Credential -Message "Enter a username and password for the VM admin."
New-AzVM -ResourceGroupName $resourceGroup -Name $vmName -Credential $adminCredential -Image UbuntuLTS
