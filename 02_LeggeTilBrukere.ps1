# I powershell core!
curl -O https://raw.githubusercontent.com/aneemilier/scripts/main/LageBrukereCSV.ps1
#Invoke-WebRequest -Uri "https://gitlab.stud.idi.ntnu.no/markma/dcsg-1005-tante-evry/-/raw/main/code/LageBrukereCSV.ps1" -Outfile "C:\Users\Administrator\Downloads\LageBrukereCSV.ps1"
#Dersom ikke curl fungerer (som det ikke gjør i windows powershell, kan Invoke-WebRequest brukes.
.\LageBrukereCSV.ps1
#Will create CSV file to be used in this script.
$ADUsers = Import-Csv tantetransportusers.csv -Delimiter ';'
# Headers: Username;GivenName;SurName;UserPrincipalName;DisplayName;Password;Department;Path
foreach ($User in $ADUsers) {
   if (!(Get-ADUser -LDAPFilter `
   "(sAMAccountName=$($User.Username))")) {
     New-ADUser `
     -SamAccountName        $User.Username `
     -UserPrincipalName     $User.UserPrincipalName `
     -Name                  $User.DisplayName `
     -GivenName             $User.GivenName `
     -Surname               $User.SurName `
     -Enabled               $True `
     -ChangePasswordAtLogon $False `
     -DisplayName           $user.Displayname `
     -Department            $user.Department `
     -Path                  $user.path `
     -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -Force)
   }
}
