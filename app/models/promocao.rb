class Promocao < ApplicationRecord
  belongs_to :produto

  scope :ativas, -> { where('validade > ?', Time.zone.now) }
end
