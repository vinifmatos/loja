class Promocao < ApplicationRecord
  belongs_to :produto

  scope :ativas, -> { where('validade > ?', Time.zone.now) }

  def publicar
    self.publicacao ||= Time.now
  end

  def publicada?
    publicacao.present?
  end

  def encerrar
    self.encerramento ||= Time.now
  end

  def encerrada?
    encerramento.present?
  end
end
