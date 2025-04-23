*** Settings ***
Library    SeleniumLibrary
Resource    commun_a.resource

*** Test Cases ***

Voyageur non connecté tente de réserver
    1. Ouvrir le site web de réservation
    2. Accéder à la section de réservation sans être connecté
    3. Saisir une date de début valide
    4. Saisir une date de fin valide
    5. Saisir un nombre de voyageurs valide
    6. Ajouter un message à l’attention de l’hôte
    7. Valider la demande de réservation
    8. Vérifier qu'aucune réservation n'est enregistrée
    Close Browser

*** Keywords ***

2. Accéder à la section de réservation sans être connecté
    Accéder A La Page De Connexion
    Entrer Un Nom d'Utilisateur Vide    ${NOM UTILISATEUR VIDE}
    Entrer Un Mot De Passe Vide    ${MOT DE PASSE VIDE}
    Soumettre Le Formulaire De Connexion
    Fermer La Fenêtre De Connection

Accéder A La Page De Connexion
    Click Element    ${LIEN SE CONNECTER}
    Wait Until Element Is Visible    ${CHAMP NOM UTILISATEUR}

Entrer Un Nom d'Utilisateur Vide
    [Arguments]    ${nom_utilisateur_vide}
    Click Element     ${CHAMP NOM UTILISATEUR}
    Input Text    ${CHAMP NOM UTILISATEUR}    ${nom_utilisateur_vide}

Entrer Un Mot De Passe Vide 
    [Arguments]    ${mot_de_passe_vide}
    Click Element     ${CHAMP MOT DE PASSE}
    Input Text    ${CHAMP MOT DE PASSE}    ${mot_de_passe_vide}

Soumettre Le Formulaire De Connexion
   Click Button    ${BOUTON VALIDER}

Fermer La Fenêtre De Connection
    Click Element    ${ONGLET FERMER CONNEXION}

3. Saisir une date de début valide
    Accéder A La Page De Reservation
    Entrer La Date de Debut    ${DATE DEBUT}
    
Accéder A La Page De Reservation
    Click Element    ${LIEN LOGO}
    Reload Page
    Wait Until Element Is Visible    ${CHAMP DATE DEBUT}

Entrer La Date de Debut
    [Arguments]    ${date_debut}
    Click Element     ${CHAMP DATE DEBUT}
    Input Text    ${CHAMP DATE DEBUT}    ${date_debut}

4. Saisir une date de fin valide
    Entrer La Date de Fin    ${DATE FIN}

Entrer La Date de Fin
    [Arguments]    ${date_fin}
    Click Element     ${CHAMP DATE FIN}
    Input Text    ${CHAMP DATE FIN}    ${date_fin}

5. Saisir un nombre de voyageurs valide
    Entrer Le Nombre de Voyageurs    ${NOMBRE VOYAGEURS}
    Cliquer Sur Le Bouton De Validation

Entrer Le Nombre de Voyageurs
    [Arguments]    ${nombre_voyageurs}
    Click Element     ${CHAMP NOMBRE VOYAGEURS}
    Input Text    ${CHAMP NOMBRE VOYAGEURS}    ${nombre_voyageurs}
    Double Click Element    ${VOYAGEUR ADULTES}
    # Click Element    ${VOYAGEURS ENFANTS}
    # Click Element    ${ANIMAUX DOMESTIQUES}
    
Cliquer Sur Le Bouton De Validation
    Click Element    ${BOUTON VALIDER VOYAGEURS}
    Click Button    ${BOUTON CHERCHER}
    Wait Until Element Is Visible    ${CHOIX CHAMBRE}

6. Ajouter un message à l’attention de l’hôte
    Choix De La Chambre
    Contactez L'Hote
    Entrer Le Nom    ${NOM}
    Entrer L'Email    ${EMAIL}
    Entrer Le Telephone    ${TELEPHONE}
    Entrer Le Message    ${MESSAGE}
    Soumettre Le Formulaire De Message
    Fermer la fenêtre de message
    
Choix De La Chambre
    Wait Until Element Is Visible    ${CHOIX CHAMBRE}
    Click Element    ${CHOIX CHAMBRE}
    Wait Until Element Is Visible    ${CLIC DANS LE VIDE}

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

7. Valider la demande de réservation
    Cliquer Sur Le Bouton De Demande De Reservation

Cliquer Sur Le Bouton De Demande De Reservation
    Click Element    ${CLIC DANS LE VIDE}
    Click Button    ${BOUTON RESERVATION}
    Click Element    ${CLIC DANS LE VIDE}
    Wait Until Element Is Visible    ${MESSAGE D'ERREUR}

8. Vérifier qu'aucune réservation n'est enregistrée
    Verifier Que Le Lien De Connexion Est Visible

Verifier Que Le Lien De Connexion Est Visible
    Wait Until Element Is Not Visible    ${LIEN SE DECONNECTER}
    Element Should Be Visible    ${LIEN SE CONNECTER}