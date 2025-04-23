*** Settings ***
Library    SeleniumLibrary
Resource    commun_b.resource

*** Test Cases ***

# Test De Pre-Condition

Demande de réservation avec des données valides
    1. Ouvrir le site web de réservation
    2. Se connecter avec un compte utilisateur valide
    3. Accéder à la section de réservation
    4. Saisir une date de début valide
    5. Saisir une date de fin valide
    6. Saisir un nombre de voyageurs valide
    7. Ajouter un message à l’attention de l’hôte
    8. Valider la demande de réservation
    9. Vérifier que la réservation est bien enregistrée
    Close Browser

# Test De Post-Condition

L’hôte refuse une demande de réservation
    1. Ouvrir le site web de réservation
    2. Se connecter avec un compte hote valide
    3. Accéder à l'onglet "Réservation"
    4. Sélectionner une demande en statut "NOUVEAU"
    5. Refuser la demande 
    6. Confirmer le refus
    7. Vérifier que le voyageur est notifié
    Close Browser

# Reinitialiser le Test

Reinitialiser et Supprimer la réservation valide en cours
    1. Ouvrir le site web de réservation
    2. Se connecter avec un compte hote valide
    3. Accéder à l'onglet "Réservation"
    4. Sélectionner une demande en statut "DETAILS"
    5. Supprimer la réservation valide en cours
    # 6. Effectuer Une Déconnexion Réussie
    Close Browser

*** Keywords ***

#  --- Test: L’hôte refuse une demande de réservation ---

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

4. Sélectionner une demande en statut "NOUVEAU"
    Cliquer Sur Le Premier Bouton Confirmer

Cliquer Sur Le Premier Bouton Confirmer
    Wait Until Element Is Visible    ${BOUTON CONFIRMER DETAILS}
    Click Element    ${BOUTON CONFIRMER DETAILS}
    
5. Refuser la demande
    Cliquer Sur Le Bouton Refuser

Cliquer Sur Le Bouton Refuser
    Click Element    ${BOUTON REFUSER}
    Wait Until Element Is Visible    ${RAISON REFUS}

6. Confirmer le refus
    Cliquer Sur Le Bouton De Raison
    Entrer La Raison Du Refus    ${raison refus2}
    Soumettre La Raison Du Refus

Cliquer Sur Le Bouton De Raison
    Click Element    ${RAISON REFUS}

Entrer La Raison Du Refus
    [Arguments]    ${raison refus2}
    Click Element    ${RAISON REFUS}
    Input Text    ${RAISON REFUS}    ${raison refus2}

Soumettre La Raison Du Refus
    Wait Until Element Is Visible    ${BOUTON SOUMETTRE RAISON REFUS}
    Click Button    ${BOUTON SOUMETTRE RAISON REFUS}

7. Vérifier que le voyageur est notifié
    Reload Page
    Wait Until Element Is Visible    ${BOUTON RESERVATION}