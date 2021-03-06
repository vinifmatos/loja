class Promocao < ApplicationRecord
  belongs_to :produto

  scope :ativas, -> { where('validade > ?', Time.zone.now) }

  def publicar
    self.publicacao ||= Time.now unless publicada?
  end

  def publicada?
    publicacao.present?
  end

  def encerrar
    self.encerramento ||= Time.now unless encerrada?
  end

  def encerrada?
    encerramento.present?
  end
end
