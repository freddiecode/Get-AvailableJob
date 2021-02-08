# Valid Categories: https://arbeidsplassen-api.nav.no/stillingsimport/api/v1/categories/pyrk/occupations

# NAV Ads Public API : https://arbeidsplassen.nav.no/public-feed/swagger/#/default/get_public_feed_api_v1_ads

# Request example with category: https://arbeidsplassen.nav.no/public-feed/api/v1/ads?category=IT&municipal=Hamar&county=Innlandet

# https://gist.github.com/SimonWahlin/275039888ab80c600b52f7d456134a2e


function Get-AvailableJob {

        [cmdletbinding()]
    param(       
        [Parameter(Mandatory=$false, Position=0)]  
        [ValidateSet("Agder", "Innlandet", "Møre og Romsdal", "Nordland", "Oslo", "Rogaland", "Vestfold og Telemark", "Troms og Finnmark", "Trøndelag", "Vestland", "Viken")]
        [string]
        $County,
       
        [Parameter(Mandatory=$false, Position=1)]
        [ValidateSet("Andøy","Moskenes","Hamarøy","Halden","Moss","Sarpsborg","Fredrikstad","Drammen","Kongsberg","Ringerike","Hvaler","Aremark","Marker","Indre Østfold",
        "Skiptvet","Rakkestad","Råde","Våler (Østf.)","Vestby","Nordre Follo","Ås","Frogn","Nesodden","Bærum","Asker","Aurskog-Høland","Rælingen","Enebakk","Lørenskog",
        "Lillestrøm","Nittedal","Gjerdrum","Ullensaker","Nes","Eidsvoll","Nannestad","Hurdal","Hole","Flå","Nesbyen","Gol","Hemsedal","Ål","Hol","Sigdal","Krødsherad","Modum",
        "Øvre Eiker","Lier","Flesberg","Rollag","Nore og Uvdal","Jevnaker","Lunner","Kongsvinger","Hamar","Lillehammer","Gjøvik",
        "Ringsaker","Løten","Stange","Nord-Odal","Sør-Odal","Eidskog","Grue","Åsnes","Våler (Hedm.)","Elverum","Trysil","Åmot","Stor-Elvdal","Rendalen","Engerdal","Tolga","Tynset","Alvdal",
        "Folldal","Os","Dovre","Lesja","Skjåk","Lom","Vågå","Nord-Fron","Sel","Sør-Fron","Ringebu","Øyer","Gausdal","Østre Toten",
        "Vestre Toten","Gran","Søndre Land","Nordre Land","Sør-Aurdal","Etnedal","Nord-Aurdal","Vestre Slidre","Øystre Slidre","Vang","Horten","Holmestrand","Tønsberg",
        "Sandefjord","Larvik","Porsgrunn","Skien","Notodden","Færder","Siljan","Bamble","Kragerø","Drangedal","Nome","Midt-Telemark","Tinn","Hjartdal","Seljord","Kviteseid","Nissedal",
        "Fyresdal","Tokke","Vinje","Risør","Grimstad","Arendal","Kristiansand","Lindesnes","Farsund","Flekkefjord","Gjerstad","Vegårshei","Tvedestrand","Froland","Lillesand","Birkenes",
        "Åmli","Iveland","Evje og Hornnes","Bygland","Valle","Bykle","Vennesla","Åseral","Lyngdal","Hægebostad","Kvinesdal","Sirdal","Bergen","Kinn","Etne","Sveio","Bømlo","Stord","Fitjar",
        "Tysnes","Kvinnherad","Ullensvang","Eidfjord","Ulvik","Voss","Kvam","Samnanger","Bjørnafjorden","Austevoll","Øygarden","Askøy","Vaksdal","Modalen","Osterøy","Alver","Austrheim","Fedje",
        "Masfjorden","Gulen","Solund","Hyllestad","Høyanger","Vik","Sogndal","Aurland","Lærdal","Årdal","Luster","Askvoll","Fjaler","Sunnfjord","Bremanger","Stad","Gloppen","Stryn","Trondheim",
        "Steinkjer","Namsos","Frøya","Osen","Oppdal","Rennebu","Røros","Holtålen","Midtre Gauldal","Melhus","Skaun","Malvik","Selbu","Tydal","Meråker","Stjørdal","Frosta","Levanger","Verdal",
        "Snåase-Snåsa","Lierne","Raarvihke - Røyrvik","Namsskogan","Grong","Høylandet","Overhalla","Flatanger","Leka","Inderøy","Indre Fosen","Heim","Hitra","Ørland","Åfjord","Orkland","Nærøysund",
        "Rindal","Tromsø","Harstad - Hárstták","Alta","Vardø","Vadsø","Hammerfest","Kvæfjord","Tjeldsund","Ibestad","Gratangen","Loabák - Lavangen","Bardu","Salangen","Målselv","Sørreisa","Dyrøy",
        "Senja","Balsfjord","Karlsøy","Lyngen","Storfjord-Omasvuotna-Omasvuono","Gáivuotna-Kåfjord-Kaivuono","Skjervøy","Nordreisa","Kvænangen","Guovdageaidnu-Kautokeino","Loppa","Hasvik","Måsøy",
        "Nordkapp","Porsanger-Porsáŋgu-Porsanki","Kárášjohka-Karasjok","Lebesby","Gamvik","Berlevåg","Deatnu-Tana","Unjárga-Nesseby","Båtsfjord","Sør-Varanger","Oslo")]
        [string]
        $Municipal,

        [Parameter(Mandatory=$false, Position=3)]
        [switch]
        $ShowDescription

        )


        

        DynamicParam {


                $Cat = Invoke-RestMethod "https://arbeidsplassen-api.nav.no/stillingsimport/api/v1/categories/pyrk/occupations" -ContentType 'charset=utf-8'

                $AllCategories = [System.Collections.ArrayList]@()

                $Cat.PSObject.Properties.Value | foreach {

                $Cate = New-Object PSCustomObject

                $CategoryElements = [ordered]@{
       
                Level1 = $_.categoryLevel1
                Level2 = $_.categoryLevel2
                styrkCode = $_.styrkCode
                strykDescription = $_.styrkDescription

                
                    }
                    
                $Cate | Add-Member -MemberType NoteProperty -Name Level1 -Value $CategoryElements.Level1
                #$Cate | Add-Member -MemberType NoteProperty -Name Level2 -Value $CategoryElements.Level2
                #$Cate | Add-Member -MemberType NoteProperty -Name StyrkCode -Value $CategoryElements.styrkCode
                #$Cate | Add-Member -MemberType NoteProperty -Name StyrkDescription -Value $CategoryElements.strykDescription

                $AllCategories += $Cate

                

        }

                $attributes = New-Object System.Management.Automation.ParameterAttribute

                $attributes.ParameterSetName = "__AllParameterSets"

                $attributes.Mandatory = $false

                $attributeCollection = New-Object -Type System.Collections.ObjectModel.Collection[System.Attribute]

                $attributeCollection.Add($attributes)

                $_Values = ($AllCategories.Level1) | Sort-Object -Unique  

                $ValidateSet = New-Object System.Management.Automation.ValidateSetAttribute($_Values)

                $attributeCollection.Add($ValidateSet)

                $dynParam1 = New-Object -Type System.Management.Automation.RuntimeDefinedParameter("Category", [string], $attributeCollection)

                $paramDictionary = New-Object -Type System.Management.Automation.RuntimeDefinedParameterDictionary

                $paramDictionary.Add("Category", $dynParam1)

                return $paramDictionary }


                

begin {

                $Page = 0

                $AllJobsArrayList = [System.Collections.ArrayList]@()

    }

process {




do {


        $Token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwdWJsaWMudG9rZW4udjFAbmF2Lm5vIiwiYXVkIjoiZmVlZC1hcGktdjEiLCJpc3MiOiJuYXYubm8iLCJpYXQiOjE1NTc0NzM0MjJ9.jNGlLUF9HxoHo5JrQNMkweLj_91bgk97ZebLdfx3_UQ"

        $Catego = $PSBoundParameters.Category

        $Category = $Catego

        $EndPoint = "https://arbeidsplassen.nav.no/public-feed/api/v1/ads?category=$Category&page=$Page&municipal=$Municipal&county=$County" #&published=[2020-12-01,today)

        $Headers = @{Authorization = "Bearer $Token"}

        $ContentType = 'application/json'

        $Result = Invoke-RestMethod -Uri $EndPoint -Headers $Headers -ContentType $ContentType

        $Jobs =  $Result

        $Jobs.content | ForEach-Object {
            
        $Final = New-Object PSCustomObject

        $JobList = [ordered]@{
       
                Title = $_.title
                Company = $_.employer.name
                Description = $_.description
                PrimaryCategory = $_.occupationCategories.level1 | Select-Object -First 1
                SubCategory = $_.occupationCategories.level2 | Select-Object -First 1
                Url = $_.link
                WorkLocation = "$(if (!$_.workLocations.address) {$_.workLocations.address})" + "$($_.workLocations.postalcode)"+ " "+"$($_.workLocations.city)" 
                ApplicationDue = $(if ($_.applicationdue -as [DateTime]) {[datetime]::Parse($_.applicationDue)} else {"-"})
                DateRegistered = $(if ($_.published -as [DateTime]) {[datetime]::Parse($_.published)} else {"-"})
                
            }

            $TrimmedDescription = $Joblist.Description -replace '<[^>]+>',''
                    
            $Final | Add-Member -MemberType NoteProperty -Name Title -Value $JobList.Title
            $Final | Add-Member -MemberType NoteProperty -Name Company -Value $JobList.Company
            $Final | Add-Member -MemberType NoteProperty -Name Description -Value $TrimmedDescription
            $Final | Add-Member -MemberType NoteProperty -Name PrimaryCategory -Value $JobList.PrimaryCategory
            $Final | Add-Member -MemberType NoteProperty -Name SubCategory -Value $JobList.SubCategory
            $Final | Add-Member -MemberType NoteProperty -Name DateRegistered -Value $JobList.DateRegistered
            $Final | Add-Member -MemberType NoteProperty -Name ApplicationDue -Value $JobList.ApplicationDue
            $Final | Add-Member -MemberType NoteProperty -Name Url -Value $JobList.Url
            $Final | Add-Member -MemberType NoteProperty -Name WorkLocation -Value $JobList.WorkLocation
            

            $AllJobsArrayList += $Final


        }


        $Page++


        } while ($Result.last -ne $true)

    }

end {

        if($ShowDescription.IsPresent) { return $AllJobsArrayList | Sort-Object PrimaryCategory, ApplicationDue }
        else { return $AllJobsArrayList | Select-Object Title, Company, PrimaryCategory, SubCategory, DateRegistered, ApplicationDue, Url, WorkLocation | Sort-Object -Property PrimaryCategory }  #$Category }


    }

}




