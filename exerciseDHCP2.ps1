#=============================================================================================
#NAME:exerciceDHCP1.ps1
#AUTHOR: Garcia Ryan 
#DATE: 27/03/2024
#
#Version 1.0
#COMMENTS:créeation d'étendue DHCP avec demande du nom de domaine et ip du serveur de domaine 
#
#=============================================================================================
# Demander à l'utilisateur de saisir les informations nécessaires
$NomEtendue = Read-Host "Entrez le nom de l'étendue DHCP"
$AdresseReseau = Read-Host "Entrez l'adresse réseau de l'étendue DHCP (ex: 192.168.1.0)"
$MasqueSousReseau = Read-Host "Entrez le masque de sous-réseau de l'étendue (ex: 255.255.255.0)"
$PremiereAdresse = Read-Host "Entrez la première adresse à distribuer"
$DerniereAdresse = Read-Host "Entrez la dernière adresse à distribuer"
$Passerelle = Read-Host "Entrez l'adresse de la passerelle à diffuser"
$NomDomaine = Read-Host "Entrez le nom de domaine"
$AdresseIPDomaine = Read-Host "Entrez l'adresse IP du serveur de domaine"


# Afficher les informations saisies pour confirmation
Write-Host "Nom de l'étendue DHCP: $NomEtendue"
Write-Host "Adresse réseau: $AdresseReseau"
Write-Host "Masque de sous-réseau: $MasqueSousReseau"
Write-Host "Plage d'adresses: $PremiereAdresse - $DerniereAdresse"
Write-Host "Passerelle: $Passerelle"
Write-Host "Nom de domaine: $NomDomaine"
Write-Host "Adresse IP du serveur de domaine: $AdresseIPDomaine"

# Demander confirmation à l'utilisateur
$Confirmation = Read-Host "Confirmez-vous la création de cette étendue DHCP ? (O/N)"

if ($Confirmation -eq "O" -or $Confirmation -eq "o") {
# Créer l'étendue DHCP avec les informations fournies
Add-DhcpServerv4Scope -Name $NomEtendue -StartRange $PremiereAdresse -EndRange $DerniereAdresse -SubnetMask $MasqueSousReseau -State Active -Description "Étendue DHCP pour $NomEtendue" 

 Write-Host "L'étendue DHCP a été créée avec succès."
} else {
    Write-Host "La création de l'étendue DHCP a été annulée."
    return  # Arrêter l'exécution du script
}