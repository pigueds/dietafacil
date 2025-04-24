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

Future<String> sugerirRefeicaoLANCHES2(
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
      "nome": "Pão com Ovo e Iogurte",
      "base": ["Pão", "Ovo", "Iogurte"],
      "funcao": cafe04PaoOvoIogurte
    },
    {
      "nome": "Pão com Ovo",
      "base": ["Pão", "Ovo"],
      "funcao": cafe01PaoOvo
    },
    {
      "nome": "Pão com Ovo e Queijo",
      "base": ["Pão", "Ovo", "Queijo"],
      "funcao": calc11PaoOvoQueijo
    },
    {
      "nome": "Mandioca com ovo",
      "base": ["Mandioca", "Ovo"],
      "funcao": cafe03MandiocaOvo
    },
    {
      "nome": "Tapioca com Ovo",
      "base": ["Tapioca", "Ovo"],
      "funcao": cafe02TapiocaOvo
    },
    {
      "nome": "Tapioca com Ovo e Iogurte",
      "base": ["Tapioca", "Ovo", "Iogurte"],
      "funcao": cafe05OvoIogurteTapioca
    },
    {
      "nome": "Mandioca com Frango",
      "base": ["Mandioca", "Frango"],
      "funcao": cafe11MandiocaFrango
    },
    {
      "nome": "Tapioca com Ovo e Queijo",
      "base": ["Tapioca", "Ovo", "Queijo"],
      "funcao": cafe06TapiocaOvoQueijo
    },
    {
      "nome": "Pão com Frango",
      "base": ["Pão", "Frango"],
      "funcao": cafe07PaoFrango
    },
    {
      "nome": "Tapioca com Frango, Iogurte e Castanhas",
      "base": ["Tapioca", "Frango", "Iogurte", "Castanhas"],
      "funcao": cafe12FrangoTapiocaCastanhas
    },
    {
      "nome": "Tapioca com Frango",
      "base": ["Tapioca", "Frango"],
      "funcao": cafe08TapiocaFrango
    },
    {
      "nome": "Whey com Frutas e Aveia",
      "base": ["Whey", "Frutas", "Aveia"],
      "funcao": cafe13WheyBananaAveia
    },
    {
      "nome": "Whey com Frutas",
      "base": ["Whey", "Frutas"],
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

String? calc11PaoOvoQueijo(
  double proteina,
  double carboidrato,
  double gordura,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Quantidade de proteína, carboidrato e gordura por alimento
  final ovoProteina = 6.0; // Gramas de proteína por ovo
  final ovoGordura = 5.0; // Gramas de gordura por ovo
  final paoIntegralCarboidrato =
      16.0; // Gramas de carboidrato por fatia de pão integral
  final queijoProteina = 7.0; // Gramas de proteína por 50g de queijo
  final queijoGordura = 9.0; // Gramas de gordura por 50g de queijo
  final queijoPorFatia = 20.0; // Gramas de queijo por fatia (limite de 1 fatia)

  // Calorias por grama de macronutriente
  final caloriasPorProteina = 4.0; // Calorias por grama de proteína
  final caloriasPorCarboidrato = 4.0; // Calorias por grama de carboidrato
  final caloriasPorGordura = 9.0; // Calorias por grama de gordura

  // Função para arredondar para o múltiplo mais próximo
  double roundToNearest(double value, double multiple) {
    if (multiple == 0) return value; // Evita divisão por zero
    return (value / multiple).round() * multiple;
  }

  // Quantidade de proteína fornecida pelo queijo (20g)
  double proteinaFornecidaPeloQueijo = (queijoPorFatia / 50) * queijoProteina;
  print('Proteína fornecida pelo queijo: $proteinaFornecidaPeloQueijo');

  // Subtrair a proteína fornecida pelo queijo da quantidade total de proteína
  double proteinaRestante = proteina - proteinaFornecidaPeloQueijo;
  print('Proteína restante a ser suprida pelos ovos: $proteinaRestante');

  // Cálculo do número de ovos necessário para a proteína restante
  int numOvos = (proteinaRestante / ovoProteina).ceil();
  print('Número de ovos necessários: $numOvos');

  // Cálculo da quantidade de carboidrato restante
  double carboidratoRestante = carboidrato;

  // Cálculo da quantidade de pão integral para atingir a meta de carboidratos
  int fatiasPaoIntegral = (carboidratoRestante / paoIntegralCarboidrato).ceil();
  fatiasPaoIntegral = fatiasPaoIntegral < 0
      ? 0
      : fatiasPaoIntegral; // Ajuste para não ter valores negativos
  print('Fatias de pão integral necessárias: $fatiasPaoIntegral');

  // Cálculo da gordura fornecida pelos ovos e queijo
  double gorduraFornecida =
      (numOvos * ovoGordura) + (queijoPorFatia / 50) * queijoGordura;
  print('Gordura fornecida pelos ovos e queijo: $gorduraFornecida');

  // Garantir que todos os valores sejam válidos e não negativos
  if (numOvos < 0 || fatiasPaoIntegral < 0 || queijoPorFatia < 0) {
    return 'Valores inválidos fornecidos.';
  }

  // Montar o resultado
  String resultado =
      '$numOvos ovos, ${queijoPorFatia.toStringAsFixed(0)}g de queijo\n $fatiasPaoIntegral fatias de pão integral';

  return resultado;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

String cafe01PaoOvo(
  double proteina,
  double carboidrato,
  double gordura,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Quantidade de proteína, carboidrato e gordura por alimento
  final ovoProteina = 6.0; // Gramas de proteína por ovo
  final ovoGordura = 5.0; // Gramas de gordura por ovo
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

  // Cálculo do número de ovos necessário para a proteína
  int numOvos = (proteina / ovoProteina).ceil();
  print('Número de ovos necessários: $numOvos');

  // Cálculo da quantidade de pão integral para atingir a meta de carboidratos
  int fatiasPaoIntegral = (carboidrato / paoIntegralCarboidrato).ceil();
  fatiasPaoIntegral = fatiasPaoIntegral < 0
      ? 0
      : fatiasPaoIntegral; // Ajuste para não ter valores negativos
  print('Fatias de pão integral necessárias: $fatiasPaoIntegral');

  // Cálculo da gordura fornecida pelos ovos
  double gorduraFornecida = numOvos * ovoGordura;
  print('Gordura fornecida pelos ovos: $gorduraFornecida');

  // Garantir que todos os valores sejam válidos e não negativos
  if (numOvos < 0 || fatiasPaoIntegral < 0) {
    return 'Valores inválidos fornecidos.';
  }

  // Montar o resultado
  String resultado =
      '$numOvos ovos\n $fatiasPaoIntegral fatias de pão integral';

  return resultado;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

String cafe02TapiocaOvo(
  double proteina,
  double carboidrato,
  double gordura,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Quantidade de proteína, carboidrato e gordura por alimento
  final ovoProteina = 6.0; // Gramas de proteína por ovo
  final ovoGordura = 5.0; // Gramas de gordura por ovo
  final tapiocaCarboidrato = 30.0; // Gramas de carboidrato por 50g de tapioca

  // Calorias por grama de macronutriente
  final caloriasPorProteina = 4.0; // Calorias por grama de proteína
  final caloriasPorCarboidrato = 4.0; // Calorias por grama de carboidrato
  final caloriasPorGordura = 9.0; // Calorias por grama de gordura

  // Cálculo do número de ovos necessário para a proteína
  int numOvos = (proteina / ovoProteina).ceil();
  print('Número de ovos necessários: $numOvos');

  // Cálculo da quantidade de tapioca em gramas para atingir a meta de carboidratos
  double gramasTapioca = (carboidrato / tapiocaCarboidrato) * 50;
  gramasTapioca = gramasTapioca < 0 ? 0 : gramasTapioca;
  print('Gramas de tapioca necessárias: $gramasTapioca');

  // Cálculo da gordura fornecida pelos ovos
  double gorduraFornecida = numOvos * ovoGordura;
  print('Gordura fornecida pelos ovos: $gorduraFornecida');

  // Garantir que todos os valores sejam válidos e não negativos
  if (numOvos < 0 || gramasTapioca < 0) {
    return 'Valores inválidos fornecidos.';
  }

  // Montar o resultado
  String resultado =
      '$numOvos ovos\n ${gramasTapioca.toStringAsFixed(0)}g de tapioca';

  return resultado;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

String cafe03MandiocaOvo(
  double proteina,
  double carboidrato,
  double gordura,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Quantidade de proteína, carboidrato e gordura por alimento
  final ovoProteina = 6.0; // Gramas de proteína por ovo
  final ovoGordura = 5.0; // Gramas de gordura por ovo
  final mandiocaCarboidrato =
      30.0; // Gramas de carboidrato por 100g de mandioca

  // Calorias por grama de macronutriente
  final caloriasPorProteina = 4.0; // Calorias por grama de proteína
  final caloriasPorCarboidrato = 4.0; // Calorias por grama de carboidrato
  final caloriasPorGordura = 9.0; // Calorias por grama de gordura

  // Cálculo do número de ovos necessário para a proteína
  int numOvos = (proteina / ovoProteina).ceil();
  print('Número de ovos necessários: $numOvos');

  // Cálculo da quantidade de mandioca em gramas para atingir a meta de carboidratos
  double gramasMandioca = (carboidrato / mandiocaCarboidrato) * 100;
  gramasMandioca = gramasMandioca < 0 ? 0 : gramasMandioca;
  print('Gramas de mandioca necessárias: $gramasMandioca');

  // Cálculo da gordura fornecida pelos ovos
  double gorduraFornecida = numOvos * ovoGordura;
  print('Gordura fornecida pelos ovos: $gorduraFornecida');

  // Garantir que todos os valores sejam válidos e não negativos
  if (numOvos < 0 || gramasMandioca < 0) {
    return 'Valores inválidos fornecidos.';
  }

  // Montar o resultado
  String resultado =
      '$numOvos ovos\n ${gramasMandioca.toStringAsFixed(0)}g de mandioca';

  return resultado;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

String? cafe04PaoOvoIogurte(
  double proteina,
  double carboidrato,
  double gordura,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Quantidade de proteína, carboidrato e gordura por alimento
  final ovoProteina = 6.0; // Gramas de proteína por ovo
  final ovoGordura = 5.0; // Gramas de gordura por ovo
  final paoIntegralCarboidrato =
      16.0; // Gramas de carboidrato por fatia de pão integral
  final iogurteProteina = 7.0; // Gramas de proteína por 200ml de iogurte light
  final iogurteGordura = 2.0; // Gramas de gordura por 200ml de iogurte light

  // Calorias por grama de macronutriente
  final caloriasPorProteina = 4.0; // Calorias por grama de proteína
  final caloriasPorCarboidrato = 4.0; // Calorias por grama de carboidrato
  final caloriasPorGordura = 9.0; // Calorias por grama de gordura

  // Proteína fornecida pelo iogurte
  double proteinaFornecidaPeloIogurte = iogurteProteina;
  print('Proteína fornecida pelo iogurte: $proteinaFornecidaPeloIogurte');

  // Subtrair a proteína fornecida pelo iogurte da quantidade total de proteína
  double proteinaRestante = proteina - proteinaFornecidaPeloIogurte;
  print('Proteína restante a ser suprida pelos ovos: $proteinaRestante');

  // Cálculo do número de ovos necessário para a proteína restante
  int numOvos = (proteinaRestante / ovoProteina).ceil();
  numOvos = numOvos < 0 ? 0 : numOvos;
  print('Número de ovos necessários: $numOvos');

  // Cálculo da quantidade de carboidrato restante
  double carboidratoRestante = carboidrato;

  // Cálculo da quantidade de pão integral para atingir a meta de carboidratos
  int fatiasPaoIntegral = (carboidratoRestante / paoIntegralCarboidrato).ceil();
  fatiasPaoIntegral = fatiasPaoIntegral < 0 ? 0 : fatiasPaoIntegral;
  print('Fatias de pão integral necessárias: $fatiasPaoIntegral');

  // Cálculo da gordura fornecida pelos ovos e iogurte
  double gorduraFornecida = (numOvos * ovoGordura) + iogurteGordura;
  print('Gordura fornecida pelos ovos e iogurte: $gorduraFornecida');

  // Garantir que todos os valores sejam válidos e não negativos
  if (numOvos < 0 || fatiasPaoIntegral < 0) {
    return 'Valores inválidos fornecidos.';
  }

  // Montar o resultado
  String resultado =
      '$numOvos ovos, 200ml de iogurte light\n $fatiasPaoIntegral fatias de pão integral';

  return resultado;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

String? cafe05OvoIogurteTapioca(
  double proteina,
  double carboidrato,
  double gordura,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Quantidade de proteína, carboidrato e gordura por alimento
  final ovoProteina = 6.0; // Gramas de proteína por ovo
  final ovoGordura = 5.0; // Gramas de gordura por ovo
  final tapiocaCarboidrato = 30.0; // Gramas de carboidrato por 50g de tapioca
  final iogurteProteina = 7.0; // Gramas de proteína por 200ml de iogurte light
  final iogurteGordura = 2.0; // Gramas de gordura por 200ml de iogurte light

  // Calorias por grama de macronutriente
  final caloriasPorProteina = 4.0; // Calorias por grama de proteína
  final caloriasPorCarboidrato = 4.0; // Calorias por grama de carboidrato
  final caloriasPorGordura = 9.0; // Calorias por grama de gordura

  // Proteína fornecida pelo iogurte
  double proteinaFornecidaPeloIogurte = iogurteProteina;
  print('Proteína fornecida pelo iogurte: $proteinaFornecidaPeloIogurte');

  // Subtrair a proteína fornecida pelo iogurte da quantidade total de proteína
  double proteinaRestante = proteina - proteinaFornecidaPeloIogurte;
  print('Proteína restante a ser suprida pelos ovos: $proteinaRestante');

  // Cálculo do número de ovos necessário para a proteína restante
  int numOvos = (proteinaRestante / ovoProteina).ceil();
  numOvos = numOvos < 0 ? 0 : numOvos;
  print('Número de ovos necessários: $numOvos');

  // Cálculo da quantidade de carboidrato restante
  double carboidratoRestante = carboidrato;

  // Cálculo da quantidade de tapioca para atingir a meta de carboidratos
  double gramasTapioca = (carboidratoRestante / tapiocaCarboidrato) * 50;
  gramasTapioca = gramasTapioca < 0 ? 0 : gramasTapioca;
  print('Gramas de tapioca necessárias: ${gramasTapioca.toStringAsFixed(0)}g');

  // Cálculo da gordura fornecida pelos ovos e iogurte
  double gorduraFornecida = (numOvos * ovoGordura) + iogurteGordura;
  print('Gordura fornecida pelos ovos e iogurte: $gorduraFornecida');

  // Garantir que todos os valores sejam válidos e não negativos
  if (numOvos < 0 || gramasTapioca < 0) {
    return 'Valores inválidos fornecidos.';
  }

  // Montar o resultado
  String resultado =
      '$numOvos ovos, 200ml de iogurte light\n ${gramasTapioca.toStringAsFixed(0)}g de tapioca';

  return resultado;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

String? cafe06TapiocaOvoQueijo(
  double proteina,
  double carboidrato,
  double gordura,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Quantidade de proteína, carboidrato e gordura por alimento
  final ovoProteina = 6.0; // Gramas de proteína por ovo
  final ovoGordura = 5.0; // Gramas de gordura por ovo
  final tapiocaCarboidrato = 30.0; // Gramas de carboidrato por 50g de tapioca
  final queijoProteina = 7.0; // Gramas de proteína por 50g de queijo
  final queijoGordura = 9.0; // Gramas de gordura por 50g de queijo
  final queijoPorFatia = 20.0; // Gramas de queijo por fatia (limite de 1 fatia)

  // Calorias por grama de macronutriente
  final caloriasPorProteina = 4.0; // Calorias por grama de proteína
  final caloriasPorCarboidrato = 4.0; // Calorias por grama de carboidrato
  final caloriasPorGordura = 9.0; // Calorias por grama de gordura

  // Função para arredondar para o múltiplo mais próximo
  double roundToNearest(double value, double multiple) {
    if (multiple == 0) return value; // Evita divisão por zero
    return (value / multiple).round() * multiple;
  }

  // Quantidade de proteína fornecida pelo queijo (20g)
  double proteinaFornecidaPeloQueijo = (queijoPorFatia / 50) * queijoProteina;
  print('Proteína fornecida pelo queijo: $proteinaFornecidaPeloQueijo');

  // Subtrair a proteína fornecida pelo queijo da quantidade total de proteína
  double proteinaRestante = proteina - proteinaFornecidaPeloQueijo;
  print('Proteína restante a ser suprida pelos ovos: $proteinaRestante');

  // Cálculo do número de ovos necessário para a proteína restante
  int numOvos = (proteinaRestante / ovoProteina).ceil();
  print('Número de ovos necessários: $numOvos');

  // Cálculo da quantidade de carboidrato restante
  double carboidratoRestante = carboidrato;

  // Cálculo da quantidade de tapioca para atingir a meta de carboidratos
  double gramasTapioca = (carboidratoRestante / tapiocaCarboidrato) * 50;
  gramasTapioca = gramasTapioca < 0
      ? 0
      : gramasTapioca; // Ajuste para não ter valores negativos
  print('Gramas de tapioca necessárias: ${gramasTapioca.toStringAsFixed(0)}g');

  // Cálculo da gordura fornecida pelos ovos e queijo
  double gorduraFornecida =
      (numOvos * ovoGordura) + (queijoPorFatia / 50) * queijoGordura;
  print('Gordura fornecida pelos ovos e queijo: $gorduraFornecida');

  // Garantir que todos os valores sejam válidos e não negativos
  if (numOvos < 0 || gramasTapioca < 0 || queijoPorFatia < 0) {
    return 'Valores inválidos fornecidos.';
  }

  // Montar o resultado
  String resultado =
      '$numOvos ovos, ${queijoPorFatia.toStringAsFixed(0)}g de queijo\n ${gramasTapioca.toStringAsFixed(0)}g de tapioca';

  return resultado;

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
  final oleaginosaGordura =
      15.0; // Gramas de gordura por 30g de oleaginosas (ex: castanhas, nozes, amendoim)

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

  // Cálculo da gordura faltante
  double gorduraFaltante = gordura - gorduraFornecida;
  gorduraFaltante = gorduraFaltante < 0
      ? 0
      : gorduraFaltante; // Garantir que não seja negativo
  print('Gordura faltante: $gorduraFaltante');

  // Cálculo da quantidade de oleaginosas necessárias para suprir a gordura faltante
  double gramasOleaginosas =
      (gorduraFaltante / oleaginosaGordura) * 30; // 30g é a porção padrão
  gramasOleaginosas =
      roundToNearest(gramasOleaginosas, 5); // Arredondar para múltiplos de 5g
  print('Gramas de oleaginosas necessárias: $gramasOleaginosas');

  // Garantir que todos os valores sejam válidos e não negativos
  if (gramasFrango < 0 || fatiasPaoIntegral < 0 || gramasOleaginosas < 0) {
    return 'Valores inválidos fornecidos.';
  }

  // Montar o resultado
  String resultado =
      '${gramasFrango.toStringAsFixed(0)}g de frango\n$fatiasPaoIntegral fatias de pão integral';

  // Adicionar oleaginosas ao resultado, se necessário
  if (gramasOleaginosas > 0) {
    resultado += '\n${gramasOleaginosas.toStringAsFixed(0)}g de oleaginosas';
  }

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
  final oleaginosaGordura = 15.0; // Gramas de gordura por 30g de oleaginosas

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

  // Cálculo da gordura faltante
  double gorduraFaltante = gordura - gorduraFornecida;
  gorduraFaltante = gorduraFaltante < 0
      ? 0
      : gorduraFaltante; // Garantir que não seja negativo
  print('Gordura faltante: $gorduraFaltante');

  // Cálculo da quantidade de oleaginosas necessárias para suprir a gordura faltante
  double gramasOleaginosas =
      (gorduraFaltante / oleaginosaGordura) * 30; // 30g é a porção padrão
  gramasOleaginosas =
      roundToNearest(gramasOleaginosas, 5); // Arredondar para múltiplos de 5g
  print('Gramas de oleaginosas necessárias: $gramasOleaginosas');

  // Garantir que todos os valores sejam válidos e não negativos
  if (gramasFrango < 0 || gramasTapioca < 0 || gramasOleaginosas < 0) {
    return 'Valores inválidos fornecidos.';
  }

  // Montar o resultado
  String resultado =
      '${gramasFrango.toStringAsFixed(0)}g de frango\n${gramasTapioca.toStringAsFixed(0)}g de tapioca';

  // Adicionar oleaginosas ao resultado, se necessário
  if (gramasOleaginosas > 0) {
    resultado += '\n${gramasOleaginosas.toStringAsFixed(0)}g de oleaginosas';
  }

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
  final oleaginosaGordura = 15.0; // Gramas de gordura por 30g de oleaginosas

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

  // Cálculo da gordura faltante
  double gorduraFaltante = gordura - gorduraFornecida;
  gorduraFaltante = gorduraFaltante < 0
      ? 0
      : gorduraFaltante; // Garantir que não seja negativo
  print('Gordura faltante: $gorduraFaltante');

  // Cálculo da quantidade de oleaginosas necessárias para suprir a gordura faltante
  double gramasOleaginosas =
      (gorduraFaltante / oleaginosaGordura) * 30; // 30g é a porção padrão
  gramasOleaginosas =
      roundToNearest(gramasOleaginosas, 5); // Arredondar para múltiplos de 5g
  print('Gramas de oleaginosas necessárias: $gramasOleaginosas');

  // Garantir que todos os valores sejam válidos e não negativos
  if (gramasFrango < 0 || gramasBatataDoce < 0 || gramasOleaginosas < 0) {
    return 'Valores inválidos fornecidos.';
  }

  // Montar o resultado
  String resultado =
      '${gramasFrango.toStringAsFixed(0)}g de frango\n${gramasBatataDoce.toStringAsFixed(0)}g de batata doce';

  // Adicionar oleaginosas ao resultado, se necessário
  if (gramasOleaginosas > 0) {
    resultado += '\n${gramasOleaginosas.toStringAsFixed(0)}g de oleaginosas';
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
  final oleaginosaGordura = 15.0; // Gramas de gordura por 30g de oleaginosas

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
  gramasMandioca =
      roundToNearest(gramasMandioca, 10); // Arredondar para múltiplos de 10g
  print('Gramas de mandioca necessárias: $gramasMandioca');

  // Cálculo da gordura fornecida pelo frango
  double gorduraFornecida = (gramasFrango / 100) * frangoGordura;
  print('Gordura fornecida pelo frango: $gorduraFornecida');

  // Cálculo da gordura faltante
  double gorduraFaltante = gordura - gorduraFornecida;
  gorduraFaltante = gorduraFaltante < 0
      ? 0
      : gorduraFaltante; // Garantir que não seja negativo
  print('Gordura faltante: $gorduraFaltante');

  // Cálculo da quantidade de oleaginosas necessárias para suprir a gordura faltante
  double gramasOleaginosas =
      (gorduraFaltante / oleaginosaGordura) * 30; // 30g é a porção padrão
  gramasOleaginosas =
      roundToNearest(gramasOleaginosas, 5); // Arredondar para múltiplos de 5g
  print('Gramas de oleaginosas necessárias: $gramasOleaginosas');

  // Garantir que todos os valores sejam válidos e não negativos
  if (gramasFrango < 0 || gramasMandioca < 0 || gramasOleaginosas < 0) {
    return 'Valores inválidos fornecidos.';
  }

  // Montar o resultado
  String resultado =
      '${gramasFrango.toStringAsFixed(0)}g de frango\n${gramasMandioca.toStringAsFixed(0)}g de mandioca';

  // Adicionar oleaginosas ao resultado, se necessário
  if (gramasOleaginosas > 0) {
    resultado += '\n${gramasOleaginosas.toStringAsFixed(0)}g de oleaginosas';
  }

  return resultado;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

String? cafe12FrangoTapiocaCastanhas(
  double proteina,
  double carboidrato,
  double gordura,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Macronutrientes por alimento
  final iogurteProteina = 7.0; // Gramas de proteína por 200ml de iogurte light
  final iogurteGordura = 2.0; // Gramas de gordura por 200ml de iogurte light
  final tapiocaCarboidrato = 30.0; // Gramas de carboidrato por 50g de tapioca
  final frangoProteina = 31.0; // Gramas de proteína por 100g de frango
  final castanhaGordura = 6.0; // Gramas de gordura por 10g de castanhas

  // Calorias por grama de macronutriente
  final caloriasPorProteina = 4.0;
  final caloriasPorCarboidrato = 4.0;
  final caloriasPorGordura = 9.0;

  // Proteína fornecida pelo iogurte
  double proteinaRestante = proteina - iogurteProteina;
  proteinaRestante = proteinaRestante < 0 ? 0 : proteinaRestante;
  print('Proteína restante a ser suprida pelo frango: $proteinaRestante');

  // Cálculo do frango necessário para a proteína restante
  double gramasFrango = (proteinaRestante / frangoProteina) * 100;
  gramasFrango = gramasFrango < 0 ? 0 : gramasFrango;
  print('Gramas de frango necessárias: ${gramasFrango.toStringAsFixed(0)}g');

  // Cálculo da quantidade de tapioca necessária
  double gramasTapioca = (carboidrato / tapiocaCarboidrato) * 50;
  gramasTapioca = gramasTapioca < 0 ? 0 : gramasTapioca;
  print('Gramas de tapioca necessárias: ${gramasTapioca.toStringAsFixed(0)}g');

  // Cálculo da gordura fornecida pelo iogurte
  double gorduraRestante = gordura - iogurteGordura;
  gorduraRestante = gorduraRestante < 0 ? 0 : gorduraRestante;
  print('Gordura restante a ser suprida pelas castanhas: $gorduraRestante');

  // Cálculo da quantidade de castanhas para atingir a meta de gordura
  double gramasCastanhas = (gorduraRestante / castanhaGordura) * 10;
  gramasCastanhas = gramasCastanhas < 0 ? 0 : gramasCastanhas;
  print(
      'Gramas de castanhas necessárias: ${gramasCastanhas.toStringAsFixed(0)}g');

  // Montar o resultado
  String resultado =
      '${gramasFrango.toStringAsFixed(0)}g de frango, 200ml de iogurte light\n'
      '${gramasTapioca.toStringAsFixed(0)}g de tapioca, ${gramasCastanhas.toStringAsFixed(0)}g de castanhas\n';

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
  final wheyGorduraPorDose = 1.0; // g de gordura por dose de whey (30g)
  final aveiaCarboidrato = 10.0; // g de carboidratos por 15g de aveia
  final oleaginosaGordura = 15.0; // Gramas de gordura por 30g de oleaginosas

  // Média de carboidratos por grama de fruta (banana, maçã, uva, pera, pêssego, melancia, mamão, manga)
  final mediaCarboidratoPorGramaFruta =
      0.2; // 20g de carboidratos por 100g de fruta

  // Função para arredondar para múltiplos
  double roundToNearest(double value, double multiple) {
    if (multiple == 0) return value;
    return (value / multiple).round() * multiple;
  }

  // Cálculo do whey (em gramas)
  double wheyGramas = (proteina / wheyProteinaPorDose) * wheyGramasPorDose;
  wheyGramas = roundToNearest(wheyGramas, 5.0);

  // Cálculo da gordura fornecida pelo whey
  double gorduraFornecida =
      (wheyGramas / wheyGramasPorDose) * wheyGorduraPorDose;
  print('Gordura fornecida pelo whey: $gorduraFornecida');

  // Cálculo da gordura faltante
  double gorduraFaltante = gordura - gorduraFornecida;
  gorduraFaltante = gorduraFaltante < 0
      ? 0
      : gorduraFaltante; // Garantir que não seja negativo
  print('Gordura faltante: $gorduraFaltante');

  // Cálculo da quantidade de oleaginosas necessárias para suprir a gordura faltante
  double gramasOleaginosas =
      (gorduraFaltante / oleaginosaGordura) * 30; // 30g é a porção padrão
  gramasOleaginosas =
      roundToNearest(gramasOleaginosas, 5); // Arredondar para múltiplos de 5g
  print('Gramas de oleaginosas necessárias: $gramasOleaginosas');

  // Subtrair os carboidratos da aveia da meta total
  double carboRestante = carboidrato - aveiaCarboidrato;
  carboRestante = carboRestante < 0 ? 0 : carboRestante;

  // Calcular a quantidade de frutas em gramas
  double gramasFrutas = carboRestante / mediaCarboidratoPorGramaFruta;
  gramasFrutas =
      roundToNearest(gramasFrutas, 20); // Arredondar para múltiplos de 20g

  // Definir um intervalo de frutas (por exemplo, 100g a 150g)
  double intervaloMinimo = gramasFrutas - 20;
  double intervaloMaximo = gramasFrutas + 20;
  intervaloMinimo = intervaloMinimo < 0
      ? 0
      : intervaloMinimo; // Garantir que não seja negativo

  // Montar o resultado
  String resultado =
      '${wheyGramas.toStringAsFixed(0)}g de whey protein\n15g de aveia';

  if (gramasFrutas > 0) {
    resultado +=
        '\n${intervaloMinimo.toStringAsFixed(0)}g a ${intervaloMaximo.toStringAsFixed(0)}g de frutas';
  }

  // Adicionar oleaginosas ao resultado, se necessário
  if (gramasOleaginosas > 0) {
    resultado += '\n${gramasOleaginosas.toStringAsFixed(0)}g de oleaginosas';
  }

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
  final oleaginosaGordura = 15.0; // Gramas de gordura por 30g de oleaginosas

  // Média de carboidratos por grama de fruta (banana, maçã, uva, pera, pêssego, melancia, mamão, manga)
  final mediaCarboidratoPorGramaFruta =
      0.2; // 20g de carboidratos por 100g de fruta

  // Função para arredondar para múltiplos
  double roundToNearest(double value, double multiple) {
    if (multiple == 0) return value;
    return (value / multiple).round() * multiple;
  }

  // Cálculo do whey (em gramas)
  double wheyGramas = (proteina / wheyProteinaPorDose) * wheyGramasPorDose;
  wheyGramas = roundToNearest(wheyGramas, 5.0);

  // Calcular a quantidade de frutas em gramas
  double gramasFrutas = carboidrato / mediaCarboidratoPorGramaFruta;
  gramasFrutas =
      roundToNearest(gramasFrutas, 20); // Arredondar para múltiplos de 20g

  // Definir um intervalo de frutas (por exemplo, 100g a 150g)
  double intervaloMinimo = gramasFrutas - 20;
  double intervaloMaximo = gramasFrutas + 20;
  intervaloMinimo = intervaloMinimo < 0
      ? 0
      : intervaloMinimo; // Garantir que não seja negativo

  // Cálculo da gordura fornecida pelo whey (assumindo 1g de gordura por dose de whey)
  double gorduraFornecida =
      (wheyGramas / wheyGramasPorDose) * 1.0; // 1g de gordura por dose
  print('Gordura fornecida pelo whey: $gorduraFornecida');

  // Cálculo da gordura faltante
  double gorduraFaltante = gordura - gorduraFornecida;
  gorduraFaltante = gorduraFaltante < 0
      ? 0
      : gorduraFaltante; // Garantir que não seja negativo
  print('Gordura faltante: $gorduraFaltante');

  // Cálculo da quantidade de oleaginosas necessárias para suprir a gordura faltante
  double gramasOleaginosas =
      (gorduraFaltante / oleaginosaGordura) * 30; // 30g é a porção padrão
  gramasOleaginosas =
      roundToNearest(gramasOleaginosas, 5); // Arredondar para múltiplos de 5g
  print('Gramas de oleaginosas necessárias: $gramasOleaginosas');

  // Montar o resultado
  String resultado =
      '${wheyGramas.toStringAsFixed(0)}g de whey protein\n${intervaloMinimo.toStringAsFixed(0)}g a ${intervaloMaximo.toStringAsFixed(0)}g de frutas';

  // Adicionar oleaginosas ao resultado, se necessário
  if (gramasOleaginosas > 0) {
    resultado += '\n${gramasOleaginosas.toStringAsFixed(0)}g de oleaginosas';
  }

  return resultado;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
