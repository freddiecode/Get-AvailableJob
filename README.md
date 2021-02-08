# Get-AvailableJob

![](https://github.com/freddiecode/my-blog/blob/master/assets/images/random/carbon.png)


 ## .SYNOPSIS
Search and find your next job using PowerShell!

## .DESCRIPTION
Allows you to search for available jobs via the NAV job ads public API.
More information about the API is found here: https://github.com/navikt/pam-public-feed

## .PARAMETER County
Specifies the county in your search

## .PARAMETER Municipal
Specifies the municipality of your search.
Remember that the municipality must be located in the County to get a valid request

## .PARAMETER Category
Specifies the job category of your search
All categories are retrieved by the help of 'Dynamic Parameters' from and API endpoint at NAV

## .OUTPUTS
TypeName: Selected.System.Management.Automation.PSCustomObject. Get-AvailableJob returns a PSCustomObject

## .EXAMPLE
Get-AvailableJob -County Innlandet -Municipal Hamar  -Category 'Helse og sosial' -ShowDescription

## .EXAMPLE
Get-AvailableJob -County Innlandet -Municipal Lillehammer -Category IT

## .EXAMPLE
Get-AvailableJob -County Oslo -Municipal Oslo -Category IT | Select-Object -First 10

## .LINK
https://www.cloudpilot.no
