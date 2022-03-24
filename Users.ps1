$a = Get-ADUser -Identity *
$file = "C:\example\ADCSV.csv"

foreach($b in $a){

    if($b.Enabled){
    
       $c = Get-ADPrincipalGroupMembership $b | Sort-Object | select -ExpandProperty name
       foreach($d in $c){
        $z = Get-ADGroup $d -Properties * | Select Description
        if($z.Description -ne $null){

            [string]$toCSV = $b.Name + "," + $d + "," + $z.Description

        } else {

            [string]$toCSV = $b.Name + "," + $d

        }
        Write-Output $toCSV >> $file
       
       }

    }
    

}

Write-Output "All Done!"