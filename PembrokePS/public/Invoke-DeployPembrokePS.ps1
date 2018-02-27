function Invoke-DeployPembrokePS
{
    <#
	.DESCRIPTION
		Deploy PembrokePS components (default: DB,UI,Rest)
    .PARAMETER Destination
        A valid Path is required.
    .PARAMETER Source
        A valid Path is required.
	.EXAMPLE
        Invoke-DeployPembrokePS -Destination c:\wamp\www\PembrokePS -Source c:\OpenProjects\ProjectPembroke\PembrokePSUI
	.NOTES
        It will create the directory if it does not exist.
    #>
    [CmdletBinding()]
    [OutputType([boolean])]
    param(
        [System.IO.Path]$Destination,
        [System.IO.Path]$Source
    )

    # This function should verify the required modules are installed, and perform the base deployment of those modules.

    # Default
    ## Database
    ## UserInterface
    ## PSRest
    write-output "Hello World"
    # Optional - 
    ## Alert
    ## Qman
    ## Sched
    ## Wman

}