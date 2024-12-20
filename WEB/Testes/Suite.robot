*** Settings ***
Resource                ../Resources/Resource.robot

Suite Setup             Abrir Navegador

Suite Teardown          Fechar Navegador


*** Test Cases ***
CT01 - Realiza Login
    [Documentation]    Realiza login com usuário e senha válidos
    Dado que a página de login está carregada
    Quando eu insiro credenciais    Admin    admin123
    E clico no botão de login
    Então devo ver a página inicial do sistema

CT02 - Realiza Cadastro de Novo Usuário
    [Documentation]    Realiza cadastro de novo usuário
    [Setup]            Abrir Admin
    Dado que a página Admin está carregada
    Quando eu clico no botão de Adcionar Usuário
    E Seleciono     User Role           Admin
    E Seleciono Employee Name           mandar akhil user
    E Seleciono     Status              Enabled
    E Preencho      Username            UserEdgar
    E Preencho      Password            teste123
    E Preencho      Confirm Password    teste123
    E Clico em Salvar
    Então devo ver a mensagem de sucesso

CT03 - Realiza a Busca de Usuário Cadastrado
    [Documentation]     Realiza busca de usuário cadastrado
    Dado que a página Admin está carregada
    Quando eu realizo a busca   Username    UserEdgar
    E clico e Pesquisar
    Então devo ver o usuário cadastrado     UserEdgar

CT04 - Realiza Exclusão de Usuário
    [Documentation]     Realiza exclusão de usuário
    Dado que estou com o usuário filtrado   UserEdgar
    Quando eu clico no botão de exclusão
    E exibe a mensagem de confirmação
    E clico no botão de confirmação
    E exibe a mensagem de sucesso
    E realizo a busca novamente   Username    UserEdgar
    Então exibe a mensagem de sem resultados

CT05 - Realiza Logout
    [Documentation]    Realiza logout do sistema
    Dado que a página Admin está carregada
    Quando eu clico no botão de logout
    Então devo ver a página de login
