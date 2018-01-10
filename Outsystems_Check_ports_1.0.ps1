#----------------------------------------------------------------------
# Author:  Diogo Rocha 
# Mail:    diogo.rocha@outsystems.com
# Company: Outsystems
# Team:    Expert Services
# Version: 1.0
# Release: 01/10/2017
#----------------------------------------------------------------------

Write-Host "Welcome to Outsystems platform port checker."
$computerarray = @()

#Request required servers to test
do {
 $input = (Read-Host "Please enter the computer name or ip adress")
 if ($input -ne '') {$computerarray += $input}
}

until ($input -eq '')

#Request required DB ports to test
do {
 $db = (Read-Host "Please write down the database engine port or press enter to continue. mssql(1433), oracle(1521) or mysql(3306)")
 if ($db -ne '') {$port += $db}
 }
 until ($db -eq '')

#Ask if it's a Java Stack
$javapositive="2033"
Write-host "Is this a Java Stack installation?" -ForegroundColor Yellow 
    $Readhost = Read-Host " ( y / n ) " 
    Switch ($ReadHost) 
     { 
       Y {Write-host "Yes, this is a Java Stack"; $port += $javapositive} 
       yes {Write-host "Yes, this is a Java Stack"; $port += $javapositive} 
       N {Write-Host "No, this is a .net Stack"} 
       no {Write-Host "No, this is a .net Stack"}
     
     } 



#Start test
Foreach ($c in $computerarray){
    ForEach ($p in $port){

$source = $c
  $port = @('80','443','12000','12001','12002','12003','12004')
  
  Write-Host "Connecting to $source on port $p"

  try
  {
    $socket = New-Object System.Net.Sockets.TcpClient($source, $p)
    Write-Host "Successful connection`n"
  }
  catch [Exception]
  {
     Write-Host "Connection on port $p failed`n" -foregroundcolor red   
  } 

  }}