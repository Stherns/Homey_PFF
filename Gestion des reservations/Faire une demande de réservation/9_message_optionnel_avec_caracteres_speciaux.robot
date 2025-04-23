*** Settings ***
Library    SeleniumLibrary
Resource    commun_a.resource

*** Test Cases ***

Message optionnel avec caractères spéciaux
    1. Ouvrir le site web de réservation
    2. Se connecter avec un compte utilisateur valide
    3. Accéder à la section de réservation
    4. Saisir une date de début valide
    5. Saisir une date de fin valide
    6. Saisir un nombre de voyageurs valide
    7. Ajouter un message à l’attention de l’hôte contenant des caractères spéciaux interdits
    8. Valider la demande de réservation
    9. Vérifier que la réservation n'est pas enregistrée
    Close Browser

# Reinitialiser le Test

Reinitialiser et Supprimer la réservation valide en cours
    1. Ouvrir le site web de réservation
    2. Se connecter avec un compte hote valide
    3. Accéder à l'onglet "Réservation"
    4. Sélectionner une demande en statut "NOUVEAU"
    5. Supprimer la réservation valide en cours
    Close Browser

*** Keywords ***

7. Ajouter un message à l’attention de l’hôte contenant des caractères spéciaux interdits
    Choix De La Chambre
    Contactez L'Hote
    Entrer Le Nom    ${NOM}
    Entrer L'Email    ${EMAIL}
    Entrer Le Telephone    ${TELEPHONE}
    Entrer Le Message    ${MESSAGE CARACTERES SPECIAUX}
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
    [Arguments]    ${message caracteres speciaux}
    Click Element    ${CHAMP MESSAGE}
    Input Text    ${CHAMP MESSAGE}    ${message caracteres speciaux}

Soumettre Le Formulaire De Message
    Click Button    ${BOUTON VALIDER MESSAGE}

Fermer la fenêtre de message
    Click Element    ${ONGLET FERMER}

9. Vérifier que la réservation n'est pas enregistrée
    Accéder A La Section Des Reservations
    
Accéder A La Section Des Reservations
    Click Element    ${ICON UTILISATEUR}
    Wait Until Element Is Visible    ${ONGLET RESERVATIONS}
    Click Element    ${ONGLET RESERVATIONS}