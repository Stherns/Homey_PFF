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

L’hôte accepte une demande de réservation
    1. Ouvrir le site web de réservation
    2. Se connecter avec un compte hote valide
    3. Accéder à l'onglet "Réservation"
    4. Sélectionner une demande en statut "NOUVEAU"
    5. Accepter la demande
    6. Confirmer l’acceptation
    # 7. Vérifier que le voyageur est notifié
    Close Browser

# Test De Post-Condition

Annulation par le voyageur avant paiement
    1. Ouvrir le site web de réservation
    2. Se connecter avec un compte utilisateur valide
    3. Accéder à l'onglet "Réservation"
    4. Sélectionner une réservation en attente de paiement
    5. Annuler la réservation
    6. Confirmer l’annulation
    # 7. Vérifier que l’hôte est notifié
    Close Browser

# Reinitialiser le Test

Reinitialiser et Supprimer la réservation valide en cours
    1. Ouvrir le site web de réservation
    2. Se connecter avec un compte hote valide
    3. Accéder à l'onglet "Réservation"
    4. Sélectionner une demande en statut "ANNULE"
    5. Supprimer la réservation valide en cours
    # 6. Effectuer Une Déconnexion Réussie 
    Close Browser

*** Keywords ***

#  --- Test: L’hôte accepte une demande de réservation ---

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
    Wait Until Element Is Visible    ${BOUTON CONFIRMER DETAILS}

5. Accepter la demande
    Cliquer Sur Le Premier Bouton Confirmer pour ensuite Annule

Cliquer Sur Le Premier Bouton Confirmer pour ensuite Annule
    Wait Until Element Is Visible    ${BOUTON CONFIRMER DETAILS}
    Click Element    ${BOUTON CONFIRMER DETAILS}

6. Confirmer l’acceptation
    Cliquer Sur Le Bouton Confirmer La Disponibilite

Cliquer Sur Le Bouton Confirmer La Disponibilite
    Wait Until Element Is Visible    ${BOUTON CONFIRMER}
    Click Element    ${BOUTON CONFIRMER}
    Reload Page

7. Vérifier que le voyageur est notifié
    Wait Until Element Is Visible    ${BOUTON RESERVATION}


#  --- Test: Annulation par le voyageur avant paiement ---

4. Sélectionner une réservation en attente de paiement
    Cliquer Sur Le Bouton "Payer Maintenant"

Cliquer Sur Le Bouton "Payer Maintenant"
    Wait Until Element Is Visible    ${BOUTON PAYER MAINTENANT}
    Click Element    ${BOUTON PAYER MAINTENANT}

5. Annuler la réservation
    Cliquer Sur Le Bouton Annuler

Cliquer Sur Le Bouton Annuler
    Click Element    ${BOUTON ANNULER}
    Wait Until Element Is Visible    ${RAISON}

6. Confirmer l’annulation
    Cliquer Sur Le Bouton De Raison
    Entrer La Raison De L'Annulation    ${raison}
    Soumettre La Raison D'Annulation

Cliquer Sur Le Bouton De Raison
    Click Element    ${RAISON}

Entrer La Raison De L'Annulation
    [Arguments]    ${raison}
    Click Element    ${RAISON}
    Input Text    ${RAISON}    ${raison}

Soumettre La Raison D'Annulation
    Click Button    ${BOUTON SOUMETTRE RAISON}

7. Vérifier que l’hôte est notifié
    Wait Until Element Is Visible    ${BOUTON RESERVATION}