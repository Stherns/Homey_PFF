*** Settings ***
Library    SeleniumLibrary
Resource    commun_a.resource

*** Test Cases ***

Champ nombre de voyageurs vide
    1. Ouvrir le site web de réservation
    2. Se connecter avec un compte utilisateur valide
    3. Accéder à la section de réservation
    4. Saisir une date de début valide
    5. Saisir une date de fin valide
    6. Laisser le champ "Nombre de voyageurs" vide
    7. Ajouter un message à l’attention de l’hôte
    8. Valider la demande de réservation
    9. Vérifier que la réservation n'est pas enregistrée
    Close Browser

*** Keywords ***

6. Laisser le champ "Nombre de voyageurs" vide
    Ne Pas Entrer Le Nombre de Voyageurs    ${NOMBRE VOYAGEURS}
    Cliquer Sur Le Bouton De Validation

Ne Pas Entrer Le Nombre de Voyageurs
    [Arguments]    ${nombre_voyageurs}
    Click Element     ${CHAMP NOMBRE VOYAGEURS}
    Input Text    ${CHAMP NOMBRE VOYAGEURS}    ${nombre_voyageurs}
    
Cliquer Sur Le Bouton De Validation
    Click Element    ${BOUTON VALIDER VOYAGEURS}
    Click Button    ${BOUTON CHERCHER}
    Wait Until Element Is Visible    ${CHOIX CHAMBRE}

9. Vérifier que la réservation n'est pas enregistrée
    Accéder A La Section Des Reservations
    Effectuer Une Déconnexion Réussie
    Vérifier Que Le Lien De Connexion Est Visible

Accéder A La Section Des Reservations
    Click Element    ${ICON UTILISATEUR}
    Wait Until Element Is Visible    ${ONGLET RESERVATIONS}
    Click Element    ${ONGLET RESERVATIONS}

Effectuer Une Déconnexion Réussie
    Click Element    ${LIEN SE DECONNECTER}

Vérifier Que Le Lien De Connexion Est Visible
    Wait Until Element Is Not Visible    ${LIEN SE DECONNECTER}
    Element Should Be Visible    ${LIEN SE CONNECTER}
