Author: Leonard Mandla Mbuli
email: mail@mandla.me or lm.mbuli@gmail.com
created: during the week of the 18 August 2014

Introduction
------------

This is a collection of scripts to help in configuring the computers in the DLAB.
I couldn't find a way to run Powershell scripts by double clicking so all the scripts
have batch files which just call them with powershell. It assumes you are running from
an environment which will recognise powershell. 

Running Order
-------------

First you must rename the computer, this is done by running the rename_computer.ps1 script.
This will use the IP address of the computer to name the compuer DLAB<last three digits of the ip address>
for example if the ip addres is 146.141.119.123 the computer name will be DLAB123. 
The script joins the computer to the domain and then restarts it. Apparently you can 
rename the computer as you join it to the domain, this did not work and if you rename and 
join without restarting in between it also does not work( doe not rename the computer).

The next thing is to set the registry keys so that samba can work, this is done with 
set_samba_reg.reg file. Just double click and it will set two registry keys needed for samba.

Then next, you join the computer to the domain. The password is save in the script. It will join 
the computer and then restart it.

When you feel, meh, I don't want this computer on the domain anymore, you simply run the 
unjoin_domain.ps1 script.

