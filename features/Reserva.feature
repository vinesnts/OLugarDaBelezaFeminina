Feature: Reserva

Scenario: nova reserva
	Given Eu estou logado e na pagina inicial do site
	And Eu clico no botao nova reserva
	When Eu seleciono o servico “corte de cabelo” seleciono o campo de horario para “16:00” e o campo data para “01/12/2018”
	And Eu clico em confirmar reserva
	Then Eu vejo que a reserva de “corte de cabelo” para as “16:00” do dia “01/12/2018” foi feita

Scenario: nova reserva indisponivel
	Given Eu estou logado e na pagina inicial do site
	And Eu clico no botao nova reserva
	When Eu seleciono o servico “hidratacao” seleciono o campo de horario para “14:30” e o campo data para“01/12/2018”
	And Eu clico em confirmar reserva
	Then Eu vejo uma mensagem de erro de horario da reserva indisponivel

Scenario: nova reserva com horario invalido
	Given Eu estou logado e na pagina inicial do site
	And Eu clico no botao nova reserva
	When Eu seleciono o servico “hidratacao” seleciono o campo de horario para “10:00”e o campo data para “01/12/2018”
	And Eu clico em confirmar reserva
	Then Eu vejo uma mensagem de erro de horario ja passado

Scenario: nova reserva com data passada
	Given Eu estou logado e na pagina inicial do site
	And Eu clico no botao nova reserva
	When Eu seleciono o servico “corte de cabelo” seleciono o campo de horario para “16:00” e o campo data para  “06/04/1995”
	And Eu clico em confirmar reserva
	Then Eu vejo uma mensagem de erro data invalida

Scenario:nova reserva com dia invalido
	Given Eu estou logado e na pagina inicial do site
	And Eu clico no botao nova reserva
	When Eu seleciono o servico “corte de cabelo” seleciono o campo de horario “16:00”e o campo data para “01/12/2018”
	And Eu clico em confirmar reserva
	Then Eu vejo uma mensagem de erro de dia invalido

Scenario: nova reserva indisponivel
	Given Eu estou logado e na pagina inicial do site
	And Eu clico no botao nova reserva
	When Eu seleciono o servico “hidratacao” seleciono o campo de horario “14:30” e o campo data para “01/12/2018”
	And Eu clico em confirmar reserva
	Then Eu vejo uma mensagem de erro de id de reserva duplicado

Scenario: atualizar servico de reserva
	Given Eu estou na pagina de reserva com id “6”
	And Eu vejo o servico com nome “Penteado” da reserva com id “6”
	And Eu clico para atualizar o servico da reserva com id “6”
	When Eu modifico o campo servico para “Hidratacao”
	And Eu clico em atualizar reserva
	Then Eu vejo que a reserva com servico “Hidratacao” foi atualizada

Scenario: atualizar reserva com servico invalido
	Given Eu estou na pagina de reserva com id “6”	
	And Eu vejo o servico com nome “Penteado” da reserva com id “6”
	And Eu clico para atualizar o servico da reserva com id “6”
	When Eu modifico o campo servico para “”
	And Eu clico em atualizar reserva
	Then Eu vejo uma mensagem de erro de servico invalido

Scenario: atualizar data de reserva
	Given Eu estou na pagina de reserva com id “3”
	And Eu vejo a data “20/12/2018” da reserva
	And Eu clico para atualizar a data da reserva
	When Eu modifico o campo data para “23/12/2018”
	And Eu clico em atualizar reserva
	Then Eu vejo que a reserva com data “23/12/2018” foi atualizada

Scenario: atualizar reserva com data passada
	Given Eu estou na pagina de reserva com id “3”
	And Eu vejo a data “20/12/2018” da reserva
	And Eu clico para atualizar a data da reserva
	When Eu modifico o campo data para “23/12/1995”
	And Eu clico em atualizar reserva
	Then Eu vejo uma mensagem de erro de data passada

Scenario: atualizar horario de reserva
	Given Eu estou na pagina de reserva com id “3”
	And Eu vejo a hora “16:30” da reserva
	And Eu clico para atualizar a hora da reserva
	When Eu modifico o campo hora para “17:00”
	And Eu clico em atualizar reserva
	Then Eu vejo que a reserva com id “3” com data “17:00” foi atualizada

Scenario: atualizar reserva com horario indisponivel
	Given Eu estou na pagina de reserva com id “3”
	And Eu vejo a hora “16:30” da reserva
	And Eu clico para atualizar a hora da reserva
	When Eu modifico o campo hora para “15:30”
	And Eu clico em atualizar reserva
	Then Eu vejo uma mensagem de erro de horario indisponivel

Scenario: atualizar reserva com horario passado
	Given Eu estou na pagina de reserva com id “3”
	And Eu vejo a hora “16:30” da reserva
	And Eu clico para atualizar a hora da reserva
	When Eu modifico o campo hora para “14:00”
	And Eu clico em atualizar reserva
	Then Eu vejo uma mensagem de erro de horario passado

Scenario: excluir reserva 
	Given Eu estou na pagina de reserva com nome “penteado cabelo grande”
	When Eu clico no botao excluir reserva
	Then Eu vejo uma mensagem de sucesso que a reserva foi excluida

Scenario: excluir reserva invalida
	Given Eu estou na pagina de reserva com nome “corte de cabelo”
	When Eu clico no botao excluir reserva
	Then Eu vejo uma mensagem de erro de hora da reserva excedida para exclusao
