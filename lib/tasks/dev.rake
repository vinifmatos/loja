namespace :dev do
  desc "TODO"
  task criadb: :environment do
    `rails db:create db:migrate db:seed`
  end

  task recriadb: :environment do
    `rails db:drop db:create db:migrate db:seed`
  end
end
