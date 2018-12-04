Feature: Servico
  As an usuario do site salao de beleza
  I want to adicionar, remover, ver e editar uma servico
  so that eu nao ter que fazer isso manualmente

  Scenario: novo servico
    Given Eu estou na pagina de servico
    And Eu clico em novo servico
    When Eu preencho o campo nome com "corte de cabelo medio" o campo preco com 30.00 e o campo descricao com "corte de cabelo de comprimento entre 15 e 30 centimetros"
    And Eu clico em salvar servico
    Then Eu vejo que o servico com nome "corte de cabelo medio" foi salvo

  Scenario: novo servico com preco vazio
    Given Eu estou na pagina de servico
    And Eu clico em novo servico
    When Eu preencho o campo nome com "corte de cabelo pequeno" o campo preco com "" e o campo descricao com "corte de cabelo de comprimento entre 15 e 30 centimetros"
    And Eu clico em salvar servico
    Then Eu vejo uma mensagem de erro de preco vazio

  Scenario: novo servico com preco zerado
    Given Eu estou na pagina de servico
    And Eu clico em novo servico
    When Eu preencho o campo nome com "corte de cabelo pequeno" o campo preco com "00.00" e o campo descricao com "corte de cabelo de comprimento entre 15 e 30 centimetros"
    And Eu clico em salvar servico
    Then Eu vejo uma mensagem de erro de preco zerado

  Scenario: novo servico com preco negativo
    Given Eu estou na pagina de servico
    And Eu clico em novo servico
    When Eu preencho o campo nome com "corte de cabelo pequeno" o campo preco com "-30.00" e o campo descricao com "corte de cabelo de comprimento entre 15 e 30 centimetros"
    And Eu clico em salvar servico
    Then Eu vejo uma mensagem de erro de preco negativo

  Scenario: novo servico com preco invalido
    Given Eu estou na pagina de servico
    And Eu clico em novo servico
    When Eu preencho o campo nome com "corte de cabelo pequeno" o campo preco com "aa.bb" e o campo descricao com "corte de cabelo de comprimento entre 15 e 30 centimetros"
    And Eu clico em salvar servico
    Then Eu vejo uma mensagem de erro de preco invalido

  Scenario: novo servico com nome vazio
    Given Eu estou na pagina de servico
    And Eu clico em novo servico
    When Eu preencho o campo nome com "" o campo preco com "40.00" e o campo descricao com "corte de cabelo de comprimento entre 15 e 30 centimetros"
    And Eu clico em salvar servico
    Then Eu vejo uma mensagem de erro campos nome vazio

  Scenario: novo servico com nome insuficiente
    Given Eu estou na pagina de servico
    And Eu clico em novo servico
    When Eu preencho o campo nome com "corte" o campo preco com "30.00" e o campo descricao com "corte de cabelo de comprimento entre 15 e 30 centimetros"
    And Eu clico em salvar servico
    Then Eu vejo uma mensagem de erro de nome insuficiente

  Scenario: atualizar preco de servico existente
    Given Eu estou na pagina do servico com nome "corte de cabelo medio"
    And Eu vejo o preco "30.00" do servico
    When Eu clico para atualizar o preco do servico com nome "corte de cabelo medio"
    And Eu modifico o preco do servico para "35.00"
    And Eu clico para atualizar servico
    Then Eu vejo que o preco "35.00" do servico "corte de cabelo medio" foi atualizado

  Scenario: atualizar descricao de servico existente
    Given Eu estou na pagina do servico com nome "corte de cabelo medio"
    And Eu vejo a descricao "corte de cabelo de comprimento entre 15 e 30 centimetros” do servico
    When Eu clico para atualizar a descricao do servico com nome "corte de cabelo medio"
    And Eu modifico a descricao do servico para "corte de cabelo de comprimento entre 10 e 20 centimetros"
    And Eu clico para atualizar servico
    Then Eu vejo que a descricao "corte de cabelo de comprimento entre 10 e 20 centimetros" do servico "corte de cabelo medio" foi atualizado

  Scenario: atualizar servico com descricao insuficiente
    Given Eu estou na pagina do servico com nome "corte de cabelo medio"
    And Eu vejo a descricao "corte de cabelo de comprimento entre 15 e 30 centimetros" do servico
    When Eu clico para atualizar a descricao do servico com nome "corte de cabelo medio"
    And Eu modifico a descricao do servico para "corte"
    And Eu clico para atualizar servico
    Then Eu vejo uma mensagem de erro de descricao insuficiente

  Scenario: atualizar servico com preco vazio
    Given Eu estou na pagina do servico com nome "corte de cabelo medio"
    And Eu vejo o preco "30.00" do servico
    When Eu clico para atualizar o preco do servico com nome "corte de cabelo medio"
    And Eu modifico o preco do servico para ""
    And Eu clico para atualizar servico
    Then Eu vejo uma mensagem de erro de preco vazio

  Scenario: atualizar servico com preco zerado
    Given Eu estou na pagina do servico com nome "corte de cabelo medio"
    And Eu vejo o preco "30.00" do servico
    When Eu clico para atualizar o preco do servico com nome "corte de cabelo medio"
    And Eu modifico o preco do servico para "00.00"
    And Eu clico para atualizar servico
    Then Eu vejo uma mensagem de erro de preco zerado

  Scenario: atualizar servico com preco negativo
    Given Eu estou na pagina do servico com nome "corte de cabelo medio"
    And Eu vejo o preco "30.00" do servico
    When Eu clico para atualizar o preco do servico com nome "corte de cabelo medio"
    And Eu modifico o preco do servico para "-35.90"
    And Eu clico para atualizar servico
    Then Eu vejo uma mensagem de erro de preco negativo

  Scenario: atualizar servico com preco invalido
    Given Eu estou na pagina do servico com nome "corte de cabelo medio"
    And Eu vejo o preco "30.00" do servico
    When Eu clico para atualizar o preco do servico com nome "corte de cabelo medio"
    And Eu modifico o preco do servico para "as.ii"
    And Eu clico para atualizar servico
    Then Eu vejo uma mensagem de erro de preco invalido

  Scenario: remover servico
    Given Eu estou na pagina do servico com nome "corte de cabelo medio"
    When Eu clico para remover o servico com nome "corte de cabelo medio"
    Then Eu vejo que o do servico foi removido
