<#
Check VMs to see if they're using Azure Hybrid Windows Licensing
1/29/2020 - Initial Script
#>

$subscriptions = get-azurermsubscription
foreach ($subscription in $subscriptions)
{
	Set-AzureRmContext -SubscriptionName $subscription.name
	$vms = get-azurermvm
	foreach($vm in $vms) {"VM Name: " +$vm.Name, " Azure Hybrid Benefit for Windows Server: "+ $vm.LicenseType}
}


<#
Sample output. VMs with Windows_Server have hybrid licensing enabled.
VM Name: ATXNMFW011  Azure Hybrid Benefit for Windows Server:
VM Name: atxnmnd006  Azure Hybrid Benefit for Windows Server:
VM Name: ATXNMPS001  Azure Hybrid Benefit for Windows Server:
VM Name: atxssdc002  Azure Hybrid Benefit for Windows Server: Windows_Server
VM Name: avanmps001  Azure Hybrid Benefit for Windows Server:
VM Name: avanmpv002  Azure Hybrid Benefit for Windows Server:
VM Name: hardenedwin2012  Azure Hybrid Benefit for Windows Server:
VM Name: avasmdb002  Azure Hybrid Benefit for Windows Server:
#>