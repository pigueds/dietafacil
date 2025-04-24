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

// Função principal
Future<String> sugerirRefeicaoALMOCO(
  List<String> alimentosSelecionados,
  double proteina,
  double carboidrato,
  double gordura,
) async {
  // Verifica se alimentosSelecionados é nulo e define um valor padrão (lista vazia)
  alimentosSelecionados = alimentosSelecionados ?? [];

  // Lista de refeições sugeridas para almoço/jantar
  List<Map<String, dynamic>> refeicoesSugeridas = [
    {
      "nome": "Arroz com Proteína e Feijão",
      "base": ["Arroz", "Frango/Carne/Peixe", "Feijão"],
      "funcao": almoco01ArrozProteinaFeijao
    },
    {
      "nome": "Macarrão Integral com Proteína",
      "base": ["Macarrão Integral", "Frango/Carne/Peixe"],
      "funcao": almoco02MacarraoProteina
    },
    {
      "nome": "Batata Doce com Proteína",
      "base": ["Batata Doce", "Frango/Carne/Peixe"],
      "funcao": almoco03BatataDoceProteina
    },
    {
      "nome": "Mandioca com Proteína",
      "base": ["Mandioca", "Frango/Carne/Peixe"],
      "funcao": almoco04MandiocaProteina
    },
    {
      "nome": "Arroz com Proteína e Legumes",
      "base": ["Arroz", "Frango/Carne/Peixe", "Legumes"],
      "funcao": almoco05ArrozProteinaLegumes
    },
    {
      "nome": "Batata Inglesa com Proteína",
      "base": ["Batata Inglesa", "Frango/Carne/Peixe"],
      "funcao": almoco06BatataInglesaProteina
    },
    {
      "nome": "Arroz com Feijão e Ovo",
      "base": ["Arroz", "Feijão", "Ovo"],
      "funcao": almoco07ArrozFeijaoOvo
    }
  ];

  // Filtrar refeições que podem ser feitas com os alimentos disponíveis
  List<String> refeicoesDisponiveis = refeicoesSugeridas.where((refeicao) {
    bool baseOk = (refeicao["base"] as List<dynamic>)
        .every((item) => alimentosSelecionados.contains(item as String));
    return baseOk;
  }).map((refeicao) {
    String quantidades = refeicao["funcao"](proteina, carboidrato, gordura);
    return quantidades; // Retorna apenas as quantidades, sem o título
  }).toList();

  // Retorna as refeições sugeridas ou um aviso
  return refeicoesDisponiveis.isNotEmpty
      ? refeicoesDisponiveis.join("\n\nou\n\n")
      : "Nenhuma refeição completa encontrada. Tente selecionar mais alimentos.";
}

// Função para arredondar para múltiplos de 10
double arredondarPara10(double valor) {
  return (valor / 10).round() * 10;
}

// Subfunções

String almoco01ArrozProteinaFeijao(
  double proteina,
  double carboidrato,
  double gordura,
) {
  // Macronutrientes por alimento
  final arrozCarboidrato = 28.0; // Gramas de carboidrato por 100g de arroz
  final feijaoCarboidrato = 20.0; // Gramas de carboidrato por 100g de feijão
  final proteinaAnimal =
      30.0; // Gramas de proteína por 100g de frango/carne/peixe
  final feijaoProteina = 6.0; // Gramas de proteína por 100g de feijão

  // Proporção de 3/4 de arroz e 1/4 de feijão para carboidratos
  double carboidratoArroz = carboidrato * (3 / 4);
  double carboidratoFeijao = carboidrato * (1 / 4);

  // Cálculo da quantidade de arroz
  double gramasArroz = (carboidratoArroz / arrozCarboidrato) * 100;
  gramasArroz = arredondarPara10(gramasArroz < 0 ? 0 : gramasArroz);

  // Cálculo da quantidade de feijão
  double gramasFeijao = (carboidratoFeijao / feijaoCarboidrato) * 100;
  gramasFeijao = arredondarPara10(gramasFeijao < 0 ? 0 : gramasFeijao);

  // Cálculo da quantidade de proteína animal (frango/carne/peixe)
  double gramasProteina = (proteina / proteinaAnimal) * 100;
  gramasProteina = arredondarPara10(gramasProteina < 0 ? 0 : gramasProteina);

  // Montar o resultado
  String resultado = '${gramasArroz.toStringAsFixed(0)}g de arroz\n'
      '${gramasProteina.toStringAsFixed(0)}g de frango/carne/peixe\n'
      '${gramasFeijao.toStringAsFixed(0)}g de feijão';

  return resultado;
}

// As outras subfunções (almoco02MacarraoProteina, almoco03BatataDoceProteina, etc.)
// devem ser ajustadas de forma semelhante para arredondar as quantidades.

// Exemplo de subfunção adicional
String almoco02MacarraoProteina(
  double proteina,
  double carboidrato,
  double gordura,
) {
  // Macronutrientes por alimento
  final macarraoCarboidrato =
      25.0; // Gramas de carboidrato por 100g de macarrão
  final proteinaAnimal =
      30.0; // Gramas de proteína por 100g de frango/carne/peixe

  // Cálculo da quantidade de macarrão
  double gramasMacarrao = (carboidrato / macarraoCarboidrato) * 100;
  gramasMacarrao = arredondarPara10(gramasMacarrao < 0 ? 0 : gramasMacarrao);

  // Cálculo da quantidade de proteína animal (frango/carne/peixe)
  double gramasProteina = (proteina / proteinaAnimal) * 100;
  gramasProteina = arredondarPara10(gramasProteina < 0 ? 0 : gramasProteina);

  // Montar o resultado
  String resultado =
      '${gramasMacarrao.toStringAsFixed(0)}g de macarrão integral\n'
      '${gramasProteina.toStringAsFixed(0)}g de frango/carne/peixe';

  return resultado;
}

// Continue ajustando as outras subfunções de forma semelhante...

// Adicione as outras subfunções aqui (almoco03BatataDoceProteina, almoco04MandiocaProteina, etc.)

// Exemplo de subfunção adicional
String almoco03BatataDoceProteina(
  double proteina,
  double carboidrato,
  double gordura,
) {
  // Macronutrientes por alimento
  final batataDoceCarboidrato =
      20.0; // Gramas de carboidrato por 100g de batata doce
  final proteinaAnimal =
      30.0; // Gramas de proteína por 100g de frango/carne/peixe

  // Cálculo da quantidade de batata doce
  double gramasBatataDoce = (carboidrato / batataDoceCarboidrato) * 100;
  gramasBatataDoce =
      arredondarPara10(gramasBatataDoce < 0 ? 0 : gramasBatataDoce);

  // Cálculo da quantidade de proteína animal (frango/carne/peixe)
  double gramasProteina = (proteina / proteinaAnimal) * 100;
  gramasProteina = arredondarPara10(gramasProteina < 0 ? 0 : gramasProteina);

  // Montar o resultado (sem título)
  String resultado = '${gramasBatataDoce.toStringAsFixed(0)}g de batata doce\n'
      '${gramasProteina.toStringAsFixed(0)}g de frango/carne/peixe';

  return resultado;
}

String almoco04MandiocaProteina(
  double proteina,
  double carboidrato,
  double gordura,
) {
  // Macronutrientes por alimento
  final mandiocaCarboidrato =
      38.0; // Gramas de carboidrato por 100g de mandioca
  final proteinaAnimal =
      30.0; // Gramas de proteína por 100g de frango/carne/peixe

  // Cálculo da quantidade de mandioca
  double gramasMandioca = (carboidrato / mandiocaCarboidrato) * 100;
  gramasMandioca = arredondarPara10(gramasMandioca < 0 ? 0 : gramasMandioca);

  // Cálculo da quantidade de proteína animal (frango/carne/peixe)
  double gramasProteina = (proteina / proteinaAnimal) * 100;
  gramasProteina = arredondarPara10(gramasProteina < 0 ? 0 : gramasProteina);

  // Montar o resultado (sem título)
  String resultado = '${gramasMandioca.toStringAsFixed(0)}g de mandioca\n'
      '${gramasProteina.toStringAsFixed(0)}g de frango/carne/peixe';

  return resultado;
}

String almoco05ArrozProteinaLegumes(
  double proteina,
  double carboidrato,
  double gordura,
) {
  // Macronutrientes por alimento
  final arrozCarboidrato = 28.0; // Gramas de carboidrato por 100g de arroz
  final proteinaAnimal =
      30.0; // Gramas de proteína por 100g de frango/carne/peixe
  final legumesCarboidrato = 10.0; // Gramas de carboidrato por 100g de legumes

  // Cálculo da quantidade de arroz
  double gramasArroz = (carboidrato / arrozCarboidrato) * 100;
  gramasArroz = arredondarPara10(gramasArroz < 0 ? 0 : gramasArroz);

  // Cálculo da quantidade de proteína animal (frango/carne/peixe)
  double gramasProteina = (proteina / proteinaAnimal) * 100;
  gramasProteina = arredondarPara10(gramasProteina < 0 ? 0 : gramasProteina);

  // Cálculo da quantidade de legumes
  double gramasLegumes = (carboidrato / legumesCarboidrato) * 100;
  gramasLegumes = arredondarPara10(gramasLegumes < 0 ? 0 : gramasLegumes);

  // Montar o resultado (sem título)
  String resultado = '${gramasArroz.toStringAsFixed(0)}g de arroz\n'
      '${gramasProteina.toStringAsFixed(0)}g de frango/carne/peixe\n'
      '${gramasLegumes.toStringAsFixed(0)}g de legumes';

  return resultado;
}

String almoco06BatataInglesaProteina(
  double proteina,
  double carboidrato,
  double gordura,
) {
  // Macronutrientes por alimento
  final batataInglesaCarboidrato =
      17.0; // Gramas de carboidrato por 100g de batata inglesa
  final proteinaAnimal =
      30.0; // Gramas de proteína por 100g de frango/carne/peixe

  // Cálculo da quantidade de batata inglesa
  double gramasBatataInglesa = (carboidrato / batataInglesaCarboidrato) * 100;
  gramasBatataInglesa =
      arredondarPara10(gramasBatataInglesa < 0 ? 0 : gramasBatataInglesa);

  // Cálculo da quantidade de proteína animal (frango/carne/peixe)
  double gramasProteina = (proteina / proteinaAnimal) * 100;
  gramasProteina = arredondarPara10(gramasProteina < 0 ? 0 : gramasProteina);

  // Montar o resultado (sem título)
  String resultado =
      '${gramasBatataInglesa.toStringAsFixed(0)}g de batata inglesa\n'
      '${gramasProteina.toStringAsFixed(0)}g de frango/carne/peixe';

  return resultado;
}

String almoco07ArrozFeijaoOvo(
  double proteina,
  double carboidrato,
  double gordura,
) {
  // Macronutrientes por alimento
  final arrozCarboidrato = 28.0; // Gramas de carboidrato por 100g de arroz
  final feijaoProteina = 6.0; // Gramas de proteína por 100g de feijão
  final feijaoCarboidrato = 20.0; // Gramas de carboidrato por 100g de feijão
  final ovoProteina = 13.0; // Gramas de proteína por ovo

  // Cálculo da quantidade de arroz
  double gramasArroz = (carboidrato / arrozCarboidrato) * 100;
  gramasArroz = arredondarPara10(gramasArroz < 0 ? 0 : gramasArroz);

  // Cálculo da quantidade de feijão
  double gramasFeijao = (proteina / feijaoProteina) * 100;
  gramasFeijao = arredondarPara10(gramasFeijao < 0 ? 0 : gramasFeijao);

  // Cálculo da quantidade de ovos
  double quantidadeOvos = (proteina / ovoProteina);
  quantidadeOvos = quantidadeOvos < 0 ? 0 : quantidadeOvos;

  // Montar o resultado (sem título)
  String resultado = '${gramasArroz.toStringAsFixed(0)}g de arroz\n'
      '${gramasFeijao.toStringAsFixed(0)}g de feijão\n'
      '${quantidadeOvos.toStringAsFixed(0)} ovos';

  return resultado;
}
