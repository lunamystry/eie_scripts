﻿# Get the ID and security principal of the current user account

$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()

$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)



# Get the security principal for the Administrator role

$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator



# Check to see if we are currently running "as Administrator"

if ($myWindowsPrincipal.IsInRole($adminRole))

   {

   # We are running "as Administrator" - so change the title and background color to indicate this

   $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"

   $Host.UI.RawUI.BackgroundColor = "Red"

   $dompass = "password" | ConvertTo-SecureString -asPlainText -Force #another password string
   $domuser = "domain\root" #setting a domain username string
   $domcred = New-Object System.Management.Automation.PSCredential ( $domuser, $dompass )#another combine string puts together both domain username and pass, this is for the domain admin
   #remove a single pc by specifying however this can also be IP address as well
   Remove-Computer -UnjoinDomainCredential $domcred -Workgroup EIEUG -Force -restart

   clear-host

   }

else

   {

   # We are not running "as Administrator" - so relaunch as administrator



   # Create a new process object that starts PowerShell

   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";



   # Specify the current script path and name as a parameter

   $newProcess.Arguments = $myInvocation.MyCommand.Definition;



   # Indicate that the process should be elevated

   $newProcess.Verb = "runas";



   # Start the new process

   [System.Diagnostics.Process]::Start($newProcess);



   # Exit from the current, unelevated, process

   exit

   }



# Run your code that needs to be elevated here

Write-Host -NoNewLine "Press any key to continue..."

$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
