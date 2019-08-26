namespace :dev do
  desc "TODO"
  task mkdb: :environment do
    `rails db:create db:migrate db:seed`
  end

  task rmkdb: :environment do
    `rails db:drop db:create db:migrate db:seed`
  end
end
