$test = @('google.com:80','gmail.com:80','timwe.com:999','gmail.com:80','gmail.com:80')

Foreach ($t in $test)
{
  $source = $t.Split(':')[0]
  $port = $t.Split(':')[1]
  
  Write-Host "Connecting to $source on port $port"

  try
  {
    $socket = New-Object System.Net.Sockets.TcpClient($source, $port)
  }
  catch [Exception]
  {
    Write-Host "Failed a"
  }

  Write-Host "Successful connection`n"
}