# Cliente

Given("Eu estou na pagina inicial do site") do
  visit 'clientes/'
end

And("Eu clico no botao novo cliente") do
  click_link 'New Cliente'
end


When("Eu preencho o campo nome com {string} o telefone com {int} a senha com {string} e o campo repita senha com {string}") do |nome, telefone, senha, confirmacao_senha|
  fill_in 'cliente[nome]', with: nome
  fill_in 'cliente[telefone]', with: telefone
  fill_in 'cliente[password]', with: senha
  fill_in 'cliente[password_confirmation]', with: confirmacao_senha
end

And("Eu clico em cadastrar cliente") do
  click_button 'Create Cliente'
end

Then("Eu vejo que o cliente com nome {string} foi salvo") do |nome|
  expect(page).to have_content(nome)
end

Then("Eu vejo uma mensagem de erro telefone existente") do
  expect(page).to have_content("Telefone has already been taken")
end

Given("Eu vejo que o telefone {int} já existe") do |telefone|
  click_link 'New Cliente'
  fill_in 'cliente[nome]', with: 'Raquel'
  fill_in 'cliente[telefone]', with: telefone
  fill_in 'cliente[password]', with: '12345678'
  fill_in 'cliente[password_confirmation]', with: '12345678'
  click_button 'Create Cliente'
  click_link 'Back'
  expect(page).to have_content('81999999999')
end

Then("Eu vejo uma mensagem de erro senhas diferem") do
  expect(page).to have_content("Password confirmation doesn't match Password")
end

When("Eu preencho o campo nome com {string} o telefone com {string} a senha com {string} e o campo repita senha com {string}") do |nome, telefone, senha, confirmacao_senha|
  fill_in 'cliente[nome]', with: nome
  fill_in 'cliente[telefone]', with: telefone
  fill_in 'cliente[password]', with: senha
  fill_in 'cliente[password_confirmation]', with: confirmacao_senha
end

Then("Eu vejo uma mensagem de erro de telefone invalido") do
  expect(page).to have_content("Telefone is not a number")
end

Then("Eu vejo uma mensagem de erro de tamanho de senha insuficiente") do
  expect(page).to have_content("Password is too short")
end
