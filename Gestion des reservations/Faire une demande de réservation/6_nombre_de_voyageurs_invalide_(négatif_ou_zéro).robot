*** Settings ***
Library    SeleniumLibrary
Resource    commun_a.resource

*** Test Cases ***

Nombre de voyageurs invalide (négatif ou zéro)
    1. Ouvrir le site web de réservation
    2. Se connecter avec un compte utilisateur valide
    3. Accéder à la section de réservation
    4. Saisir une date de début valide
    5. Saisir une date de fin valide
    6. Saisir un nombre de voyageurs invalide
    7. Ajouter un message à l’attention de l’hôte
    8. Valider la demande de réservation
    9. Vérifier que la réservation n'est pas enregistrée
    Close Browser

*** Keywords ***

6. Saisir un nombre de voyageurs invalide
    Entrer Un Nombre de Voyageurs invalide    ${NOMBRE VOYAGEURS INVALIDE}
    Cliquer Sur Le Bouton De Validation

Entrer Un Nombre de Voyageurs invalide
    [Arguments]    ${nombre_voyageurs}
    Click Element     ${CHAMP NOMBRE VOYAGEURS}
    Input Text    ${CHAMP NOMBRE VOYAGEURS}    ${nombre_voyageurs}
    # Double Click Element    ${VOYAGEUR ADULTES}
    # Click Element    ${VOYAGEURS ENFANTS}
    # Click Element    ${ANIMAUX DOMESTIQUES}
    
Cliquer Sur Le Bouton De Validation
    Click Element    ${BOUTON VALIDER VOYAGEURS}
    Click Button    ${BOUTON CHERCHER}
    Wait Until Element Is Visible    ${CHOIX CHAMBRE}

9. Vérifier que la réservation n'est pas enregistrée
    Accéder A La Section Des Reservations
    Effectuer Une Déconnexion Réussie
    Vérifier Que Le Lien De Connexion Est Visible
    Close Browser

Accéder A La Section Des Reservations
    Click Element    ${ICON UTILISATEUR}
    Wait Until Element Is Visible    ${ONGLET RESERVATIONS}
    Click Element    ${ONGLET RESERVATIONS}

Effectuer Une Déconnexion Réussie
    Click Element    ${LIEN SE DECONNECTER}

Vérifier Que Le Lien De Connexion Est Visible
    Wait Until Element Is Not Visible    ${LIEN SE DECONNECTER}
    Element Should Be Visible    ${LIEN SE CONNECTER}