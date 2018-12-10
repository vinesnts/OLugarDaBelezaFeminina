Feature: Promocao
  As an usuario do site salao de beleza
  I want to adicionar, remover, ver e editar uma promocao
  so that eu nao ter que fazer isso manualmente

  Scenario: nova promocao
    Given Eu estou na pagina de promocao
    And Eu clico no botao nova promocao
    When Eu preencho o campo nome com "Promocao nova" seleciono o servico "escova" e preencho o campo preco com 30.00
    And Eu clico em salvar promocao
    Then Eu vejo que a promocao com nome "Promocao nova" foi salva

  Scenario: nova promocao
      Given Eu estou na pagina de promocao
      And Eu clico no botao nova promocao
      When Eu preencho o campo nome com "Promocao Corte e +" seleciono o servico "corte cabelo pequeno" seleciono o servico "esmaltacao" e preencho o campo preco com 35.00
      And Eu clico em salvar promocao
      Then Eu vejo que a promocao com nome "Promocao nova" foi salva

  Scenario: nova promocao invalida
      Given Eu estou na pagina de promocao
      And Eu clico no botao nova promocao
      When Eu preencho o campo nome com "Promocao Corte e +" seleciono o servico "corte cabelo pequeno" seleciono o servico "esmaltacao" e preencho o campo preco com ""
      And Eu clico em salvar promocao
      Then Eu vejo uma mensagem de erro de preco vazio

  Scenario: nova promocao invalida
      Given Eu estou na pagina de promocao
      And Eu clico no botao nova promocao
      When Eu preencho o campo nome com "Promocao Corte e +" seleciono o servico "corte cabelo pequeno" seleciono o servico "esmaltacao" e preencho o campo preco com "0.00"
      And Eu clico em salvar promocao
      Then Eu vejo uma mensagem de erro de preco invalido

  Scenario: atualizar preco de promocao existente
      Given Eu estou na pagina da promocao com nome “Promocao relampago”
      And Eu vejo o preco 20.0 da promocao
      When Eu clico para atualizar o preco do promocao
      And Eu modifico o preco da promocao para 18.00
      And Eu clico para atualizar promocao
      Then Eu vejo que o preco 18.00 da promocao foi atualizado


  Scenario: atualizar servico de promocao existente
      Given Eu estou na pagina da promocao com nome “Promocao da Semana”
      And Eu vejo o servico "esmaltacao"  da promocao
      When Eu clico para atualizar o servico do promocao
      And Eu desmarco o servico "esmaltacao" da promocao e seleciono o servico "design de sobrancelha"
      And Eu clico para atualizar promocao
      Then Eu vejo que o servico "design de sobrancelha" da promocao foi atualizado


  Scenario: atualizar preco invalido de promocao
      Given Eu estou na pagina da promocao com nome “Promocao da Semana”
      And Eu vejo o preco 45.00 da promocao
      When Eu clico para atualizar o preco do promocao
      And Eu modifico o preco para "aa.kk"
      And Eu clico para atualizar promocao
     Then Eu vejo uma mensagem de erro que a o preco da promocao e invalido


  Scenario: remover promocao
      Given Eu estou na pagina de promocao
      And Eu vejo a promocao com nome "nova promocao"
      When Eu clico em excluir promocao
      Then Eu vejo que a promocao com nome "nova promocao" foi excluida
