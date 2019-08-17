class Produto < ApplicationRecord
  belongs_to :categoria
  has_many :promocoes
end
