*** Settings ***
Library           Browser


*** Variables ***
${URL}            https://opensource-demo.orangehrmlive.com/
${BROWSER}        chromium
${MSG_DELETE}     The selected record will be permanently deleted. Are you sure you want to continue?


*** Keywords ***
Abrir Navegador
    [Documentation]         Realiza a abertura do navegador
    New Browser             browser=${BROWSER}
    Set Browser Timeout     5s
    New Context             viewport={'width': 1920, 'height': 1080}
    New Page                ${URL}

Dado que a página de login está carregada
    [Documentation]             Verifica se a página de login está carregada
    Wait for Elements State     //div//input[@name='username']
    Wait for Elements State     //div//input[@name='password']
    Wait for Elements State     //button[@type='submit']

Quando eu insiro credenciais
    [Documentation]     Insere as credenciais de login
    [Arguments]         ${USERNAME}    ${PASSWORD}
    Type Text           //div//input[@name='username']    ${USERNAME}
    Type Text           //div//input[@name='password']    ${PASSWORD}

E clico no botão de login
    [Documentation]     Clica no botão de login
    Click               //button[@type='submit']

Então devo ver a página inicial do sistema
    [Documentation]             Verifica se a página inicial do sistema foi carregada
    Wait for Elements State     //p[@class='oxd-userdropdown-name']
    Wait for Elements State     //div[@class='oxd-topbar-header-title']

Então devo ver a mensagem de erro
    [Documentation]             Verifica se a mensagem de erro foi exibida
    Wait for Elements State     //p[contains(@class,'xd-alert-content-text')]

Abrir Admin
    [Documentation]             Abre a página de administração
    Click                       //span[text()="Admin"]

Dado que a página Admin está carregada
    [Documentation]             Verifica se a página de administração está carregada
    Wait for Elements State     //h6[text()='Admin']
    Wait for Elements State     //h6[text()='User Management']

Quando eu clico no botão de Adcionar Usuário
    [Documentation]             Clica no botão de adicionar usuário
    Click                       //button[text()=' Add ']
    Wait for elements state     //h6[text()='Add User']

E Seleciono
    [Documentation]             Seleciona valor do campo
    [Arguments]                 ${CAMPO}    ${VALOR}
    Click                       //label[text()='${CAMPO}']//..//..//div[@class='oxd-select-wrapper']
    Click                       //div[@class='orangehrm-card-container']//*[text()='${VALOR}']

E Seleciono Employee Name
    [Documentation]             Seleciona valor do campo
    [Arguments]                 ${VALOR}
    Type Text                   //label[text()='Employee Name']//..//..//div//input      ${VALOR}
    Wait for elements state     //span[text()='${VALOR}']
    Click                       //span[text()='${VALOR}']

E Preencho
    [Documentation]             Preenche valor do campo
    [Arguments]                 ${CAMPO}    ${VALOR}
    Type Text                   //label[text()='${CAMPO}']//..//..//div//input      ${VALOR}

E Clico em Salvar
    [Documentation]             Clica no botão de salvar
    Click                       //button[text()=' Save ']

Então devo ver a mensagem de sucesso
    [Documentation]             Verifica se a mensagem de sucesso foi exibida
    Wait for elements state     //p[text()='Success']
    Wait for elements state     //p[text()='Successfully Saved']

Quando eu realizo a busca
    [Documentation]             Realiza a busca pelo usuário
    [Arguments]                 ${CAMPO}    ${VALOR}
    Type Text                   //label[text()='${CAMPO}']//..//..//div//input      ${VALOR}

E clico e Pesquisar
    [Documentation]             Clica no botão de pesquisar
    Click                       //button[text()=' Search ']

Então devo ver o usuário cadastrado
    [Documentation]             Verifica se o usuário foi cadastrado
    [Arguments]                 ${USERNAME}
    Wait for elements state     //div[text()='${USERNAME}']

Dado que estou com o usuário filtrado
    [Documentation]             Filtra o usuário
    [Arguments]                 ${USERNAME}
    Wait for elements state     //div[text()='${USERNAME}']

Quando eu clico no botão de exclusão
    [Documentation]             Clica no botão de exclusão
    Click                       //button//i[@class='oxd-icon bi-trash']

E exibe a mensagem de confirmação
    [Documentation]             Exibe a mensagem de confirmação
    Wait for elements state     //p[text()='Are you Sure?']
    Wait for elements state     //p[text()='${MSG_DELETE}']

E clico no botão de confirmação
    [Documentation]             Clica no botão de confirmação
    Click                       //button[text()=' Yes, Delete ']

E exibe a mensagem de sucesso
    [Documentation]             Exibe a mensagem de sucesso
    Wait for elements state     //p[text()='Success']
    Wait for elements state     //p[text()='Successfully Deleted']

E realizo a busca novamente
    [Documentation]             Realiza a busca
    [Arguments]                 ${CAMPO}    ${VALOR}
    Type Text                   //label[text()='${CAMPO}']//..//..//div//input      ${VALOR}
    Click                       //button[text()=' Search ']

Então exibe a mensagem de sem resultados
    [Documentation]             Exibe a mensagem de erro
    Wait for elements state     //p[text()='Info']
    Wait for elements state     //p[text()='No Records Found']

Quando eu clico no botão de logout
    [Documentation]             Clica no botão de logout
    Click                       //span[@class="oxd-userdropdown-tab"]
    Click                       //a[text()='Logout']

Então devo ver a página de login
    [Documentation]             Verifica se a página de login foi carregada
    Wait for Elements State     //div//input[@name='username']
    Wait for Elements State     //div//input[@name='password']
    Wait for Elements State     //button[@type='submit']

Fechar Navegador
    [Documentation]             Realiza o fechamento do navegador
    Close Browser
