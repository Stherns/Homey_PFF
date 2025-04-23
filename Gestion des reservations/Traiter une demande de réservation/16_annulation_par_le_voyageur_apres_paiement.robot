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
    7. Vérifier que le voyageur est notifié
    Close Browser

Paiement réussi
    1. Ouvrir le site web de réservation
    2. Se connecter avec un compte utilisateur valide
    3. Accéder à l'onglet "Réservation"
    4. Sélectionner une réservation en attente de paiement
    ## 5. Choisir un mode de paiement valide
    6. Valider le paiement
    7. Vérifier que le statut de la réservation est mis à jour
    ## 8. Vérifier que l’hôte est notifié
    Close Browser

# Test De Post-Condition

Annulation par le voyageur après paiement
    1. Ouvrir le site web de réservation
    2. Se connecter avec un compte utilisateur valide
    3. Accéder à l'onglet "Réservation"
    4. Sélectionner une réservation confirmée
    5. Annuler la réservation
    # 6. Vérifier l’application des politiques de remboursement
    # 7. Vérifier que l’hôte et le voyageur sont notifiés
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
    Cliquer Sur Le Premier Bouton Confirmer

Cliquer Sur Le Premier Bouton Confirmer
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

#  --- Test: Paiement réussi ---

3. Accéder à l'onglet "Voyages"
    Accéder A La Rubrique "Voyages"
    
Accéder A La Rubrique "Voyages"
    Click Element    ${ICON UTILISATEUR}
    Wait Until Element Is Visible    ${ONGLET VOYAGES}
    Click Element    ${ONGLET VOYAGES}

4. Sélectionner une réservation en attente de paiement
    Cliquer Sur Le Bouton "Payer maintenant"

Cliquer Sur Le Bouton "Payer maintenant"
    Wait Until Element Is Visible    ${BOUTON PAYER MAINTENANT}
    Click Element    ${BOUTON PAYER MAINTENANT}

# 5. Choisir un mode de paiement valide

6. Valider le paiement
    Click Element    ${BOUTON MARQUE PAYE}
    Wait Until Element Is Visible    ${BOUTON CONFIRMER MARQUE PAYE}
    Click Element    ${BOUTON CONFIRMER MARQUE PAYE}
    Reload Page

7. Vérifier que le statut de la réservation est mis à jour
    Acceder A La Rubrique "Voyages"
    
Acceder A La Rubrique "Voyages"
    Click Element    ${ICON UTILISATEUR}
    Wait Until Element Is Visible    ${ONGLET RESERVATIONS}
    Click Element    ${ONGLET RESERVATIONS}

# 8. Vérifier que l’hôte est notifié


#  --- Test: Annulation par l’hôte après paiement ---

3. Accéder à la section "Réservations confirmées"
    Accéder A La Rubrique "Reservations confirmées"
    
Accéder A La Rubrique "Reservations confirmées"
    Click Element    ${ICON UTILISATEUR}
    Wait Until Element Is Visible    ${ONGLET RESERVATIONS}
    Click Element    ${ONGLET RESERVATIONS}

4. Sélectionner une réservation confirmée
    Wait Until Element Is Visible    ${BOUTON DETAILS}
    Cliquer Sur Le Premier Bouton Details.

Cliquer Sur Le Premier Bouton Details.
    Wait Until Element Is Visible    ${BOUTON DETAILS}
    Click Element    ${BOUTON DETAILS}

5. Annuler la réservation
    Cliquer Sur Le Bouton Annuler
    Cliquer Sur Le Bouton De Raison
    Entrer La Raison Du Refus    ${raison3}
    Soumettre La Raison Du Refus
    # Vérifier que la réservation est bien annulée

Cliquer Sur Le Bouton Annuler
    Click Element    ${BOUTON ANNULER}
    Wait Until Element Is Visible    ${RAISON}

Cliquer Sur Le Bouton De Raison
    Click Element    ${RAISON}

Entrer La Raison Du Refus
    [Arguments]    ${raison3}
    Click Element    ${RAISON}
    Input Text    ${RAISON}    ${raison3}

Soumettre La Raison Du Refus
    Click Button    ${BOUTON SOUMETTRE RAISON}

Vérifier que la réservation est bien annulée
    Reload Page
    Click Element    ${ICON UTILISATEUR}
    Wait Until Element Is Visible    ${ONGLET RESERVATIONS}
    Click Element    ${ONGLET RESERVATIONS}

# 7. Vérifier que le voyageur est remboursé

# 8. Vérifier que l’hôte et le voyageur sont notifiés