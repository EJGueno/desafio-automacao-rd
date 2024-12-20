require 'httparty'
require 'rspec'

class ViaCEP
  include HTTParty
  base_uri 'https://viacep.com.br/ws'

  def self.consultar(cep)
    get("/#{cep}/json/")
  end
end

RSpec.describe 'Dado que estou conectado na API com um CEP válido' do
  let(:cep_valido) { '83326532' }
  let(:response) { ViaCEP.consultar(cep_valido) }

  it 'Quando a api retorna um Status Code 200' do
    expect(response.code).to eq(200)
  end

  it 'E verifico o CEP' do
    expect(response.parsed_response['cep']).to eq('83326-532')
  end

  it 'E verifico o Logradouro' do
    expect(response.parsed_response['logradouro']).to eq('Estrada da Graciosa')
  end

  it 'E verifico o Complemento' do
    expect(response.parsed_response['complemento']).to eq('de 1092 a 2030 - lado par')
  end

  it 'E verifico o Bairro' do
    expect(response.parsed_response['bairro']).to eq('Jardim Cláudia')
  end

  it 'E verifico o Localidade' do
    expect(response.parsed_response['localidade']).to eq('Pinhais')
  end

  it 'E verifico o UF' do
    expect(response.parsed_response['uf']).to eq('PR')
  end

  it 'E verifico o Estado' do
    expect(response.parsed_response['estado']).to eq('Paraná')
  end

  it 'E verifico o Região' do
    expect(response.parsed_response['regiao']).to eq('Sul')
  end

  it 'E verifico o Código IBGE' do
    expect(response.parsed_response['ibge']).to eq('4119152')
  end

  it 'E verifico o DDD' do
    expect(response.parsed_response['ddd']).to eq('41')
  end

  it 'E verifico o Código SIAFI' do
    expect(response.parsed_response['siafi']).to eq('5453')
  end
end
