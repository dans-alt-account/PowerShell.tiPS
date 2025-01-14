function Write-PowerShellTip
{
<#
	.SYNOPSIS
	Write a PowerShell tip to the terminal.

	.DESCRIPTION
	Write a PowerShell tip to the terminal. If no tip is specified, a random tip will be written.
	The tip is written to the terminal using the Write-Host cmdlet so that colours can be applied.
	Thus, the tip is not written to the pipeline and cannot be captured in a variable.
	If you want to capture the tip in a variable, use the Get-PowerShellTip function.

	.PARAMETER Id
	The ID of the tip to write. If not supplied, a random tip will be written.
	If no tip with the specified ID exists, an error is written.

	.INPUTS
	You can pipe a [string] of the ID of the tip to write, or a PsCustomObject with a [string] 'Id' property.

	.OUTPUTS
	None. The function does not return any objects.

	.EXAMPLE
	Write-PowerShellTip

	Write a random tip to the terminal.

	.EXAMPLE
	Write-PowerShellTip -Id '2023-07-16-powershell-is-open-source'

	Write the tip with the specified ID.
#>
	[CmdletBinding()]
	[Alias('Tips')]
	[OutputType([void])]
	Param
	(
		[Parameter(Mandatory = $false, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true,
			HelpMessage = 'The ID of the tip to write. If not supplied, a random tip will be written.')]
		[string] $Id
	)

	Process
	{
		[tiPS.PowerShellTip] $tip = Get-PowerShellTip -Id $Id
		if ($null -ne $tip)
		{
			WritePowerShellTipToTerminal -Tip $tip
		}
	}
}
