function Invoke-DeployRest
{
    <#
	.DESCRIPTION
		Deploy Database Schema to web server. This needs to be updated
    .PARAMETER Destination
        A valid Path is required.
    .PARAMETER Source
        A valid Path is required.
	.EXAMPLE
        Invoke-DeployDB -Destination c:\wamp\www\PembrokePS -Source c:\OpenProjects\ProjectPembroke\PembrokePSUI
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
        # Invoke-DeployPPSRest -InstallDirectory C:\PembrokePS\Rest -SourceAvailableRoutesDirectory C:\OPEN_PROJECTS\ProjectPembroke\PembrokePSrest\PembrokePSrest\data -SourceAvailableRoutesFile C:\OPEN_PROJECTS\ProjectPembroke\PembrokePSrest\PembrokePSrest\data\PembrokePSEndpointRoutes.ps1
        # or Invoke-DeployPPSRest ^^ needs variables set for the paths if they are passed in.
    }
    catch
    {
        $ErrorMessage = $_.Exception.Message
        $FailedItem = $_.Exception.ItemName
        Write-Error "Error: $ErrorMessage $FailedItem"
        BREAK
    }

}