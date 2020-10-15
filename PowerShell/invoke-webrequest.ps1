# Get request
$HawkIds = @('kaysmith','rautenried','cesapp')

$HawkIds | ForEach-Object {
    Write-Host $PSItem
    $response = Invoke-RestMethod -Uri "https://localhost:5001/api/SelfCerts/cc-addresses/$PSItem"
    Write-Host $response
    $jsonObj = $response | ConvertTo-Json
    Write-Host ($jsonObj).Count
}


# Post request
$JSON = @{
    "card_nbr" = "12"
} | ConvertTo-Json

Invoke-WebRequest -Method Post `
    -Uri https://localhost:5001/api/DisputeForm `
    -ContentType "application/json" `
    -Body $JSON
    