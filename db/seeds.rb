# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = Usuario.create email: 'admin@admin.com', password: '123456', password_confirmation: '123456', nome: 'admin'

Configuracao.create json: { nome_loja: 'Loja', telefone: '(00) 01234-5678', email: 'loja@loja.com' }