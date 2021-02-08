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
Remember that the municipality must be located in the county to get a valid request

## .PARAMETER Category
Specifies the job category of your search
All categories are retrieved by the help of 'Dynamic Parameters' from and API endpoint at NAV

## .OUTPUTS
TypeName: Selected.System.Management.Automation.PSCustomObject. Get-AvailableJob returns a PSCustomObject

## .EXAMPLE
````powershell
# Returns all available jobs in Innlandet/Hamar under the category 'Helse og sosial'. Shows description of all jobs
Get-AvailableJob -County Innlandet -Municipal Hamar  -Category 'Helse og sosial' -ShowDescription
````

## .EXAMPLE
````powershell
# Returns all available IT-jobs located in Innlandet/Lillehammer 
Get-AvailableJob -County Innlandet -Municipal Lillehammer -Category IT
````

## .EXAMPLE
````powershell
# Returns the first 10 available jobs in Oslo in the category 'IT'
Get-AvailableJob -County Oslo -Municipal Oslo -Category IT | Select-Object -First 10
````

## .AUTHOR

Freddie Christiansen | www.cloudpilot.no
