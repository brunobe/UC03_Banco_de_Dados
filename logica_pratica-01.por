programa {
  funcao inicio() {
    // Declaração de variáveis
    inteiro caixasPorPalete = 40
    inteiro quantidadeCaixas, quantidadePaletes, sobra
    real pesoCaixa, temperaturaCamara, pesoTotal
    // Entrada
    escreva("Digite a quantidade de caixas produzidas: ")
    leia(quantidadeCaixas)
    escreva("Peso médio de cada caixa (kg): ")
    leia(pesoCaixa)
    escreva("Temperatura da câmara (°C): ")
    leia(temperaturaCamara)
    // Processamento
    pesoTotal = quantidadeCaixas * pesoCaixa
    quantidadePaletes = quantidadeCaixas / caixasPorPalete
    sobra = quantidadeCaixas % caixasPorPalete
    escreva("O peso total foi: ", pesoTotal, "kg.\n")
    escreva("Quantidade de paletes completos: ", quantidadePaletes, ".\n")
    escreva("Sobrou ", sobra, " caixas para o próximo turno.\n")
    se (quantidadePaletes >= 1 e temperaturaCamara <= -18) {
      escreva("Carregamento liberado!")
    }
    senao se (quantidadePaletes == 0 e temperaturaCamara <= -18) {
      escreva("Carregamento bloqueado; nenhum palete completo.")
    }
    senao se (quantidadePaletes >= 1 e temperaturaCamara > -18) {
      escreva("Carregamento bloqueado; temperatura da câmara acima de -18°C")
    }
    senao {
      escreva("Carregamento bloqueado; nenhum requisito atingido.")
    }
  }
}