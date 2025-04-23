*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${SERVEUR}    livraison3.testacademy.fr
${HOMEY URL}    http://${SERVEUR}/
${NAVIGATEUR}    Chrome
${LIEN SE CONNECTER}    xpath=//a[contains(text(),'Se connecter')]
${LIEN SE DECONNECTER}    xpath=(//a[contains(text(),'Se déconnecter')])[3]
${UTILISATEUR VALIDE}    stherns
# ${UTILISATEUR NON VALIDE}    nonvalide
${MOT DE PASSE VALIDE}    stherns
# ${MOT DE PASSE NON VALIDE}    nonvalide
${CHAMP NOM UTILISATEUR}    name=username
${CHAMP MOT DE PASSE}    name=password
${BOUTON VALIDER}    css=.homey_login_button
${TITRE TABLEAU DE BORD}    Tableau de bord - Livraison 3
# ${ESPACE POUR AFFICHER LES ERREURS}    css=#modal-login .error
# ${TITRE ACCEUIL}    Accueil - Livraison 3
${LIEN LOGO}    xpath=//a[contains(text(),'Accueil')]
${CHAMP DATE DEBUT}    name=arrive
${DATE DEBUT}    2025-04-27
${CHAMP DATE FIN}    name=depart
${DATE FIN}    2025-04-30
${CHAMP NOMBRE VOYAGEURS}    xpath=//div[3]/input
${NOMBRE VOYAGEURS}   
${VOYAGEUR ADULTES}    css=.banner-caption .search_adult_plus > .fa
${VOYAGEURS ENFANTS}    css=.banner-caption .search_child_plus > .fa
${ANIMAUX DOMESTIQUES}    css=.banner-caption .control:nth-child(1) > .radio-tab-inner
${BOUTON VALIDER VOYAGEURS}    css=.banner-caption .guest-apply-btn > .btn
${BOUTON CHERCHER}    css=.search-button > .btn-primary:nth-child(1)
${CHOIX CHAMBRE}    xpath=//div[@id='homey_halfmap_listings_container']/div/div/div/div/a
${CONTACTEZ L'HOTE}    css=.btn-full-width:nth-child(2)
${CHAMP NOM}    name=name
${NOM}    Djhery MOUSSAVOU
${CHAMP EMAIL}    name=email
${EMAIL}    stherns@yahoo.fr
${CHAMP TELEPHONE}    name=phone
${TELEPHONE}    0758978822
${CHAMP MESSAGE}    name=message
${MESSAGE}    Bonjour, je suis intéressé par votre logement.
${BOUTON VALIDER MESSAGE}    xpath=//button[@type='submit']
${ONGLET FERMER}    xpath=//div[2]/div/div/div/div/button/span
${BOUTON RESERVATION}    xpath=//div[2]/div/button
${CLIC DANS LE VIDE}    css=.main-content-area
${ICON UTILISATEUR}    css=.account-loggedin
${ONGLET RESERVATIONS}    xpath=//a[@href='http://livraison3.testacademy.fr/index.php/reservations/']
${BOUTON DETAILS}    xpath=//a[contains(text(),'Détails')]
${HOTE VALIDE}    MOUSSAVOU
${HOTE MOT DE PASSE VALIDE}    stherns
${BOUTON CONFIRMER DETAILS}    xpath=//a[contains(text(),'Confirmer')]
${BOUTON CONFIRMER}    css=.confirm-offsite-reservation:nth-child(2)
${BOUTON REFUSER}    css=.dashboard-sidebar > #decline-reservation-btn
${RAISON REFUS}    id=reason22
${raison refus2}    Bonjour, Desole le logement est en travaux.
${BOUTON SOUMETTRE RAISON REFUS}   id=decline
${BOUTON ANNULER}    css=.dashboard-sidebar > #cancel-reservation-btn
${RAISON}    id=reason
${raison3}    Bonjour, desole le logement est en travaux.
${BOUTON SOUMETTRE RAISON}    id=cancelled
${BOUTON SOUMETTRE RAISON2}    id=cancelled
${BOUTON SUPPRIMER}    css=.reservation-delete
${BOUTON TRASH}    xpath=//button[contains(.,'Supprimer')]
${BOUTON PAYER MAINTENANT}    xpath=//a[contains(text(),'Payez maintenant')]
${BOUTON ANNULE DETAILS}    xpath=//a[contains(text(),'Détails')]
${BOUTON MARQUE PAYE}    css=.mark-as-paid > .fa
${BOUTON CONFIRMER MARQUE PAYE}    xpath=//button[contains(.,'Confirmer')]
${ONGLET VOYAGES}   xpath=//a[@href='http://livraison3.testacademy.fr/index.php/reservations/']
${MESSAGE D'ERREUR}    css=.notify
${DATE DEBUT VIDE}    
${DATE FIN VIDE}
${AFFICHAGE MESSAGE ERREUR}    xpath=//div[@id='homey_remove_on_mobile']/div/div[2]/div/div
${ONGLET FERMER CONNEXION}    css=#modal-login span

*** Keywords ***

# Test: Demande de réservation avec des données valides

1. Ouvrir le site web de réservation
    Ouvrir Le Navigateur Et Accéder A La Page d'Accueil

Ouvrir Le Navigateur Et Accéder A La Page d'Accueil
    Open Browser    browser=${navigateur}
    Go To    ${HOMEY URL}
    Maximize Browser Window

2. Se connecter avec un compte utilisateur valide
    Accéder A La Page De Connexion
    Entrer Le Nom d'Utilisateur    ${UTILISATEUR VALIDE}
    Entrer Le Mot De Passe    ${MOT DE PASSE VALIDE}
    Soumettre Le Formulaire De Connexion
    Vérifiez Que Le Tableau De Bord Est Visible

3. Accéder à la section de réservation
    Accéder A La Page De Reservation
    
Accéder A La Page De Reservation
    Click Element    ${LIEN LOGO}
    Wait Until Element Is Visible    ${CHAMP DATE DEBUT}    
    
4. Saisir une date de début valide    
    Entrer La Date de Debut    ${DATE DEBUT}
    Entrer La Date de Fin    ${DATE FIN}

Entrer La Date de Debut
    [Arguments]    ${date_debut}
    Click Element     ${CHAMP DATE DEBUT}
    Input Text    ${CHAMP DATE DEBUT}    ${date_debut}

5. Saisir une date de fin valide
    Entrer La Date de Fin    ${DATE FIN}

Entrer La Date de Fin
    [Arguments]    ${date_fin}
    Click Element     ${CHAMP DATE FIN}
    Input Text    ${CHAMP DATE FIN}    ${date_fin}

6. Saisir un nombre de voyageurs valide
    Entrer Le Nombre de Voyageurs    ${NOMBRE VOYAGEURS}
    Cliquer Sur Le Bouton De Validation

Entrer Le Nombre de Voyageurs
    [Arguments]    ${nombre_voyageurs}
    Click Element     ${CHAMP NOMBRE VOYAGEURS}
    Input Text    ${CHAMP NOMBRE VOYAGEURS}    ${nombre_voyageurs}
    Double Click Element    ${VOYAGEUR ADULTES}
    Click Element    ${VOYAGEURS ENFANTS}
    Click Element    ${ANIMAUX DOMESTIQUES}
    
Cliquer Sur Le Bouton De Validation
    Click Element    ${BOUTON VALIDER VOYAGEURS}
    Click Button    ${BOUTON CHERCHER}
    Wait Until Element Is Visible    ${CHOIX CHAMBRE}

7. Ajouter un message à l’attention de l’hôte
    Choix De La Chambre
    Contactez L'Hote
    Entrer Le Nom    ${NOM}
    Entrer L'Email    ${EMAIL}
    Entrer Le Telephone    ${TELEPHONE}
    Entrer Le Message    ${MESSAGE}
    Soumettre Le Formulaire De Message
    Fermer la fenêtre de message
    
Choix De La Chambre
    Click Element    ${CHOIX CHAMBRE}

Contactez L'Hote
    Click Element    ${CONTACTEZ L'HOTE}
    Wait Until Element Is Visible    ${CHAMP NOM}

Entrer Le Nom
    [Arguments]    ${NOM}
    Click Element    ${CHAMP NOM}
    Input Text    ${CHAMP NOM}    ${NOM}

Entrer L'Email
    [Arguments]    ${email}
    Click Element    ${CHAMP EMAIL}
    Input Text    ${CHAMP EMAIL}    ${EMAIL}

Entrer Le Telephone
    [Arguments]    ${telephone}
    Click Element    ${CHAMP TELEPHONE}
    Input Text    ${CHAMP TELEPHONE}    ${TELEPHONE}

Entrer Le Message
    [Arguments]    ${message}
    Click Element    ${CHAMP MESSAGE}
    Input Text    ${CHAMP MESSAGE}    ${MESSAGE}

Soumettre Le Formulaire De Message
    Click Button    ${BOUTON VALIDER MESSAGE}

Fermer la fenêtre de message
    Click Element    ${ONGLET FERMER}

8. Valider la demande de réservation
    Cliquer Sur Le Bouton De Demande De Reservation

Cliquer Sur Le Bouton De Demande De Reservation
    Click Element    ${CLIC DANS LE VIDE}
    Click Button    ${BOUTON RESERVATION}
    Click Element    ${CLIC DANS LE VIDE}

9. Vérifier que la réservation est bien enregistrée
    Accéder A La Section Des Reservations
    
Accéder A La Section Des Reservations
    Click Element    ${ICON UTILISATEUR}
    Wait Until Element Is Visible    ${ONGLET RESERVATIONS}
    Click Element    ${ONGLET RESERVATIONS}


# Reinitialiser le Test

2. Se connecter avec un compte hote valide
    Accéder A La Page De Connexion
    Entrer Le Nom d'Utilisateur    ${HOTE VALIDE}
    Entrer Le Mot De Passe    ${HOTE MOT DE PASSE VALIDE}
    Soumettre Le Formulaire De Connexion
    Vérifiez Que Le Tableau De Bord Est Visible

Accéder A La Page De Connexion
    Click Element    ${LIEN SE CONNECTER}
    Wait Until Element Is Visible    ${CHAMP NOM UTILISATEUR}

Entrer Le Nom d'Utilisateur
    [Arguments]    ${nom_utilisateur}
    Click Element     ${CHAMP NOM UTILISATEUR}
    Input Text    ${CHAMP NOM UTILISATEUR}    ${nom_utilisateur}

Entrer Le Mot De Passe
    [Arguments]    ${mot_de_passe}
    Click Element     ${CHAMP MOT DE PASSE}
    Input Text    ${CHAMP MOT DE PASSE}    ${mot_de_passe}

Soumettre Le Formulaire De Connexion
   Click Button    ${BOUTON VALIDER}

Vérifiez Que Le Tableau De Bord Est Visible
    Wait Until Element Is Not Visible   ${CHAMP NOM UTILISATEUR}
    Title Should Be    ${TITRE TABLEAU DE BORD}

3. Accéder à l'onglet "Réservation"
    Accéder A La Rubrique "Reservations"
    
Accéder A La Rubrique "Reservations"
    Click Element    ${ICON UTILISATEUR}
    Wait Until Element Is Visible    ${ONGLET RESERVATIONS}
    Click Element    ${ONGLET RESERVATIONS}

# 4. Sélectionner une demande en statut "NOUVEAU"
#     Wait Until Element Is Visible    ${BOUTON CONFIRMER DETAILS}

4. Sélectionner une demande en statut "DETAILS"
    Cliquer Sur Le Premier Bouton Details

Cliquer Sur Le Premier Bouton Details
    Wait Until Element Is Visible    ${BOUTON DETAILS}
    Click Element    ${BOUTON DETAILS}

4. Sélectionner une demande en statut "ANNULE"
    Cliquer Sur Le Premier Bouton Confirmer

Cliquer Sur Le Premier Bouton Confirmer
    Wait Until Element Is Visible    ${BOUTON ANNULE DETAILS}
    Click Element    ${BOUTON ANNULE DETAILS}

5. Supprimer la réservation valide en cours
    Cliquer Sur Le Bouton Supprimer
    Mettre Dans La Corbeille La Reservation Valide

Cliquer Sur Le Bouton Supprimer
    Wait Until Element Is Visible   ${BOUTON SUPPRIMER} 
    Click Element    ${BOUTON SUPPRIMER}

Mettre Dans La Corbeille La Reservation Valide
    Wait Until Element Is Visible    ${BOUTON TRASH}
    Click Element    ${BOUTON TRASH}

6. Effectuer Une Déconnexion Réussie
    Se Deconnecter
    Vérifier Que Le Lien De Connexion Est Visible

Se Deconnecter
    Reload Page
    Click Element    ${LIEN SE DECONNECTER}

Vérifier Que Le Lien De Connexion Est Visible
    Wait Until Element Is Not Visible    ${LIEN SE DECONNECTER}
    Element Should Be Visible    ${LIEN SE CONNECTER}