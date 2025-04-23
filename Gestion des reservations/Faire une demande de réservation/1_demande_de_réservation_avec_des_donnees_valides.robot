*** Settings ***
Library    SeleniumLibrary
Resource    commun_a.resource

*** Test Cases ***

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

# Reinitialiser le Test

Reinitialiser et Supprimer la réservation valide en cours
    1. Ouvrir le site web de réservation
    2. Se connecter avec un compte hote valide
    3. Accéder à l'onglet "Réservation"
    4. Sélectionner une demande en statut "NOUVEAU"
    5. Supprimer la réservation valide en cours
    Close Browser