*** Settings ***
Library    SeleniumLibrary
Resource    commun_a.resource
# Suite Setup    MOTCLE1    (Executer avant le premier cas de test la suite de test)
# Suite Teardown    MOTCLE2    (Executer apres le dernier cas de test de la suite de test)

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
    # 10. Vérifier que l'hôte reçoit une notification de demande de réservation
    # 11. Vérifier que le voyageur reçoit une confirmation de sa demande
    Close Browser

# Test De Post-Condition

# Tentative de réservation d'une période non disponible
    # 1. Ouvrir le site web de réservation
    # 2. Se connecter avec un compte utilisateur valide
    # 3. Accéder à la section de réservation
    # 3. Sélectionner une période déjà réservée dans le calendrier
    ## 4. Saisir une date de début déjà réservée dans le calendrier
    ## 5. Saisir une date de fin déjà réservée dans le calendrier
    # 6. Saisir un nombre de voyageurs valide
    # 7. Ajouter un message à l’attention de l’hôte
    # 8. Valider la demande de réservation/
    # 9. Vérifier qu’un message d'erreur s'affiche
    # 10. Vérifier que la réservation n'est pas enregistrée


# 2. Tentative de réservation d'une période non disponible
#     1. Ouvrir le site web de réservation
#     2. Se connecter avec un compte utilisateur valide
#     3. Accéder à la section de réservation.
#     ## 3. Sélectionner une période déjà réservée dans le calendrier
#     ## 4. Saisir une date de début déjà réservée dans le calendrier.
#     ## 5. Saisir une date de fin déjà réservée dans le calendrier.
#     6. Saisir un nombre de voyageurs valide.
#     4. Saisir une date de début valide.
#     5. Saisir une date de fin valide.
#     ## 7. Ajouter un message à l’attention de l’hôte.
#     8. Valider la demande de réservation.
#     ## 9. Vérifier qu’un message d'erreur s'affiche
#     ## 10. Vérifier que la réservation n'est pas enregistrée


# Reinitialiser le Test

Reinitialiser et Supprimer la réservation valide en cours
    1. Ouvrir le site web de réservation
    2. Se connecter avec un compte hote valide
    3. Accéder à l'onglet "Réservation"
    4. Sélectionner une demande en statut "NOUVEAU"
    5. Supprimer la réservation valide en cours
    Close Browser

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

3. Accéder à la section de réservation
    Accéder A La Page De Reservation
    
Accéder A La Page De Reservation
    Click Element    ${LIEN LOGO}
    Wait Until Element Is Visible    ${CHAMP DATE DEBUT}    
    
4. Saisir une date de début valide    
    Entrer La Date de Debut    ${DATE DEBUT}
    # Entrer La Date de Fin    ${DATE FIN}

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

# 10. Vérifier que l'hôte reçoit une notification de demande de réservation
#     Vérifier Que L'Hote Recoit Une Notification De Demande De Reservation

# 11. Vérifier que le voyageur reçoit une confirmation de sa demande
#     Vérifier Que Le Voyageur Recoit Une Confirmation De Sa Demande


# Test: Tentative de réservation d'une période non disponible


# 4. Saisir une date de début déjà réservée dans le calendrier
#     Entrer La Date de Debut.    ${DATE DEBUT}
#     # Entrer La Date de Fin    ${DATE FIN}

# Entrer La Date de Debut.
#     [Arguments]    ${date_debut}
#     Click Element     ${CHAMP DATE DEBUT}
#     Input Text    ${CHAMP DATE DEBUT}    ${date_debut}


# 5. Saisir une date de fin déjà réservée dans le calendrier
#     Entrer La Date de Fin.    ${DATE FIN}

# Entrer La Date de Fin.
#     [Arguments]    ${date_fin}
#     Click Element     ${CHAMP DATE FIN}
#     Input Text    ${CHAMP DATE FIN}    ${date_fin}


# Reinitialiser le Test

2. Se connecter avec un compte hote valide
    Accéder A La Page De Connexion.
    Entrer Le Nom d'Utilisateur.    ${HOTE VALIDE}
    Entrer Le Mot De Passe.    ${HOTE MOT DE PASSE VALIDE}
    Soumettre Le Formulaire De Connexion.
    Vérifiez Que Le Tableau De Bord Est Visible.

Accéder A La Page De Connexion.
    Click Element    ${LIEN SE CONNECTER}
    Wait Until Element Is Visible    ${CHAMP NOM UTILISATEUR}

Entrer Le Nom d'Utilisateur.
    [Arguments]    ${nom_utilisateur}
    Click Element     ${CHAMP NOM UTILISATEUR}
    Input Text    ${CHAMP NOM UTILISATEUR}    ${nom_utilisateur}

Entrer Le Mot De Passe.
    [Arguments]    ${mot_de_passe}
    Click Element     ${CHAMP MOT DE PASSE}
    Input Text    ${CHAMP MOT DE PASSE}    ${mot_de_passe}

Soumettre Le Formulaire De Connexion.
   Click Button    ${BOUTON VALIDER}

Vérifiez Que Le Tableau De Bord Est Visible.
    Wait Until Element Is Not Visible   ${CHAMP NOM UTILISATEUR}
    Title Should Be    ${TITRE TABLEAU DE BORD}

3. Accéder à l'onglet "Réservation"
    Accéder A La Rubrique "Reservations"
    
Accéder A La Rubrique "Reservations"
    Click Element    ${ICON UTILISATEUR}
    Wait Until Element Is Visible    ${ONGLET RESERVATIONS}
    Click Element    ${ONGLET RESERVATIONS}

4. Sélectionner une demande en statut "NOUVEAU"
    Cliquer Sur Le Premier Bouton Details

Cliquer Sur Le Premier Bouton Details
    Wait Until Element Is Visible    ${BOUTON CONFIRMER DETAILS}
    Click Element    ${BOUTON CONFIRMER DETAILS}

5. Supprimer la réservation valide en cours
    Cliquer Sur Le Bouton Supprimer
    Mettre Dans La Corbeille La Reservation Valide

Cliquer Sur Le Bouton Supprimer
    Wait Until Element Is Visible   ${BOUTON SUPPRIMER} 
    Click Element    ${BOUTON SUPPRIMER}

Mettre Dans La Corbeille La Reservation Valide
    Wait Until Element Is Visible    ${BOUTON TRASH}
    Click Element    ${BOUTON TRASH}


# 2. Tentative de réservation d'une période non disponible

3. Accéder à la section de réservation.
    Accéder A La Page De Reservation.
    
Accéder A La Page De Reservation.
    Click Element    ${LIEN LOGO}
    Wait Until Element Is Visible    ${CHAMP DATE DEBUT}    

4. Saisir une date de début déjà réservée dans le calendrier.  
    Entrer La Date de Debut..    ${DATE DEBUT VIDE}

Entrer La Date de Debut..
    [Arguments]    ${date_debut}
    Click Element     ${CHAMP DATE DEBUT}
    Input Text    ${CHAMP DATE DEBUT}    ${date_debut}

5. Saisir une date de fin déjà réservée dans le calendrier.
    Entrer La Date de Fin..    ${DATE FIN VIDE}

Entrer La Date de Fin..
    [Arguments]    ${date_fin}
    Click Element     ${CHAMP DATE FIN}
    Input Text    ${CHAMP DATE FIN}    ${date_fin}

6. Saisir un nombre de voyageurs valide.
    Entrer Le Nombre de Voyageurs.    ${NOMBRE VOYAGEURS}
    Cliquer Sur Le Bouton De Validation.

Entrer Le Nombre de Voyageurs.
    [Arguments]    ${nombre_voyageurs}
    Click Element     ${CHAMP NOMBRE VOYAGEURS}
    Input Text    ${CHAMP NOMBRE VOYAGEURS}    ${nombre_voyageurs}
    Double Click Element    ${VOYAGEUR ADULTES}
    Click Element    ${VOYAGEURS ENFANTS}
    Click Element    ${ANIMAUX DOMESTIQUES}
    Click Element    ${BOUTON VALIDER VOYAGEURS}
    
Cliquer Sur Le Bouton De Validation.
    Click Button    ${BOUTON CHERCHER}
    Wait Until Element Is Visible    ${CHOIX CHAMBRE}
    Choix De La Chambre..

Choix De La Chambre..
    Click Element    ${CHOIX CHAMBRE}

4. Saisir une date de début valide.    
    Entrer La Date de Debut...    ${DATE DEBUT}
    Entrer La Date de Fin...    ${DATE FIN}

Entrer La Date de Debut...
    [Arguments]    ${date_debut}
    Wait Until Element Is Visible     ${CHAMP DATE DEBUT}
    Click Element     ${CHAMP DATE DEBUT}
    Input Text    ${CHAMP DATE DEBUT}    ${date_debut}

Entrer La Date de Fin...
    [Arguments]    ${date_fin}
    Click Element     ${CHAMP DATE FIN}
    Input Text    ${CHAMP DATE FIN}    ${date_fin}

5. Saisir une date de fin valide.
    Entrer La Date de Fin....   ${DATE FIN}

Entrer La Date de Fin....
    [Arguments]    ${date_fin}
    Click Element     ${CHAMP DATE FIN}
    Input Text    ${CHAMP DATE FIN}    ${date_fin}

7. Ajouter un message à l’attention de l’hôte.
    Contactez L'Hote.
    Entrer Le Nom.    ${NOM}
    Entrer L'Email.    ${EMAIL}
    Entrer Le Telephone.    ${TELEPHONE}
    Entrer Le Message.    ${MESSAGE}
    Soumettre Le Formulaire De Message.
    Fermer la fenêtre de message.
    
Contactez L'Hote.
    Click Element    ${CONTACTEZ L'HOTE}
    Wait Until Element Is Visible    ${CHAMP NOM}

Entrer Le Nom.
    [Arguments]    ${NOM}
    Click Element    ${CHAMP NOM}
    Input Text    ${CHAMP NOM}    ${NOM}

Entrer L'Email.
    [Arguments]    ${email}
    Click Element    ${CHAMP EMAIL}
    Input Text    ${CHAMP EMAIL}    ${EMAIL}

Entrer Le Telephone.
    [Arguments]    ${telephone}
    Click Element    ${CHAMP TELEPHONE}
    Input Text    ${CHAMP TELEPHONE}    ${TELEPHONE}

Entrer Le Message.
    [Arguments]    ${message}
    Click Element    ${CHAMP MESSAGE}
    Input Text    ${CHAMP MESSAGE}    ${MESSAGE}

Soumettre Le Formulaire De Message.
    Click Button    ${BOUTON VALIDER MESSAGE}

Fermer la fenêtre de message.
    Click Element    ${ONGLET FERMER}

8. Valider la demande de réservation.
    Cliquer Sur Le Bouton De Demande De Reservation.

Cliquer Sur Le Bouton De Demande De Reservation.
    Click Element    ${CLIC DANS LE VIDE}
    Click Button    ${BOUTON RESERVATION}
    Click Element    ${CLIC DANS LE VIDE}