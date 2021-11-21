param (
    [Parameter(Mandatory=$false)] 
    [String]  $ResourceGroupName = 'rg-JackChan'
)

function log
{
   param([string]$message)
   "`n`n$(get-date -f o)  $message" 
}

$runningVM = (Get-AzVM -ErrorAction Stop -ResourceGroupName $ResourceGroupName -Name "vm-testinstall*").Name

foreach($vm in $runningVM){
    Log "The $VM has started the FSlogix installation"
    Invoke-AzVMRunCommand -ResourceGroupName $ResourceGroupName -Name $vm -CommandId 'RunPowerShellScript' -ScriptPath 'install_fxlogics.ps1'
    Log "The $VM has completed the FSlogix installation"
}

