# AD_Add-Users-Windows-Domain
A PowerShell script that creates an organizational unit populates a home lab Windows Domain with 1,000 users in Active Directory.
This code is part of a Home Lab where I ran Active Directory to simulate a real-world environment. The code's purpose is to automate adding 1,000+ users to the Windows Domain. You can read more on the lab here.
If you choose to follow through with the lab walkthrough, take note of the following:
Run Windows PowerShell ISE as Administrator in your Domain Controller and open the CREATE_USERS.ps1 file.
Next, in the PowerShell CLI, write and execute the command ‘Set-ExecutionPolicy Unrestricted’ and click on ‘Yes to all’.
The code comments explain in detail what each line achieves.
To successfully run the code, first navigate using ‘cd’ to where the code and the names.txt files are located. In our case, they should be on the Desktop of our Domain Server. You can use the ‘ls’ command to confirm the contents of the current directory.
Then click on play on the PowerShell ISE console.
The output on the CLI as the code runs should be similar to the image below:

 ![image](https://github.com/RobertOnyango/AD_Add-Users-Windows-Domain/assets/45780414/e0f3d98b-6ff4-4f55-af07-c1c71678b708)
