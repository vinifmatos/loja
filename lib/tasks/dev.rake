namespace :dev do
  desc "TODO"
  task mkdb: :environment do
    `rails db:create db:migrate db:seed dev:seed`
  end

  task rmkdb: :environment do
    `rails db:drop db:create db:migrate db:seed dev:seed`
  end

  task seed: :environment do 
    c = FactoryBot.create_list(:categoria, 5)
    (0..24).each do |i|
      FactoryBot.create(:produto, categoria: c.sample)
    end
    p = Produto.all

    (0..9).each do |i|
      FactoryBot.create(:promocao, produto: p.sample)
    end

    c = Cliente.create email: 'teste@teste.com', password: '123456', password_confirmation: '123456'
    c.confirm
  end
end
