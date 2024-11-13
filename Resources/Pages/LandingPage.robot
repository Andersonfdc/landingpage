*** Settings ***

Library    Browser
Library    FakerLibrary 
Library    gera_cpf.py

*** Variables ***

## BROWSER
${BASE_URL}         https://queroser.aec.com.br
${BROWSER}          chromium
${IS_HEADLESS}      True

## CADASTRO
${input_nome}                               xpath=//input[@id='inputNome']
${input_cpf}                                xpath=//input[@id='inputCPF']
${input_email}                              xpath=//input[@id='inputEmail']
${email}                                    testeaecand2@gmail.com
${input_telefone}                           xpath=//input[@id='inputTelefone']
${select_cidade}                            xpath=//select[@id='selectCidade']
${check_privacidade}                        xpath=//input[@id='checkPrecadastro']
${check_aceite_privacidade}                 xpath=//input[@id='checkPoliticaPrivacidade']
${botao_cadastrar}                          xpath=//input[@id='btn-submit']

${POPUP_SELECTOR}                           xpath=//div[@class="modal-content"]

*** Keywords ***

Start Browser
    New Browser    browser=${BROWSER}    headless=${IS_HEADLESS}      timeout=5s
    New Page       ${BASE_URL}

Quando o cadastro for preenchido

    ${nome}       FakerLibrary.Name
    FIll Text    ${input_nome}    ${nome}

    ${cpf}        gerar_cpf
    FIll Text    ${input_cpf}    ${cpf}

    FIll Text    ${input_email}    ${email}

    ${telefone}    FakerLibrary.Phone Number
    FIll Text    ${input_telefone}    ${telefone}


    Select Options By    ${select_cidade}    index    2    


    Check Checkbox    ${check_privacidade}
    Check Checkbox    ${check_aceite_privacidade}
    Sleep    1s

Entao o usuario sera cadastrado ao clicar em cadastrar
    
    Wait For Elements State    ${botao_cadastrar}    visible    timeout=20s
    Wait For Elements State    ${botao_cadastrar}    enabled    timeout=20s
    Sleep    1s  # Adicionando uma pequena espera para garantir que o botão esteja pronto
    Click    ${botao_cadastrar}
    Sleep    5s

Finish Browser
    Take Screenshot    fullPage=false