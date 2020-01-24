#Email_Automation - used to send emails to multiple reciepients

#Import CredentialManager PSModule
$m = Get-Module -ListAvailable CredentialManager
Import-Module -ModuleInfo $m 

$Credentials = Get-StoredCredential -Target #NameofCredentialinCredentialManagerGoesHere

#MailServerConfig
$SmtpServer = "NameofMSExchangeServer"
$Port = "ExchangePortGoeshere"

#Import-CSV and SendMail
$importFile = "PATH_TO_CSV_FILE_GOES_HERE"
$users = import-csv $importFile | select *
foreach($user in $users)
{
    $from = "FROM_EMAIL_ADDRESS_GOES_HERE"
    $to = $user.'To'
    $name = $user.'Name'
    $subject = "SUBECT_LINE_GOES_HERE"
    $emailcontent = "PATH_TO_EMAIL_CONTENT_GOES_HERE"
    $body = Get-Content -path $emailcontent

    $body = $body.Replace('[Name]', $name)

    $mail = New-Object System.Net.Mail.MailMessage
    $mail.From = $from
    $mail.To.Add($to)
    $mail.Subject = $subject
    $mail.IsBodyHtml = $true
    $mail.Body = $body

    $smtp = New-Object System.Net.Mail.SmtpClient
    $smtp.Host = $SmtpServer
    $smtp.Port = $Port
    $smtp.Credentials = $Credentials
    $smtp.Send($mail)
    }