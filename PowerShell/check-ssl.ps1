$ErrorActionPreference = "Stop"

function Test-SSL( [string] $URL ) {

    Write-Host "Checking $URL"
    
    try {
        [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
        $webRequest = [System.Net.HttpWebRequest]::Create($URL)

        $webRequest.KeepAlive = $false
        $webRequest.Timeout = 5000
        $webRequest.ServicePoint.ConnectionLeaseTimeout = 5000
        $webRequest.ServicePoint.MaxIdleTime = 5000

        $null = $webRequest.GetResponse().Dispose()
    }
    catch [System.Net.WebException] {
        if ($_.Exception.Status -eq [System.Net.WebExceptionStatus]::TrustFailure) {
            # We ignore trust failures, since we only want the certificate, and the service point is still populated at this point
        }
        else {
            Write-Warning $_.Exception.Message
        }
    }
    catch {
        Write-Warning $_.Exception.Message
    }

    if (($webRequest.ServicePoint.Certificate) -and ($webRequest.ServicePoint.Certificate.Handle -ne 0)) {
        if ($ReturnCertificate) {
            Write-Output $webRequest.ServicePoint.Certificate

            $expirationDate = $ReturnCertificate.GetExpirationDateString()
            if (!([DateTime]::Parse( $expirationDate ) -gt ([DateTime]::Today.AddDays( 14 )))) {
                throw "Expiration date $expirationDate is less than 14 days ahead"
            }
            Write-Host "OK. SSL certificate has expiration date of $expirationDate"
        }
        else {
            Write-Output ([PSCustomObject] [Ordered] @{
               IssuerCN = $webRequest.ServicePoint.Certificate.Issuer.Split(', ',[System.StringSplitOptions]::RemoveEmptyEntries)[0].Split('=')[1]
               SubjectCN = $webRequest.ServicePoint.Certificate.Subject.Split(', ',[System.StringSplitOptions]::RemoveEmptyEntries)[0].Split('=')[1]
               ValidFrom = $webRequest.ServicePoint.Certificate.GetEffectiveDateString()
               ValidTo = $webRequest.ServicePoint.Certificate.GetExpirationDateString()
            })

            $expirationDate = $webRequest.ServicePoint.Certificate.GetExpirationDateString()
            if (!([DateTime]::Parse( $expirationDate ) -gt ([DateTime]::Today.AddDays( 14 )))) {
                throw "Expiration date $expirationDate is less than 14 days ahead"
            }
            Write-Host "OK. SSL certificate has expiration date of $expirationDate"
        }

        $webRequest.ServicePoint.Certificate.Dispose()
    }   

    [Net.ServicePointManager]::ServerCertificateValidationCallback = $null
}

Test-SSL("https://google.com")