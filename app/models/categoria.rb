class Categoria < ApplicationRecord
  has_many :produtos

  scope :ativas, -> { where(ativo: true) }
end
