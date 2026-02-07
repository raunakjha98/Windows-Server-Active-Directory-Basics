Import-Module ActiveDirectory

# Create OUs
New-ADOrganizationalUnit -Name "HR" -Path "DC=company,DC=local"
New-ADOrganizationalUnit -Name "IT" -Path "DC=company,DC=local"
New-ADOrganizationalUnit -Name "Sales" -Path "DC=company,DC=local"
New-ADOrganizationalUnit -Name "Computers" -Path "DC=company,DC=local"

# Create Groups
New-ADGroup -Name "HR_Users" -GroupScope Global -Path "OU=HR,DC=company,DC=local"
New-ADGroup -Name "IT_Users" -GroupScope Global -Path "OU=IT,DC=company,DC=local"
New-ADGroup -Name "Sales_Users" -GroupScope Global -Path "OU=Sales,DC=company,DC=local"

# Create Users
$Password = ConvertTo-SecureString "Welcome@123" -AsPlainText -Force

New-ADUser -Name "Neha Sharma" -SamAccountName hr.user1 -Path "OU=HR,DC=company,DC=local" -AccountPassword $Password -Enabled $true
New-ADUser -Name "Amit Verma" -SamAccountName it.user1 -Path "OU=IT,DC=company,DC=local" -AccountPassword $Password -Enabled $true
New-ADUser -Name "Rahul Singh" -SamAccountName sales.user1 -Path "OU=Sales,DC=company,DC=local" -AccountPassword $Password -Enabled $true

# Add users to groups
Add-ADGroupMember -Identity "HR_Users" -Members hr.user1
Add-ADGroupMember -Identity "IT_Users" -Members it.user1
Add-ADGroupMember -Identity "Sales_Users" -Members sales.user1