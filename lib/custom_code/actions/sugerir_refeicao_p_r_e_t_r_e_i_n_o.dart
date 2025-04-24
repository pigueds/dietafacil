// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart'; // Importações do FlutterFlow

Future<String> sugerirRefeicaoPRETREINO(
  List<String> alimentosSelecionados,
  double proteina,
  double carboidrato,
  double gordura,
) async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Verifica se alimentosSelecionados é nulo e define um valor padrão (lista vazia)
  alimentosSelecionados = alimentosSelecionados ?? [];

  // Lista de refeições sugeridas
  List<Map<String, dynamic>> refeicoesSugeridas = [
    {
      "nome": "Mandioca com Frango",
      "base": ["Mandioca", "Frango"],
      "funcao": cafe11MandiocaFrango
    },
    {
      "nome": "Pão com Frango",
      "base": ["Pão", "Frango"],
      "funcao": cafe07PaoFrango
    },
    {
      "nome": "Tapioca com Frango",
      "base": ["Tapioca", "Frango"],
      "funcao": cafe08TapiocaFrango
    },
    {
      "nome": "Whey com Banana e Aveia",
      "base": ["Whey", "Banana", "Aveia"],
      "funcao": cafe13WheyBananaAveia
    },
    {
      "nome": "Whey com Banana",
      "base": ["Whey", "Banana"],
      "funcao": cafe10WheyBanana
    },
    {
      "nome": "Batata doce com Frango",
      "base": ["Batata doce", "Frango"],
      "funcao": cafe09BatataDoceFrango
    }
  ];

  // Filtrar refeições que podem ser feitas com os alimentos disponíveis
  List<String> refeicoesDisponiveis = refeicoesSugeridas.where((refeicao) {
    bool baseOk = (refeicao["base"] as List<dynamic>)
        .every((item) => alimentosSelecionados.contains(item as String));
    return baseOk;
  }).map((refeicao) {
    String? quantidades = refeicao["funcao"](proteina, carboidrato, gordura);
    return "${refeicao["nome"]}:\n$quantidades";
  }).toList();

  // Retorna as refeições sugeridas ou um aviso
  return refeicoesDisponiveis.isNotEmpty
      ? refeicoesDisponiveis.join("\n\nou\n\n")
      : "Nenhuma refeição completa encontrada. Tente selecionar mais alimentos.";

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

String cafe07PaoFrango(
  double proteina,
  double carboidrato,
  double gordura,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Quantidade de proteína, carboidrato e gordura por alimento
  final frangoProteina = 31.0; // Gramas de proteína por 100g de frango
  final frangoGordura = 3.6; // Gramas de gordura por 100g de frango
  final paoIntegralCarboidrato =
      16.0; // Gramas de carboidrato por fatia de pão integral

  // Calorias por grama de macronutriente
  final caloriasPorProteina = 4.0; // Calorias por grama de proteína
  final caloriasPorCarboidrato = 4.0; // Calorias por grama de carboidrato
  final caloriasPorGordura = 9.0; // Calorias por grama de gordura

  // Função para arredondar para o múltiplo mais próximo
  double roundToNearest(double value, double multiple) {
    if (multiple == 0) return value; // Evita divisão por zero
    return (value / multiple).round() * multiple;
  }

  // Cálculo da quantidade de frango necessário para a proteína
  double gramasFrango =
      (proteina / frangoProteina) * 100; // Converter para gramas
  gramasFrango =
      roundToNearest(gramasFrango, 10); // Arredondar para múltiplos de 10g
  print('Gramas de frango necessários: $gramasFrango');

  // Cálculo da quantidade de pão integral para atingir a meta de carboidratos
  int fatiasPaoIntegral = (carboidrato / paoIntegralCarboidrato).ceil();
  fatiasPaoIntegral = fatiasPaoIntegral < 0
      ? 0
      : fatiasPaoIntegral; // Ajuste para não ter valores negativos
  print('Fatias de pão integral necessárias: $fatiasPaoIntegral');

  // Cálculo da gordura fornecida pelo frango
  double gorduraFornecida = (gramasFrango / 100) * frangoGordura;
  print('Gordura fornecida pelo frango: $gorduraFornecida');

  // Garantir que todos os valores sejam válidos e não negativos
  if (gramasFrango < 0 || fatiasPaoIntegral < 0) {
    return 'Valores inválidos fornecidos.';
  }

  // Montar o resultado
  String resultado =
      '${gramasFrango.toStringAsFixed(0)}g de frango\n $fatiasPaoIntegral fatias de pão integral';

  return resultado;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

String cafe08TapiocaFrango(
  double proteina,
  double carboidrato,
  double gordura,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Quantidade de proteína, carboidrato e gordura por alimento
  final frangoProteina = 31.0; // Gramas de proteína por 100g de frango
  final frangoGordura = 3.6; // Gramas de gordura por 100g de frango
  final tapiocaCarboidrato = 30.0; // Gramas de carboidrato por 50g de tapioca

  // Calorias por grama de macronutriente
  final caloriasPorProteina = 4.0; // Calorias por grama de proteína
  final caloriasPorCarboidrato = 4.0; // Calorias por grama de carboidrato
  final caloriasPorGordura = 9.0; // Calorias por grama de gordura

  // Função para arredondar para o múltiplo mais próximo
  double roundToNearest(double value, double multiple) {
    if (multiple == 0) return value; // Evita divisão por zero
    return (value / multiple).round() * multiple;
  }

  // Cálculo da quantidade de frango necessário para a proteína
  double gramasFrango =
      (proteina / frangoProteina) * 100; // Converter para gramas
  gramasFrango =
      roundToNearest(gramasFrango, 10); // Arredondar para múltiplos de 10g
  print('Gramas de frango necessários: $gramasFrango');

  // Cálculo da quantidade de tapioca para atingir a meta de carboidratos
  double gramasTapioca =
      (carboidrato / tapiocaCarboidrato) * 50; // Converter para gramas
  gramasTapioca = gramasTapioca < 0
      ? 0
      : gramasTapioca; // Ajuste para não ter valores negativos
  gramasTapioca =
      roundToNearest(gramasTapioca, 10); // Arredondar para múltiplos de 10g
  print('Gramas de tapioca necessários: $gramasTapioca');

  // Cálculo da gordura fornecida pelo frango
  double gorduraFornecida = (gramasFrango / 100) * frangoGordura;
  print('Gordura fornecida pelo frango: $gorduraFornecida');

  // Garantir que todos os valores sejam válidos e não negativos
  if (gramasFrango < 0 || gramasTapioca < 0) {
    return 'Valores inválidos fornecidos.';
  }

  // Montar o resultado
  String resultado =
      '${gramasFrango.toStringAsFixed(0)}g de frango\n ${gramasTapioca.toStringAsFixed(0)}g de tapioca';

  return resultado;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

String cafe09BatataDoceFrango(
  double proteina,
  double carboidrato,
  double gordura,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Quantidade de proteína, carboidrato e gordura por alimento
  final frangoProteina = 31.0; // Gramas de proteína por 100g de frango
  final frangoGordura = 3.6; // Gramas de gordura por 100g de frango
  final batataDoceCarboidrato =
      20.0; // Gramas de carboidrato por 100g de batata doce

  // Calorias por grama de macronutriente
  final caloriasPorProteina = 4.0; // Calorias por grama de proteína
  final caloriasPorCarboidrato = 4.0; // Calorias por grama de carboidrato
  final caloriasPorGordura = 9.0; // Calorias por grama de gordura

  // Função para arredondar para o múltiplo mais próximo
  double roundToNearest(double value, double multiple) {
    if (multiple == 0) return value; // Evita divisão por zero
    return (value / multiple).round() * multiple;
  }

  // Cálculo da quantidade de frango necessário para a proteína
  double gramasFrango =
      (proteina / frangoProteina) * 100; // Converter para gramas
  gramasFrango =
      roundToNearest(gramasFrango, 10); // Arredondar para múltiplos de 10g
  print('Gramas de frango necessários: $gramasFrango');

  // Cálculo da quantidade de batata doce para atingir a meta de carboidratos
  double gramasBatataDoce =
      (carboidrato / batataDoceCarboidrato) * 100; // Converter para gramas
  gramasBatataDoce = gramasBatataDoce < 0
      ? 0
      : gramasBatataDoce; // Ajuste para não ter valores negativos
  gramasBatataDoce =
      roundToNearest(gramasBatataDoce, 10); // Arredondar para múltiplos de 10g
  print('Gramas de batata doce necessários: $gramasBatataDoce');

  // Cálculo da gordura fornecida pelo frango
  double gorduraFornecida = (gramasFrango / 100) * frangoGordura;
  print('Gordura fornecida pelo frango: $gorduraFornecida');

  // Garantir que todos os valores sejam válidos e não negativos
  if (gramasFrango < 0 || gramasBatataDoce < 0) {
    return 'Valores inválidos fornecidos.';
  }

  // Montar o resultado
  String resultado =
      '${gramasFrango.toStringAsFixed(0)}g de frango\n ${gramasBatataDoce.toStringAsFixed(0)}g de batata doce';

  return resultado;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

String cafe10WheyBanana(
  double proteina,
  double carboidrato,
  double gordura,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Macronutrientes por alimento
  final wheyProteinaPorDose = 24.0; // g de proteína por dose de whey (30g)
  final wheyGramasPorDose = 30.0; // Peso de uma dose de whey em gramas
  final bananaCarboidrato = 27.0; // g de carboidrato por banana média (120g)
  final macaCarboidrato = 15.0; // g de carboidrato por maçã média (100g)

  // Calorias por grama de macronutriente
  final caloriasPorProteina = 4.0;
  final caloriasPorCarboidrato = 4.0;
  final caloriasPorGordura = 9.0;

  // Função para arredondar para múltiplos
  double roundToNearest(double value, double multiple) {
    if (multiple == 0) return value;
    return (value / multiple).round() * multiple;
  }

  // Cálculo do whey (em gramas)
  double wheyGramas = (proteina / wheyProteinaPorDose) * wheyGramasPorDose;
  wheyGramas = roundToNearest(wheyGramas, 5.0);

  // Calcular quantas bananas inteiras podem ser usadas
  int unidadesBanana = (carboidrato / bananaCarboidrato).floor();
  double carboUsadoBanana = unidadesBanana * bananaCarboidrato;

  // Calcular carboidrato restante após as bananas
  double carboFaltante = carboidrato - carboUsadoBanana;

  // Adicionar maçã apenas se faltar carboidratos e for menor que meia banana
  bool adicionarMaca =
      carboFaltante > 0 && carboFaltante <= bananaCarboidrato / 2;

  // Montar o resultado
  String resultado =
      '${wheyGramas.toStringAsFixed(0)}g de whey protein\n${unidadesBanana} banana(s)';

  if (adicionarMaca) {
    resultado += '\n1 maçã';
  }

  return resultado;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

String cafe11MandiocaFrango(
  double proteina,
  double carboidrato,
  double gordura,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Quantidade de proteína, carboidrato e gordura por alimento
  final frangoProteina = 31.0; // Gramas de proteína por 100g de frango
  final frangoGordura = 3.6; // Gramas de gordura por 100g de frango
  final mandiocaCarboidrato =
      30.0; // Gramas de carboidrato por 100g de mandioca

  // Calorias por grama de macronutriente
  final caloriasPorProteina = 4.0; // Calorias por grama de proteína
  final caloriasPorCarboidrato = 4.0; // Calorias por grama de carboidrato
  final caloriasPorGordura = 9.0; // Calorias por grama de gordura

  // Função para arredondar para o múltiplo mais próximo
  double roundToNearest(double value, double multiple) {
    if (multiple == 0) return value; // Evita divisão por zero
    return (value / multiple).round() * multiple;
  }

  // Cálculo da quantidade de frango necessário para a proteína
  double gramasFrango =
      (proteina / frangoProteina) * 100; // Converter para gramas
  gramasFrango =
      roundToNearest(gramasFrango, 10); // Arredondar para múltiplos de 10g
  print('Gramas de frango necessários: $gramasFrango');

  // Cálculo da quantidade de mandioca para atingir a meta de carboidratos
  double gramasMandioca = (carboidrato / mandiocaCarboidrato) * 100;
  gramasMandioca = gramasMandioca < 0
      ? 0
      : gramasMandioca; // Ajuste para não ter valores negativos
  print(
      'Gramas de mandioca necessárias: ${gramasMandioca.toStringAsFixed(0)}g');

  // Cálculo da gordura fornecida pelo frango
  double gorduraFornecida = (gramasFrango / 100) * frangoGordura;
  print('Gordura fornecida pelo frango: $gorduraFornecida');

  // Garantir que todos os valores sejam válidos e não negativos
  if (gramasFrango < 0 || gramasMandioca < 0) {
    return 'Valores inválidos fornecidos.';
  }

  // Montar o resultado
  String resultado =
      '${gramasFrango.toStringAsFixed(0)}g de frango\n ${gramasMandioca.toStringAsFixed(0)}g de mandioca';

  return resultado;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

String cafe13WheyBananaAveia(
  double proteina,
  double carboidrato,
  double gordura,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Macronutrientes por alimento
  final wheyProteinaPorDose = 24.0; // g de proteína por dose de whey (30g)
  final wheyGramasPorDose = 30.0; // Peso de uma dose de whey em gramas
  final bananaCarboidrato = 27.0; // g de carboidratos por banana média (120g)
  final macaCarboidrato = 15.0; // g de carboidratos por maçã média (100g)
  final aveiaCarboidrato = 10.0; // g de carboidratos por 15g de aveia

  // Calorias por grama de macronutriente
  final caloriasPorProteina = 4.0;
  final caloriasPorCarboidrato = 4.0;
  final caloriasPorGordura = 9.0;

  // Função para arredondar para múltiplos
  double roundToNearest(double value, double multiple) {
    if (multiple == 0) return value;
    return (value / multiple).round() * multiple;
  }

  // Cálculo do whey (em gramas)
  double wheyGramas = (proteina / wheyProteinaPorDose) * wheyGramasPorDose;
  wheyGramas = roundToNearest(wheyGramas, 5.0);

  // Subtrair os carboidratos da aveia da meta total
  double carboRestante = carboidrato - aveiaCarboidrato;
  carboRestante = carboRestante < 0 ? 0 : carboRestante;

  // Calcular quantas bananas inteiras podem ser usadas
  int unidadesBanana = (carboRestante / bananaCarboidrato).floor();
  double carboUsadoBanana = unidadesBanana * bananaCarboidrato;

  // Calcular carboidrato restante após as bananas
  double carboFaltante = carboRestante - carboUsadoBanana;

  // Adicionar maçã apenas se faltar carboidratos e for menor que meia banana
  bool adicionarMaca =
      carboFaltante > 0 && carboFaltante <= bananaCarboidrato / 2;

  // Montar o resultado
  String resultado =
      '${wheyGramas.toStringAsFixed(0)}g de whey protein\n15g de aveia';

  if (unidadesBanana > 0) {
    resultado += '\n${unidadesBanana} banana(s)';
  }

  if (adicionarMaca) {
    resultado += '\n1 maçã';
  }

  return resultado;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
