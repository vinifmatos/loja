class Cliente < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :trackable
  
  has_many :carrinhos
  has_many :pedidos, through: :carrinhos
  has_many :enderecos, foreign_key: :cliente_id, class_name: 'EnderecoCliente', inverse_of: :cliente
end
