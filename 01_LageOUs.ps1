#Etter installasjon av Domene Controller, og Hosts er koblet sammen til dc1.
# User OUs (logged in as Domain Administrator on DC1)
New-ADOrganizationalUnit 'AlleBrukere' -Description 'Alle OUs og brukere'
New-ADOrganizationalUnit 'IT' -Description 'Informasjons teknologi' `
  -Path 'OU=AlleBrukere,DC=tante,DC=transport'
New-ADOrganizationalUnit 'HR' -Description 'Human Resources' `
  -Path 'OU=AlleBrukere,DC=tante,DC=transport'
New-ADOrganizationalUnit 'Transport' -Description 'Transport' `
  -Path 'OU=AlleBrukere,DC=tante,DC=transport'
New-ADOrganizationalUnit 'Logistikk' -Description 'Logistikk' `
  -Path 'OU=AlleBrukere,DC=tante,DC=transport'
New-ADOrganizationalUnit 'Finans' -Description 'Finans' `
  -Path 'OU=AlleBrukere,DC=tante,DC=transport'
New-ADOrganizationalUnit 'Adm' -Description 'Administrasjon' `
  -Path 'OU=AlleBrukere,DC=tante,DC=transport'
New-ADOrganizationalUnit 'Lager' -Description 'Lager' `
  -Path 'OU=Logistikk,OU=AlleBrukere,DC=tante,DC=transport'
New-ADOrganizationalUnit 'Kontor' -Description 'Logistikk kontor' `
  -Path 'OU=Logistikk,OU=AlleBrukere,DC=tante,DC=transport'
New-ADOrganizationalUnit 'Langdistanse' -Description 'Langdistanse' `
  -Path 'OU=Transport,OU=AlleBrukere,DC=tante,DC=transport'
New-ADOrganizationalUnit 'Regional' -Description 'Regional transport' `
  -Path 'OU=Transport,OU=AlleBrukere,DC=tante,DC=transport'
New-ADOrganizationalUnit 'By' -Description 'Storby transport' `
  -Path 'OU=Transport,OU=AlleBrukere,DC=tante,DC=transport'
New-ADOrganizationalUnit 'Tog' -Description 'Tog transport' `
  -Path 'OU=Transport,OU=AlleBrukere,DC=tante,DC=transport'
New-ADOrganizationalUnit 'Kundeservice' -Description 'Kundeservice' `
  -Path 'OU=AlleBrukere,DC=tante,DC=transport'

# Computer OUs
New-ADOrganizationalUnit 'Klient' `
  -Description 'Inneholder OUs og bruker pcer'
New-ADOrganizationalUnit 'Servers' `
  -Description 'Inneholder OUs og servere'
New-ADOrganizationalUnit 'Adm' -Description 'Administrasjon pcer' `
  -Path 'OU=Klient,DC=tante,DC=transport'
New-ADOrganizationalUnit 'IT' -Description 'IT pcer' `
  -Path 'OU=Klient,DC=tante,DC=transport'
New-ADOrganizationalUnit 'HR' -Description 'HR pcer' `
  -Path 'OU=Klient,DC=tante,DC=transport' 
New-ADOrganizationalUnit 'Logistikk' -Description 'Logistikk pcer' `
  -Path 'OU=Klient,DC=tante,DC=transport'
New-ADOrganizationalUnit 'Finans' -Description 'Finans pcer' `
  -Path 'OU=Klient,DC=tante,DC=transport' 
New-ADOrganizationalUnit 'Kundeservice' -Description 'Kundeservice pc' `
  -Path 'OU=Klient,DC=tante,DC=transport'
# Moving hosts to specified path:
Get-ADComputer "MGR" | 
  Move-ADObject -TargetPath "OU=Logistikk,OU=Klient,DC=tante,DC=transport"
Get-ADComputer "CL1" | 
  Move-ADObject -TargetPath "OU=Adm,OU=Klient,DC=tante,DC=transport"
Get-ADComputer "SRV1" | 
  Move-ADObject -TargetPath "OU=Servers,DC=tante,DC=transport"

#Innstallering av curl 
  choco install -y curl
# For å teste at det nå er tildelt riktig : 
#   Get-ADComputer -Filter * | Select-Object -Property DNSHostName,DistinguishedName

