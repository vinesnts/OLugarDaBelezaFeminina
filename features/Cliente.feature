Feature: Cliente
As an usuario do site salao de beleza
I want to adicionar, remover, ver e editar um cliente
so that eu nao ter que fazer isso manualmente

Scenario: novo cliente
	Given Eu abro a pagina inicial do site
	And Eu clico no botao novo cliente
	When Eu preencho o campo nome com “Raquel” o telefone com “(87)999999999” a senha com “123456” e o campo repita senha com “123456”  
	And Eu clico em cadastrar cliente
	Then Eu vejo que o cliente com nome “Raquel” foi salvo 
  
 
Scenario: novo cliente ja existente com campo telefone existente
	Given Eu estou na pagina inicial do site
	And Eu clico no botao novo cliente
	When Eu preencho o campo nome com “Damiana” o telefone com “ (87)966666666” a senha com “123456” e o campo repita senha com “123456” 
	And Eu clico em cadastrar cliente
	Then Eu vejo uma mensagem de erro telefone existente

	
Scenario: novo cliente com o campo repita senha invalido
	Given Eu abro a pagina inicial do site
	And Eu clico no botao novo cliente
	When Eu preencho o campo nome com “Raquel” o telefone com “(87)999999999” a senha com “123456” e o campo repita senha com “654321”  
	And Eu clico em cadastrar cliente
	Then Eu vejo uma mensagem de erro senhas diferem

	
Scenario: novo cliente invalido devido ao campo telefone
	Given Eu estou na pagina inicial do site
	And Eu clico no botao novo cliente
	When Eu preencho o campo nome com “Adilson” o telefone com “ (aa)aaddccddd” a senha com “123456” e o campo repita a senha com “123456”
	And Eu clico em cadastrar cliente
	Then Eu vejo uma mensagem de erro de telefone invalido

Scenario: novo cliente invalido devido campo senha
	Given Eu estou na pagina inicial do site
	And Eu clico no botao novo cliente
	When Eu preencho o campo nome com “Adilson” o telefone com “ (87)966666666” a senha com “123” e o campo repita a senha com “123”
	And Eu clico em cadastrar cliente
	Then Eu vejo uma mensagem de erro de tamanho de senha insuficiente

Scenario: atualizar nome de um cliente existente
	Given Estou na pagina do cliente “Raquel”
	And Eu vejo o nome “Raquel” do cliente
	When Eu clico para atualizar o cliente com nome “Raquel”
	And Eu modifico o nome do cliente para “Raquel Vieira”
	And Eu clico em atualizar cliente
	Then Eu vejo que o cliente com nome “Raquel Vieira” foi atualizado


Scenario: atualizar senha valida de cliente existente
	Given Eu estou na pagina de cliente
	And Eu clico em atualizar senha
	When Eu preencho o campo senha antiga com “123456” o campo nova senha “654321” e o campo repita nova senha “654321”
	And Eu clico em atualizar senha
	Then Eu vejo uma mensagem de sucesso da nova senha


Scenario: atualizar senha invalida de cliente
	Given Eu estou na pagina do cliente “Fulano”
	And Eu clico em atualizar senha
	When Eu preencho o campo senha antiga “12345” o campo nova senha “123456” e o campo repita nova senha “654321”
    And Eu clico em atualizar senha
    Then Eu vejo uma mensagem de erro de novas senhas diferem
	
Scenario: atualizar senha invalida de cliente
	Given Eu estou na pagina do cliente “Fulano”
	And Eu clico em atualizar senha
	When Eu preencho o campo senha antiga com “12345” o campo nova senha “123456” e o campo repita nova senha “654321”
	And Eu clico em atualizar senha
	Then Eu vejo uma mensagem de erro de novas senhas diferem
	
	
Scenario: atualizar telefone de um cliente existente
	Given Eu estou na pagina do cliente com nome “Fulano”
	And Eu vejo o telefone “(87)966666666” do cliente com nome “Fulano”
	When Eu clico para atualizar o telefone “(87)966666666”
	And Eu modifico o telefone para “(87)988888888”
	And Eu clico em atualizar telefone 
	Then Eu vejo que o telefone “(87)988888888” foi atualizado 


Scenario: atualizar telefone invalido de um cliente existente
	Given Eu estou na pagina de cliente
	And Eu vejo o telefone “(87)966666666” do cliente
	When Eu clico para atualizar o telefone “(87)966666666”
	And Eu modifico o telefone para “(87)988888888”
	And Eu clico em atualizar telefone 
	Then Eu vejo uma mensagem de erro de novo telefone ja existente
	

Scenario: atualizar telefone invalido de um cliente existente
	Given Eu estou na pagina de cliente
	And Eu vejo o telefone “(87)966666666” do cliente
	When Eu clico para atualizar o telefone “(87)966666666”
	And Eu modifico o telefone para “”
	And Eu clico em atualizar telefone 
	Then Eu vejo uma mensagem de erro de novo telefone vazio
	
	
Scenario: atualizar telefone invalido de um cliente existente
	Given Eu estou na pagina de cliente
	And Eu vejo o telefone “(87)966666666” do cliente
	When Eu clico para atualizar o telefone “(87)966666666”
	And Eu modifico o telefone para “(dd)bccuagpe”
	And Eu clico em atualizar telefone 
	Then Eu vejo uma mensagem de novo telefone invalido


Scenario: senha invalida ao remover cliente
	Given Eu estou na pagina do cliente “Fulano”
	And Eu clico em excluir conta
	When Eu preencho o campo senha “1234567”
	And Eu clico em confirmar exclusao
	Then Eu vejo uma mensagem de erro senha invalida
	
	
Scenario: remover cliente
	Given Eu estou na pagina do cliente “Fulano”
	And Eu clico em excluir conta
	When Eu preencho o campo senha “12345”
	And Eu clico em confirmar exclusao
	Then Eu vejo uma mensagem de sucesso ao remover cliente “Fulano”




