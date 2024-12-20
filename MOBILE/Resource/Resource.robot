*** Settings ***
Library         AppiumLibrary


*** Variables ***
${URL}                  http://127.0.0.1:4723/wd/hub
${APK}                  C:\\Users\\edgar\\www\\desafio-rd-main\\MOBILE\\apk\\app-debug.apk


*** Keywords ***
Abrir App
    [Documentation]     Realiza a abertura do Aplicativo
    Open Application    ${URL}
    ...                 platformName=Android
    ...                 platformVersion=13
    ...                 deviceName=Android Emulador
    ...                 automationName=UiAutomator2
    ...                 app=${APK}

Dado que estou na tela inicial do aplicativo
    [Documentation]     Realiza validação se está na tela inicial do Aplicativo
    Wait Until Element Is Visible       id=com.example.vamsi.login:id/etLogGmail

Quando informo o Email
    [Documentation]     Realiza o preenhimento do Email
    [Arguments]         ${EMAIL}
    Wait Until Element Is Visible       id=com.example.vamsi.login:id/etLogGmail
    Input Text                          id=com.example.vamsi.login:id/etLogGmail        ${EMAIL}

E Informo a Senha
    [Documentation]     Realiza o preenhimento da Senha
    [Arguments]         ${SENHA}
    Wait Until Element Is Visible       id=com.example.vamsi.login:id/etLoginPassword
    Input Text                          id=com.example.vamsi.login:id/etLoginPassword   ${SENHA}

E Clico em Login
    [Documentation]     Realiza o click do botão Login
    Wait Until Element Is Visible       id=com.example.vamsi.login:id/btnLogin
    Click Element                       id=com.example.vamsi.login:id/btnLogin

Então exibe uma mensagem de login invalido
    [Documentation]     Realiza a validação da mensagem de Login Invalido
    Wait Until Page Contains Element    xpath=//android.widget.Toast[@text="Login error"]

Quando eu clico em New User? Register
    [Documentation]     Realiza o click no botão New User? Register
    Wait Until Element Is Visible       id=com.example.vamsi.login:id/tvRegister
    Click Element                       id=com.example.vamsi.login:id/tvRegister
    Wait Until Element Is Visible       id=com.example.vamsi.login:id/etRegName

E Preencho o Usuário
    [Documentation]     Realiza o preenhimento do Usuário
    [Arguments]         ${USUARIO}
    Wait Until Element Is Visible       id=com.example.vamsi.login:id/etRegName
    Input Text                          id=com.example.vamsi.login:id/etRegName         ${USUARIO}

E Preencho a Senha
    [Documentation]     Realiza o preenhimento da Senha
    [Arguments]         ${SENHA}
    Wait Until Element Is Visible       id=com.example.vamsi.login:id/etRegPassword
    Input Text                          id=com.example.vamsi.login:id/etRegPassword     ${SENHA}

E Preencho o Telefone
    [Documentation]     Realiza o preenhimento do Telefone
    [Arguments]         ${TELEFONE}
    Wait Until Element Is Visible       id=com.example.vamsi.login:id/etRegPhone
    Input Text                          id=com.example.vamsi.login:id/etRegPhone        ${TELEFONE}

E Preencho o Email
    [Documentation]     Realiza o preenhimento do Email
    [Arguments]         ${EMAIL}
    Wait Until Element Is Visible       id=com.example.vamsi.login:id/etRegGmail
    Input Text                          id=com.example.vamsi.login:id/etRegGmail        ${EMAIL}

E Clico em Register
    [Documentation]     Realiza o click no botão Register
    Wait Until Element Is Visible       id=com.example.vamsi.login:id/btnRegLogin
    Click Element                       id=com.example.vamsi.login:id/btnRegLogin

Então o usuário é Cadastrado
    [Documentation]     Realiza a validação da mensagem de Usuário Cadastrado
    Wait Until Page Contains Element    xpath=//android.widget.Toast[@text="Registration Successful"]
    Click Element                       id=com.example.vamsi.login:id/btnGotoLogin

Então exibe mensagem de Login com sucesso
    [Documentation]     Realiza a validação da mensagem de Login com Sucesso
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="You are now logged in"]

Fechar App
    [Documentation]     Realiza o fechamento do Aplicativo
    Close Application
