$clicks = Import-Csv "C:\Users\camer\Documents\VBA powershell\TrumpStumper\Resources\clickElements.txt" -Header "elementName"
$fills = Import-Csv "C:\Users\camer\Documents\VBA powershell\TrumpStumper\Resources\fillElements.txt" -Header "elementName"
#$headers = Import-Csv "C:\Users\camer\Documents\VBA powershell\TrumpStumper\Resources\headers.txt"
#$fNames = Import-Csv "C:\Users\camer\Documents\VBA powershell\TrumpStumper\Resources\fNames.txt"
#$lNames = Import-Csv "C:\Users\camer\Documents\VBA powershell\TrumpStumper\Resources\lNames.txt"
#$domains = Import-Csv "C:\Users\camer\Documents\VBA powershell\TrumpStumper\Resources\domains.txt"
#$q8Answers = Import-Csv "C:\Users\camer\Documents\VBA powershell\TrumpStumper\Resources\q8Answers.txt"
#$q15Starts = Import-Csv "C:\Users\camer\Documents\VBA powershell\TrumpStumper\Resources\q15Starts.txt"
#$q15Ends = Import-Csv "C:\Users\camer\Documents\VBA powershell\TrumpStumper\Resources\q15Ends.txt"
#$thoughts = Import-Csv "C:\Users\camer\Documents\VBA powershell\TrumpStumper\Resources\thoughts.txt"
$q23Answer = "They're lesser-known because they're hacks."
$elemFName = "id_first_name"
$elemLName = "id_last_name"
$elemEmail = "id_email"
$elemZC = "id_postal_code"

$ie = New-Object -ComObject InternetExplorer.Application
$ie.visible = $true
$endTime = (Get-Date).AddHours(2)

#do
#{
    $ie.Navigate("https://action.donaldjtrump.com/mainstream-media-accountability-survey/")

<#    $fName = $fNames | Get-Random
    $lName = $lNames | Get-Random
    $domain = $domains | Get-Random
    $eMail = "$fName$lName@$domain"
    $header = $headers | Get-Random
    $zipCode = Get-Random -Minimum 10000 -Maximum 99999
    $q15Start = $q15Starts | Get-Random
    $q15End = $q15Ends | Get-Random
    $q15Answer = "$q15Start no, you $q15End"
    $thought = $thoughts | Get-Random
  #>  
    #wait for page to load
    while($ie.Busy -eq $true)
    {
        Start-Sleep -Milliseconds 200
    }
    $doc = $ie.Document.frames.document.forms | select -ExpandProperty Document
    $header = "The Suck a Dick Trump Project"
    $elemHeader = $doc.getElementsByTagName("h1") | select -First 1
    $elemHeader.innerHTML = $header

    foreach($click in $clicks)
    {
        $elemClick = $doc.getElementById($click.elementName) #| where id -eq $click.elementName
        $elemClick.Click()
        #Start-Sleep -Milliseconds 100
    }

    <#$doc.getElementById($fills[0]).Value = $q8Answer
    $doc.getElementById($fills[1]).Value = $q15Answer
    $doc.getElementById($fills[2]).Value = $q23Answer
    $doc.getElementById($fills[3]).Value = $thought

    $doc.getElementById($elemFName).Value = $fName
    $doc.getElementById($elemLName).Value = $lName
    $doc.getElementById($elemZC).Value = $zipCode
    $doc.getElementById($elemEmail).Value = $eMail

    $doc.getElementsByName("respond").Click()
    
    while($ie.Busy -eq $true)
    {
        Start-Sleep -Milliseconds 200
    }

} Until((Get-Date) -eq $endTime)

$ie.Quit()
[system.Runtime.InteropServices.Marshal]::ReleaseComObject($ie)#>