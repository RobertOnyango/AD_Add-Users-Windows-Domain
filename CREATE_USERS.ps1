#PowerShell code that automates adding users to a Windows Domain. The code simulates a Domain Admin/Server Operator adding new users in a text file read by the code and automatically picked up by the Active Directory server.

#Default password for all the users in my use case
$PASSWORD_FOR_USERS   = "Password@1"
#Store teh content of the text file containig the list of 1,000 names to be added to the AD DS
$USER_FIRST_LAST_LIST = Get-Content .\names.txt

# ------------------------------------------------------ #

#Convert plain text password above to a password object that will be used by AD when creating each user
$password = ConvertTo-SecureString $PASSWORD_FOR_USERS -AsPlainText -Force

#Create a new Organizational Unit, called USERS, that will hold the new users we are adding into our Windows Domain, mydomain.com.
New-ADOrganizationalUnit -Name _USERS -ProtectedFromAccidentalDeletion $false

#Loop through each name in the text file of names
foreach ($n in $USER_FIRST_LAST_LIST) {
    $first = $n.Split(" ")[0].ToLower() #Take first name and convert to lower character. Use the space as a split factor.

    $last = $n.Split(" ")[1].ToLower() #Take last name and convert to lower character. Use the space as a split factor.

    $username = "$($last)$($first.Substring(0,1))".ToLower() #Take the last name, then take the first character of the first name and glue it to the last name, all in lower case to get the user ID e.g. onyangor 

    Write-Host "Creating user: $($username)" -BackgroundColor Black -ForegroundColor Cyan #Output the results of the above line on the CLI.
    
    #Create the new user in active directory in the USERS OU we have created
    New-AdUser -AccountPassword $password `
               -GivenName $first `
               -Surname $last `
               -DisplayName $username `
               -Name $username `
               -EmployeeID $username `
               -PasswordNeverExpires $true `
               -Path "ou=_USERS,$(([ADSI]`"").distinguishedName)" `
               -Enabled $true
}