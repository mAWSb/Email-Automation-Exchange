#Email-Automation-Exchange

#Project
- PowerShell script for automating sending emails through MS Exchange.  This was purpose built and has been tested to only send about 10 email addresses. If running this against a larger number of emails please ensure that your environment can handle your workload.  
- This script allows for a service account to be used to authenticate to Exchange and sets a different "from" email address so replies will be sent to another mailbox. You can substitute the same mailbox enabled account for the service account if desired.  

#Requirements
You will need to utilize the following in addition to the script:
- An MS Exchange Server \ built and configured.
- Active Directory Server \ built and configured.
- Mailbox enabled service account.  
- CSV file which contains the emails you want to send to.
- Text file which will contain the contents of the email message, formatted in HTML.
- 3rd party WindowsCredential PS Module to be installed on the system the script is ran.  Run this command to install it 

#Deploying
- Build CSV file and HTML content file (Templates located in repository)
- In Powershell, install the CredentialManager module by running this command: "Install-Module -Name CredentialManager"
- On the machine that you plan to run this script, create a "Generic Windows Credential" for the service account.  Record the name of the credential for the next step.
- Open the Send-Mail-GitHub_Upload.ps1 file in PowerShell ISE
- Goto line 7, in the $Credentials variable enter the Credential name in the -Target property
- Goto line 10 and 11, for the $SmtpServer variable add the Exchange server.  For the $Port variable enter the port your server uses to send mail.
- Goto line 14, in the $importfile variable enter the file location of the CSV file which contains all the email address you are sending to.
- Goto line 18, in the $from variable enter the email address that you want the emails to appear they are coming from.
- Goto line 21, in the $subject variable enter the subject of the email.
- Goto line 22, in the $emailcontent variable enter the path to the email content file.
- Verify script is configured the way it should be.  Save the script.
- Run the Script to send the emails.
- Optionally this can be scheduled in Windows task scheduler if this needs to be a re-occuring task.     

#Version History
-1.0.0

***LEGAL DISCLAIMER***
The material embodied in this Repository and all resources provided within is provided to you "as-is" and without warranty of any kind, express, implied or otherwise, including without limitation, any warranty of fitness for a particular purpose. In no event shall the Author be liable to you or anyone else for any direct, special, incidental, indirect or consequential damages of any kind, or any damages whatsoever, including without limitation, loss of profit, loss of use, savings or revenue, or the claims of third parties, whether or not the Author has been advised of the possibility of such loss, however caused and on any theory of liability, arising out of or in connection with the possession, use or performance of this Repository and all resources provided within.
