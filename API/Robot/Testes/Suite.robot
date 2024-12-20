*** Settings ***
Resource                ../Resources/Resource.robot


*** Test Cases ***
CT01 - Valida Dados do CEP
    [Documentation]     Valida os dados do CEP
    Dado que eu estou conectado com a API
    Quando pesquiso pelo CEP        83326532
    E verifico      cep             83326-532
    E verifico      logradouro      Estrada da Graciosa
    E verifico      complemento     de 1092 a 2030 - lado par
    E verifico      bairro          Jardim Cláudia
    E verifico      localidade      Pinhais
    E verifico      uf              PR
    E verifico      estado          Paraná
    E verifico      regiao          Sul
    E verifico      ibge            4119152
    E verifico      ddd             41
    E verifico      siafi           5453


