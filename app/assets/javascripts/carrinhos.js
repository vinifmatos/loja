function atualiza_quantidade(id_item, quantidade, url) {
  let dados = {
    "produto_carrinho": {
      "id": id_item,
      "quantidade": quantidade
    },
    'authenticity_token': Rails.csrfToken()
  }
  $.post(url, dados, function (data) {
    return data.status
  })
}

function parseStrToFloat(str) {
  let formatos = {
    "ptBR": /\d+[\.\d+]*(?:,\d+)$/g,
    "us": /\d+[,\d+]*(?:\.\d+)$/g
  }

  str = str.match(/\d+[(?:\.|,)\d+]*[,\.]\d+/g)[0]

  if (formatos.ptBR.test(str)) {
    return parseFloat(str.replace('.', '').replace(',', '.'))
  } else if (formatos.us.test(str)) {
    return parseFloat(str.replace(',', ''))
  } else {
    return null
  }
}

function formataMoeda(valor, moeda) {
  let grupos = []
  let moedas = {
    'R$': {
      'formato': /\d+[\.\d+]*(?:,\d+)$/g,
      'decimal': ',',
      'separador': '.'
    },
    'U$': {
      'formato': /\d+[,\d+]*(?:\.\d+)$/g,
      'decimal': '.',
      'separador': ','
    }
  }

  let str = valor.split('.')

  for (let i = str[0].length; i > 0; i -= 3) {
    if (i - 3 > 0) {
      grupos.push(str[0].slice(i - 3, i))
    } else {
      grupos.push(str[0].slice(0, i))
    }
  }

  return [moeda, ' ', grupos.reverse().join(moedas[moeda].separador), moedas[moeda].decimal, str[1]].join('')
}

function atualiza_valor_total(id, quantidade) {
  let valor_unitario = parseStrToFloat($('#valorUnitario' + id).val())
  let regex_moeda = /^(?:[A-Za-z]{0,2}\$)/g
  let valor_total = (valor_unitario * quantidade).toFixed(2)
  let valor_formatado = formataMoeda(valor_total, regex_moeda.exec($('#valorUnitario' + id).val())[0])

  $('#valorTotal' + id).val(valor_formatado)
}

$(document).on('turbolinks:load', function () {
  $('.btn-quantidade-aumenta, .btn-quantidade-diminui').click(function () {
    let input = $(this).parents('.input-group').children('.input-quantidade')
    let id_item = $(this).attr('data-id-item')
    let url = $(input).attr('data-url')
    let valor_atual = parseInt($(input).val())
    let valor_novo

    if ($(this).hasClass('btn-quantidade-aumenta')) {
      valor_novo = valor_atual + 1
    } else {
      valor_novo = valor_atual - 1
    }

    if (valor_novo > 0 && valor_novo < 1000) {
      $(input).val(valor_novo);
      atualiza_valor_total(id_item, valor_novo)
      atualiza_quantidade(id_item, valor_novo, url)
    }
  });

  $('.input-quantidade').change(function () {
    let id_item = $(this).attr('data-id-item')
    let url = $(this).attr('data-url')
    let valor_novo = parseInt($(this).val())
    if (valor_novo > 0 && valor_novo < 1000) {
      atualiza_valor_total(id_item, valor_novo)
      atualiza_quantidade(id_item, valor_novo, url)
    } else if (valor_novo <= 0) {
      $(this).val(1)
      atualiza_valor_total(id_item, 1)
    } else if (valor_novo >= 1000) {
      $(this).val(999)
      atualiza_valor_total(id_item, 999)
    }
  });
})
