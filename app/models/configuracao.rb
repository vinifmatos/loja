class Configuracao < ApplicationRecord

  def self.nome_loja
    self.first.nome_loja
  end

  def nome_loja
    self.json['nome_loja']
  end

  def nome_loja=(nome)
    self.json['nome_loja'] = nome
  end

  def telefone_loja
    self.json['telefone_loja']
  end

  def telefone_loja=(telefone)
    self.json['telefone_loja'] = telefone
  end

  def email_loja
    self.json['email_loja']
  end

  def email_loja=(email)
    self.json['email_loja'] = email
  end
end
