## quick way 1
PS > Test-NetConnection -port 1433 -computername idw.dna.its.uiowa.edu
WARNING: TCP connect to idw.dna.its.uiowa.edu:1433 failed


ComputerName           : idw.dna.its.uiowa.edu
RemoteAddress          : 172.30.210.90
RemotePort             : 1433
InterfaceAlias         : Ethernet
SourceAddress          : 128.255.64.154
PingSucceeded          : True
PingReplyDetails (RTT) : 0 ms
TcpTestSucceeded       : False

## quick way 2
$connectionString = 'Data Source=iowasqlidw.iowa.uiowa.edu;Initial Catalog=IDW2;User ID=its-idw-protrav;Password=????;' 

$sqlConnection = New-Object System.Data.SqlClient.SqlConnection $connectionString
$sqlConnection.Open()
$sqlConnection.Close()

## graceful way
function Test-SqlConnection {
    param(
        [Parameter(Mandatory)]
        [string]$ServerName,

        [Parameter(Mandatory)]
        [string]$DatabaseName,

        [Parameter(Mandatory)]
        [pscredential]$Credential
    )

    $ErrorActionPreference = 'Stop'

    try {
        $userName = $Credential.UserName
        $password = $Credential.GetNetworkCredential().Password
        $connectionString = 'Data Source={0};database={1};User ID={2};Password={3}' -f $ServerName,$DatabaseName,$userName,$password
        $sqlConnection = New-Object System.Data.SqlClient.SqlConnection $ConnectionString
        $sqlConnection.Open()
        ## This will run if the Open() method does not throw an exception
        $true
    } catch {
        $false
    } finally {
        ## Close the connection when we're done
        $sqlConnection.Close()
    }
}

Test-SqlConnection -ServerName 'serverhostname' -DatabaseName 'DbName' -Credential (Get-Credential)