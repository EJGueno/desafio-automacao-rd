*** Settings ***
Resource            ../Resource/Resource.robot

Suite Setup         Abrir App

Suite Teardown      Fechar App


*** Test Cases ***
CT01 - Realiza Login com Cadastro Inesistente
    [Documentation]     Validação de Cadastro Inesistente
    Dado que estou na tela inicial do aplicativo
    Quando informo o Email      logininvalido@gmail.com
    E Informo a Senha           SenhaInvalida
    E Clico em Login
    Então exibe uma mensagem de login invalido

CT02 - Realiza Cadastro de Novo Usuário
    [Documentation]     Validação de Criação de Novo Usuário
    Dado que estou na tela inicial do aplicativo
    Quando eu clico em New User? Register
    E Preencho o Usuário        Usuario Teste Edgar
    E Preencho o Telefone       41999999999
    E Preencho o Email          usuario.teste.edgar@gmail.com
    E Preencho a Senha          User123
    E Clico em Register
    Então o usuário é Cadastrado

CT03 - Realiza Login com Senha invalida
    [Documentation]     Validação de Cadastro com Senha Invalida
    Dado que estou na tela inicial do aplicativo
    Quando informo o Email      usuario.teste.edgar@gmail.com
    E Informo a Senha           SenhaInvalida
    E Clico em Login
    Então exibe uma mensagem de login invalido

CT04 - Realiza Login Valido
    [Documentation]     Validação do Novo Cadastro
    Dado que estou na tela inicial do aplicativo
    Quando informo o Email      usuario.teste.edgar@gmail.com
    E informo a Senha           User123
    E clico em Login
    Então exibe mensagem de Login com sucesso
