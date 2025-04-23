*** Settings ***
Library    SeleniumLibrary
Resource    commun_a.resource

*** Test Cases ***

Date de fin antérieure à la date de début
    1. Ouvrir le site web de réservation
    2. Se connecter avec un compte utilisateur valide
    3. Accéder à la section de réservation
    4. Saisir une date de début posterieur à la date de fin
    5. Sélectionner une date de fin antérieure à la date de début
    6. Saisir un nombre de voyageurs valide.
    7. Ajouter un message à l’attention de l’hôte
    8. Valider la demande de réservation
    9. Vérifier que la réservation n'est pas enregistrée
    Close Browser
    
*** Keywords ***

4. Saisir une date de début posterieur à la date de fin
    Entrer La Date de Debut posterieur à la date de fin    ${DATE DEBUT POSTERIEUR}

Entrer La Date de Debut posterieur à la date de fin
    [Arguments]    ${date_debut_posterieur}
    Click Element     ${CHAMP DATE DEBUT}
    Input Text    ${CHAMP DATE DEBUT}    ${date_debut_posterieur}

5. Sélectionner une date de fin antérieure à la date de début
    Entrer La Date de Fin antérieure à la date de début   ${DATE FIN ANTERIEUR}

Entrer La Date de Fin antérieure à la date de début
    [Arguments]    ${date_fin_anterieur}
    Click Element     ${CHAMP DATE FIN}
    Input Text    ${CHAMP DATE FIN}    ${date_fin_anterieur}

6. Saisir un nombre de voyageurs valide.
    Entrer Le Nombre de Voyageurs    ${NOMBRE VOYAGEURS}
    Cliquer Sur Le Bouton De Validation
    Wait Until Element Is Visible    ${CHOIX CHAMBRE}

Entrer Le Nombre de Voyageurs
    [Arguments]    ${nombre_voyageurs}
    Click Element     ${CHAMP NOMBRE VOYAGEURS}
    Input Text    ${CHAMP NOMBRE VOYAGEURS}    ${nombre_voyageurs}
    Double Click Element    ${VOYAGEUR ADULTES}
    # Click Element    ${VOYAGEURS ENFANTS}
    Click Element    ${ANIMAUX DOMESTIQUES}
    
Cliquer Sur Le Bouton De Validation
    Click Element    ${BOUTON VALIDER VOYAGEURS}
    Click Button    ${BOUTON CHERCHER}

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