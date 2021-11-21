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
    $job = Invoke-AzVMRunCommand -ErrorAction Stop -ResourceGroupName $ResourceGroupName -VMName $vm -CommandId 'RunPowerShellScript' -ScriptPath 'install_fxlogics.ps1' -AsJob

    if ($job.value.Message -like '*error*') 
    {  

        Write-Output "Failed. An error occurred: `n $($job.value.Message)"
        throw $($job.value.Message)        
    }
    else
    {   
        Log "The $VM has completed the FSlogix installation"
        Write-Output "Success"
    } 
    
}

