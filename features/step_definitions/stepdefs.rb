Given("Eu estou na pagina de produto") do
  visit 'produtos/'
end

And("Eu clico no botao novo produto") do
   click_link 'New Produto'
end

When("Eu preencho o campo nome com {string} marca com {string} preco com {float} quantidade com {int} e descricao {string}") do |nome, marca, preco, quantidade, descricao|
  fill_in 'produto[nome]', with: nome
  fill_in 'produto[marca]', with: marca
  fill_in 'produto[preco]', with: preco
  fill_in 'produto[quantidade]', with: quantidade
  fill_in 'produto[descricao]', with: descricao
end

When("Eu clico em salvar produto") do
  click_button 'Create Produto'
end

Then("Eu vejo que o produto com nome {string} foi salvo") do |nome|
  expect(page).to have_content(nome)
end

When("Eu preencho o campo nome com {string} marca com {string} preco com {string} quantidade com {int} e descricao {string}") do |nome, marca, preco, quantidade, descricao|
  fill_in 'produto[nome]', with: nome
  fill_in 'produto[marca]', with: marca
  fill_in 'produto[preco]', with: preco
  fill_in 'produto[quantidade]', with: quantidade
  fill_in 'produto[descricao]', with: descricao
end

Then("Eu vejo uma mensagem de erro de preco vazio") do
  expect(page).to have_content("Preco can't be blank")
end

Then("Eu vejo uma mensagem de erro de preco invalido") do
  expect(page).to have_content("Preco is not a number")
end
