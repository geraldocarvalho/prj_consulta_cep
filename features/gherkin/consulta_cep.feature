#language: pt

@consulta_cep
Funcionalidade: Validar a api de consulta de cep
  Para que eu possa consultar os dados de um endereço
  Sendo um usuário do viacep
  Posso receber os dados do endereço a partir do cep informado

  Esquema do Cenário: Validar o endpoint consultar_cep.get
    Dado ter uma massa configurada para o cenário <tipo> e <zona>
    Quando chamar o endpoint de consulta de cep
    Entao validar o retorno do endpoint para o cenário <tipo> e <zona>

    Exemplos:
      | tipo       | zona         |
      | "positivo" | "zona_sul"   |
      | "positivo" | "zona_norte" |
      | "positivo" | "zona_leste" |
      | "positivo" | "zona_oeste" |
      | "positivo" | "centro"     |
      | "negativo" | ""           |
