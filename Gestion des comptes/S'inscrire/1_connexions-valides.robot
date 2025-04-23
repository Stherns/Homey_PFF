*** Settings ***
Library    SeleniumLibrary
Resource    commun.resource
# Suite Setup    MOTCLE1    (Executer avant le premier cas de test la suite de test)
# Suite Teardown    MOTCLE2    (Executer apres le dernier cas de test de la suite de test)

*** Test Cases ***

Le Tableau De Bord Doit Etre Visible Après Une Connexion Réussie
    [Setup]  Effectuer Une Connection Réussie
    Vérifiez Que Le Tableau De Bord Est Visible
    [Teardown]  Effectuer Une Déconnexion Réussie

Le Lien De Connexion Devrait Etre Visible Après Une Déconnexion Réussie.
    [Setup]  Effectuer Une Connection Réussie
    Vérifiez Que Le Tableau De Bord Est Visible
    Effectuer Une Déconnexion Réussie
    Vérifier Que Le Lien De Connexion Est Visible

*** Keywords ***

Effectuer Une Connection Réussie
    Ouvrir Le Navigateur Et Accéder A La Page d'Accueil
    Accéder A La Page De Connexion
    Entrer Le Nom d'Utilisateur    ${UTILISATEUR VALIDE}
    Entrer Le Mot De Passe    ${MOT DE PASSE VALIDE}
    Soumettre Le Formulaire De Connexion

Vérifiez Que Le Tableau De Bord Est Visible
    Wait Until Element Is Not Visible   ${CHAMP NOM UTILISATEUR}
    Title Should Be    ${TITRE TABLEAU DE BORD}

Effectuer Une Déconnexion Réussie
    Click Element    ${LIEN SE DECONNECTER}
    # Click Link    ${LIEN SE DECONNECTER}

Vérifier Que Le Lien De Connexion Est Visible
    Wait Until Element Is Not Visible    ${LIEN SE DECONNECTER}
    Element Should Be Visible    ${LIEN SE CONNECTER}
    # Title Should Be    ${TITRE ACCEUIL}

# Effectuer Une Déconnexion Réussie
#     Click Element    ${LIEN SE DECONNECTER}
#     # Click Link    ${LIEN SE DECONNECTER}
#     Wait Until Element Is Not Visible    ${LIEN SE DECONNECTER}

# Vérifier Que Le Lien De Connexion Est Visible
#     Title Should Be    ${TITRE ACCEUIL}
#     # Element Should Be Visible    ${LIEN SE CONNECTER}