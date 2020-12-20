$OutlookApp = New-Object -ComObject Outlook.Application
$email = $OutlookApp.CreateItem(0) 

$email.Recipients.Add("email@email.com") 

$cc = $email.Recipients.Add("email2@email.com")
$cc.Type = 2
$cc = $email.Recipients.Add("email3@email.com")
$cc.Type = 2

$email.Subject = "Some Subject" 
$email.Body = "test mail with powershell"

$email.Attachments.Add("C:\path\to\files\test.txt")
$email.SaveAs("C:\path\to\files\test.msg")