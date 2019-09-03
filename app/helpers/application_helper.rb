module ApplicationHelper
  def nome_loja
    Configuracao.nome_loja
  end

  def home?
    controller_name == 'home' and action_name == 'index'
  end

  def pedidos?
    controller_name == 'pedidos' and action_name == 'index'
  end

  def carrinho?
    controller_name == 'carrinhos' and action_name == 'show'
  end

  def perfil?
    controller_name == 'perfil' and action_name == 'show'
  end
end
