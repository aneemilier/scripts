#Opprette brukere til vårt domene som blir lagret i en CSV fil tantetransport.csv
#Totalt 78 personer i domene fordelt følgende:
#   *ADMINISTRASJON     :  3
#   *IT                 :  2
#   *HR                 :  3
#   *LOGISTIKK          : (30)
#       *Lager          :  24
#       *Kontor         :  6
#   *FINANS             :  3
#   *KUNDESERVICE       :  3
#   *TRANSPORT          : (34)
#       *Langdistanse   :  9
#       *Regional       :  18
#       *By             :  3
#       *Tog            :  4
# Fornavn, etternavn, organisasjonsavdeling er lagt i char arrayer, og blir hentet ut med for-løkke:
$FirstName = @("Ane-Emilie","Markus","Emil","Martin","Petter","Pelle","Ingar","Ivar",
              "Kalle","Karl-Martin","Henrik","Andreas","Magne","Erik","Anna","Henriette",
              "Arne","Bjarne","Carl","David","Even","Fredrick","Henning","Gjermund","Iver",
              "Jamal","Karianne","Lars","Morten","Nils","Ole","Mari","Pernille","Randi","Sander",
              "Simen","Tormod","Agnes","Truls","Trine","Jesper","Mathias","Ernst-Gunnar","Frode",
              "Asle","Birger","Arnstein","Tommy","Vladimir","Donald","Erna","Jens","Jonas","Piotr",
              "Erjon","Kurt","Atle","Stian","Andrine","Sylvi","Aksel","Jon","Mads","Magnus","Justin",
              "Harald","Thomas","Vidar","Tore","Anton","Bror","Eirik","Amund","Alex","Patrick",
              "Espen","Raphael","Daniel")

$LastName = @("Ripsrud","Martinsen","Iversen","Haugstad","Pedersen","Andersen","Berge","Beck",
              "Torbergsen","Tangen","Evenstad","Evenstad","Koren","Hjelmaas","Johansen","Stenstruup",
              "Johansen","Borg","Tingstad","Berget","Nyborg","Kihle","Solberg","Eggen","Lundquist",
              "Hussein","Syversen","Monsen","Christensen","Evenrud","Nyhus","Sandberg","Samuelshaug",
              "Tveit","Haugerud","Bekk","Fjeld","Mork","Svendsen","Rein","Sondegaard","Thingstad",
              "Gran","Haug","Bark","Lund","Nordlie","Trettsveen","Putin","Trump","Solberg",
              "Stoltenberg","Gahr","Northug","Zoto","Nilsen","Pettersen","Blipp","Neby","Listhaug",
              "Hennie","Almaas","Hansen","Carlsen","Bieber","Rex","Numme","Myrvold","Sandberg","Tran",
              "Johnstad","Eggen","Sigstad","Gaskarth","Nystuen","Bysveen","Poiree","Kvammen")
 
$OrgUnits = @("ou=IT,ou=AlleBrukere","ou=IT,ou=AlleBrukere","ou=Adm,ou=AlleBrukere",
              "ou=Adm,ou=AlleBrukere","ou=Adm,ou=AlleBrukere","ou=HR,ou=AlleBrukere",
              "ou=HR,ou=AlleBrukere",
              "ou=HR,ou=AlleBrukere","ou=Lager,ou=Logistikk,ou=AlleBrukere",
              "ou=Lager,ou=Logistikk,ou=AlleBrukere","ou=Lager,ou=Logistikk,ou=AlleBrukere",
              "ou=Lager,ou=Logistikk,ou=AlleBrukere","ou=Lager,ou=Logistikk,ou=AlleBrukere",
              "ou=Lager,ou=Logistikk,ou=AlleBrukere","ou=Lager,ou=Logistikk,ou=AlleBrukere",
              "ou=Lager,ou=Logistikk,ou=AlleBrukere","ou=Lager,ou=Logistikk,ou=AlleBrukere",
              "ou=Lager,ou=Logistikk,ou=AlleBrukere","ou=Lager,ou=Logistikk,ou=AlleBrukere",
              "ou=Lager,ou=Logistikk,ou=AlleBrukere","ou=Lager,ou=Logistikk,ou=AlleBrukere",
              "ou=Lager,ou=Logistikk,ou=AlleBrukere","ou=Lager,ou=Logistikk,ou=AlleBrukere",
              "ou=Lager,ou=Logistikk,ou=AlleBrukere","ou=Lager,ou=Logistikk,ou=AlleBrukere",
              "ou=Lager,ou=Logistikk,ou=AlleBrukere","ou=Lager,ou=Logistikk,ou=AlleBrukere",
              "ou=Lager,ou=Logistikk,ou=AlleBrukere","ou=Lager,ou=Logistikk,ou=AlleBrukere",
              "ou=Lager,ou=Logistikk,ou=AlleBrukere","ou=Lager,ou=Logistikk,ou=AlleBrukere",
              "ou=Lager,ou=Logistikk,ou=AlleBrukere","ou=Kontor,ou=Logistikk,ou=AlleBrukere",
              "ou=Kontor,ou=Logistikk,ou=AlleBrukere","ou=Kontor,ou=Logistikk,ou=AlleBrukere",
              "ou=Kontor,ou=Logistikk,ou=AlleBrukere","ou=Kontor,ou=Logistikk,ou=AlleBrukere",
              "ou=Kontor,ou=Logistikk,ou=AlleBrukere","ou=Finans,ou=AlleBrukere",
              "ou=Finans,ou=AlleBrukere","ou=Finans,ou=AlleBrukere","ou=Kundeservice,ou=AlleBrukere",
              "ou=Kundeservice,ou=AlleBrukere","ou=Kundeservice,ou=AlleBrukere",
              "ou=Langdistanse,ou=Transport,ou=AlleBrukere",
              "ou=Langdistanse,ou=Transport,ou=AlleBrukere",
              "ou=Langdistanse,ou=Transport,ou=AlleBrukere",
              "ou=Langdistanse,ou=Transport,ou=AlleBrukere",
              "ou=Langdistanse,ou=Transport,ou=AlleBrukere",
              "ou=Langdistanse,ou=Transport,ou=AlleBrukere",
              "ou=Langdistanse,ou=Transport,ou=AlleBrukere",
              "ou=Langdistanse,ou=Transport,ou=AlleBrukere",
              "ou=Langdistanse,ou=Transport,ou=AlleBrukere",
              "ou=Regional,ou=Transport,ou=AlleBrukere","ou=Regional,ou=Transport,ou=AlleBrukere",
              "ou=Regional,ou=Transport,ou=AlleBrukere","ou=Regional,ou=Transport,ou=AlleBrukere",
              "ou=Regional,ou=Transport,ou=AlleBrukere","ou=Regional,ou=Transport,ou=AlleBrukere",
              "ou=Regional,ou=Transport,ou=AlleBrukere","ou=Regional,ou=Transport,ou=AlleBrukere",
              "ou=Regional,ou=Transport,ou=AlleBrukere","ou=Regional,ou=Transport,ou=AlleBrukere",
              "ou=Regional,ou=Transport,ou=AlleBrukere","ou=Regional,ou=Transport,ou=AlleBrukere",
              "ou=Regional,ou=Transport,ou=AlleBrukere","ou=Regional,ou=Transport,ou=AlleBrukere",
              "ou=Regional,ou=Transport,ou=AlleBrukere","ou=Regional,ou=Transport,ou=AlleBrukere",
              "ou=Regional,ou=Transport,ou=AlleBrukere","ou=Regional,ou=Transport,ou=AlleBrukere",
              "ou=By,ou=Transport,ou=AlleBrukere","ou=By,ou=Transport,ou=AlleBrukere",
              "ou=By,ou=Transport,ou=AlleBrukere","ou=Tog,ou=Transport,ou=AlleBrukere",
              "ou=Tog,ou=Transport,ou=AlleBrukere","ou=Tog,ou=Transport,ou=AlleBrukere",
              "ou=Tog,ou=Transport,ou=AlleBrukere"
)

Write-Output "UserName;GivenName;SurName;UserPrincipalName;DisplayName;Password;Department;Path" >tantetransportusers.csv

foreach ($i in 0..77) {
  $UserName          = $FirstName[$i].ToLower()
  $GivenName         = $FirstName[$i]
  $SurName           = $LastName[$i]
  $UserPrincipalName = $UserName + '@' + 'tante.transport'
  $DisplayName       = $GivenName + ' ' + $SurName
  $Password          = -join ('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPRSTUVWXYZ0123456789!"#%&()*+,-./:<=>?@[\]_{|}'.ToCharArray() | Get-Random -Count 16) + '1.aA'
  $Department        = ($OrgUnits[$i] -split '[=,]')[1]
  $Path              = $OrgUnits[$i] + ',' + "dc=tante,dc=transport"
  Write-Output "$UserName;$GivenName;$SurName;$UserPrincipalName;$DisplayName;$Password;$Department;$Path" >> tantetransportusers.csv
}
