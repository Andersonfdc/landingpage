*** Settings ***

Resource    ../Resources/Main.robot

Test Setup          Start Browser
Test Teardown       Finish Browser

*** Test Cases ***

CT001 - Cadastro de Usuario
    Quando o cadastro for preenchido
    Entao o usuario sera cadastrado ao clicar em cadastrar