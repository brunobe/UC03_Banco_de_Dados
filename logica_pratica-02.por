programa {
  inclua biblioteca Matematica --> mat
  funcao inicio() {
    real kmRodados, litrosConsumidos, precoLitro, rendimento, custoDiesel, custoKm
    escreva("Quantos km foram rodados? ")
    leia(kmRodados)
    escreva("Quantos litros foram consumidos? ")
    leia(litrosConsumidos)
    escreva("Digite o preço do litro: R$")
    leia(precoLitro)
    rendimento = kmRodados / litrosConsumidos
    custoDiesel = litrosConsumidos * precoLitro
    custoKm = custoDiesel / kmRodados
    mat.arredondar(rendimento = rendimento, 2)
    mat.arredondar(custoDiesel = custoDiesel, 2)
    mat.arredondar(custoKm = custoKm, 2)
    escreva("O rendimento foi de ", rendimento, " km/l.\n")
    escreva("O custo do diesel é de R$", custoDiesel, ".\n")
    escreva("O custo por km é de R$", custoKm, ".\n")
    se (rendimento >= 0.8) {
      escreva("Classificação do caminhão no fim do turno: eficiente.")
    }
    senao se (rendimento >= 0.6 e custoKm <= 9) {
      escreva("Classificação do caminhão no fim do turno: aceitável.")
    }
    senao {
      escreva("Classificação do caminhão no fim do turno: revisão necessária.")
    }
  }
}