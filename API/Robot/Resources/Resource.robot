*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Keywords ***
Dado que eu estou conectado com a API
    [Documentation]     Realiza a conexão com a API
    Create Session      via-cep         https://viacep.com.br

Quando pesquiso pelo CEP
    [Documentation]     Realiza a busca pelo CEP
    [Arguments]         ${CEP}
    Create Session      via-cep     https://viacep.com.br
    ${REQUEST}=         GET On Session      via-cep       /ws/${CEP}/json/
    Status Should Be    200     ${REQUEST}
    Log                 ${REQUEST.json()}
    VAR                 ${REQUEST}    ${REQUEST}     scope=suite

E verifico
    [Documentation]     Realiza validação do dado da API
    [Arguments]         ${CAMPO}    ${VALOR}
    Log                 ${REQUEST.json()}
    ${QUERY}=           Get From Dictionary     ${REQUEST.json()}   ${CAMPO}
    Log                 ${QUERY}
    Should Contain      ${QUERY}       ${VALOR}
