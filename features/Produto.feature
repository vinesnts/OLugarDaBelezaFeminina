Feature: Produto
  As an usuario do site salao de beleza
  I want to adicionar, remover, ver e editar uma produto
  so that eu nao ter que fazer isso manualmente

  Scenario: novo produto
    Given Eu estou na pagina de produto
    And Eu clico no botao novo produto
    When Eu preencho o campo nome com "shampoo" marca com "Palmolive" preco com 18.99 quantidade com 4 e descricao "Fortalece da raiz as pontas"
    And Eu clico em salvar produto
    Then Eu vejo que o produto com nome "shampoo" foi salvo

  Scenario: novo produto com preco vazio
    Given Eu estou na pagina de produto
    And Eu clico no botao novo produto
    When Eu preencho o campo nome com "shampoo" marca com "Palmolive" preco com "" quantidade com 4 e descricao "Fortalece da raiz as pontas"
    And Eu clico em salvar produto
    Then Eu vejo uma mensagem de erro de preco vazio

  Scenario: novo produto com preco negativo
    Given Eu estou na pagina de produto
    And Eu clico no botao novo produto
    When Eu preencho o campo nome com "shampoo" marca com "Palmolive" preco com -18.99 e quantidade com 4 descricao "Fortalece da raiz as pontas"
    And Eu clico em salvar produto
    Then Eu vejo uma mensagem de erro de preco negativo

  Scenario: novo produto com preco zerado
    Given Eu estou na pagina de produto
    And Eu clico no botao novo produto
    When Eu preencho o campo nome com "shampoo" marca com "Palmolive" preco com 00.00 e quantidade com 4 e descricao "Fortalece da raiz as pontas"
    And Eu clico em salvar produto
    Then Eu vejo uma mensagem de erro de preco zerado

  Scenario: novo produto com preco invalido
    Given Eu estou na pagina de produto
    And Eu clico no botao novo produto
    When Eu preencho o campo nome com "shampoo" marca com "Palmolive" preco com "aa.bb" quantidade com 4 e descricao "Fortalece da raiz as pontas"
    And Eu clico em salvar produto
    Then Eu vejo uma mensagem de erro de preco invalido

  Scenario: novo produto com quantidade vazia
    Given Eu estou na pagina de produto
    And Eu clico no botao novo produto
    When Eu preencho o campo nome com “shampoo” marca com "Palmolive" preco com 18.99 e quantidade com "" e descricao "Fortalece da raiz as pontas"
    And Eu clico em salvar produto
    Then Eu vejo uma mensagem de erro de quantidade vazia

  Scenario: novo produto com quantidade negativa
    Given Eu estou na pagina de produto
    And Eu clico no botao novo produto
    When Eu preencho o campo nome com "shampoo" marca com "Palmolive" preco com 18.99 e quantidade com -4 e descricao "Fortalece da raiz as pontas"
    And Eu clico em salvar produto
    Then Eu vejo uma mensagem de erro de quantidade negativa

  Scenario: novo produto com quantidade invalida
    Given Eu estou na pagina de produto
    And Eu clico no botao novo produto
    When Eu preencho o campo nome com "shampoo" marca com "Palmolive" preco com 18.99 e quantidade com 0 e descricao "Fortalece da raiz as pontas"
    And Eu clico em salvar produto
    Then Eu vejo uma mensagem de erro de quantidade invalida

  Scenario: atualizar preco de produto existente
    Given Eu estou na pagina do produto com nome “shampoo”
    And Eu vejo o preco 20.0" do produto
    When Eu clico para atualizar o preco do produto
    And Eu modifico o preco do produto para 20.99
    And Eu clico para atualizar produto
    Then Eu vejo que o preco 20.99 do produto foi atualizado

  Scenario: atualizar quantidade de produto existente
    Given Eu estou na pagina do produto com nome “shampoo”
    And Eu vejo a quantidade 10 do produto
    When Eu clico para atualizar a quantidade do produto
    And Eu modifico a quantidade do produto para 8
    And Eu clico para atualizar produto
    Then Eu vejo que a quantidade 8 do produto foi atualizado

  Scenario: atualizar descricao de produto existente
    Given Eu estou na pagina do produto com nome "shampoo"
    And Eu vejo a descricao "Fortalece da raiz as pontas" do produto
    When Eu clico para atualizar a descricao do produto "shampoo"
    And Eu modifico a descricao para "Cabelos mais limpos e saudáveis"
    And Eu clico para atualizar produto
    Then Eu vejo que a descricao do produto "shampoo" foi atualizada

  Scenario: atualizar produto com quantidade real
    Given Eu estou na pagina do produto com nome "shampoo"
    And Eu vejo a quantidade 10 do produto
    When Eu clico para atualizar a quantidade do produto
    And Eu modifico a quantidade do produto para 6.5
    And Eu clico para atualizar produto
    Then Eu vejo uma mensagem de erro de quantidade real

  Scenario: atualizar produto com quantidade negativa
    Given Eu estou na pagina do produto com nome "shampoo"
    And Eu vejo a quantidade 10 do produto
    When Eu clico para atualizar a quantidade do produto
    And Eu modifico a quantidade do produto para -6
    And Eu clico para atualizar produto
    Then Eu vejo uma mensagem de erro de quantidade negativa

  Scenario: atualizar produto com quantidade invalida
    Given Eu estou na pagina do produto com nome "shampoo"
    And Eu vejo a quantidade 10 do produto
    When Eu clico para atualizar a quantidade do produto
    And Eu modifico a quantidade do produto para "a"
    And Eu clico para atualizar produto
    Then Eu vejo uma mensagem de erro de quantidade invalida

  Scenario: remover produto
    Given Eu estou na pagina de produto
    And Eu vejo o produto com o nome "shampoo"
    When Eu clico em excluir produto
    Then Eu vejo que o produto com nome "shampoo" foi excluido
