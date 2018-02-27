function Invoke-DeployAlert
{
    <#
	.DESCRIPTION
		Deploy Database Schema to web server. This needs to be updated
    .PARAMETER Destination
        A valid Path is required.
    .PARAMETER Source
        A valid Path is required.
	.EXAMPLE
        Invoke-DeployAlert -Destination c:\wamp\www\PembrokePS -Source c:\OpenProjects\ProjectPembroke\PembrokePSUI
	.NOTES
        It will create the directory if it does not exist.
    #>
    [CmdletBinding()]
    [OutputType([boolean])]
    param(
        [System.IO.Path]$Destination,
        [System.IO.Path]$Source
    )
    try
    {
        Copy-Item -Path $Source -Destination $Destination -Recurse -Confirm:$false -Force
    }
    catch
    {
        $ErrorMessage = $_.Exception.Message
        $FailedItem = $_.Exception.ItemName		
        Write-Error "Error: $ErrorMessage $FailedItem"
        BREAK
    }

}