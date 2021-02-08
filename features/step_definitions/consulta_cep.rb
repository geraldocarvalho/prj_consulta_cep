# frozen_string_literal: true

Dado('ter uma massa configurada para o cenário {string} e {string}') do |tipo, zona|
  @cep = tipo.eql?('positivo') ? API_DATA_LOAD['ceps_sp'][zona]['cep'] : rand(100_000)
end

Quando('chamar o endpoint de consulta de cep') do
  @response_api = Viacep.get("/#{@cep}/json/")
end

Entao('validar o retorno do endpoint para o cenário {string} e {string}') do |tipo, zona|
  if tipo.eql?('positivo')
    expect(@response_api.code).to eql(200)
    expect(@response_api['cep']).to eql(@cep)
    expect(@response_api['logradouro']).to eql(API_DATA_LOAD['ceps_sp'][zona]['logradouro'])
    expect(@response_api['complemento']).to eql(API_DATA_LOAD['ceps_sp'][zona]['complemento'])
    expect(@response_api['bairro']).to eql(API_DATA_LOAD['ceps_sp'][zona]['bairro'])
    expect(@response_api['localidade']).to eql(API_DATA_LOAD['ceps_sp'][zona]['localidade'])
    expect(@response_api['uf']).to eql(API_DATA_LOAD['ceps_sp'][zona]['uf'])
    expect(@response_api['ibge']).to eql(API_DATA_LOAD['ceps_sp'][zona]['ibge'])
    expect(@response_api['gia']).to eql(API_DATA_LOAD['ceps_sp'][zona]['gia'])
    expect(@response_api['ddd']).to eql(API_DATA_LOAD['ceps_sp'][zona]['ddd'])
    expect(@response_api['siafi']).to eql(API_DATA_LOAD['ceps_sp'][zona]['siafi'])
    log("O código do IBGE é: #{@response_api['ibge']}")
  else
    expect(@response_api.code).to eql(400)
  end
end
