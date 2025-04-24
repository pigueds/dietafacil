import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CriarCardIdCall {
  static Future<ApiCallResponse> call({
    String? number = '',
    String? mes = '',
    String? ano = '',
    String? cvv = '',
    String? cpf = '',
    String? nome = '',
    String? bandeira = '',
    String? label = '',
    String? address1 = '',
    String? address2 = '',
    String? cep = '',
    String? cidade = '',
    String? estado = '',
    String? publicKey = 'pk_yEVoJ8KfNSmeZPAq',
    String? codCliente = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CriarCardIdCall',
        'variables': {
          'number': number,
          'mes': mes,
          'ano': ano,
          'cvv': cvv,
          'cpf': cpf,
          'nome': nome,
          'bandeira': bandeira,
          'label': label,
          'address1': address1,
          'address2': address2,
          'cep': cep,
          'cidade': cidade,
          'estado': estado,
          'publicKey': publicKey,
          'codCliente': codCliente,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? lastDigits(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.card.last_four_digits''',
      ));
  static dynamic? msgERRO(dynamic response) => getJsonField(
        response,
        r'''$.errors''',
      );
  static String? msg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static dynamic? tudo(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class CompraComCardIdCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? planId = 'plan_qRpGOREC7CRMVWLd',
    String? nome = '',
    String? email = '',
    String? cpf = '',
    String? address1 = '',
    String? address2 = '',
    String? cep = '',
    String? cidade = '',
    String? estado = '',
    String? mobilePhone = '',
    String? cvv = '',
    String? ddd = '',
    String? uid = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CompraComCardIdCall',
        'variables': {
          'token': token,
          'planId': planId,
          'nome': nome,
          'email': email,
          'cpf': cpf,
          'address1': address1,
          'address2': address2,
          'cep': cep,
          'cidade': cidade,
          'estado': estado,
          'mobilePhone': mobilePhone,
          'cvv': cvv,
          'ddd': ddd,
          'uid': uid,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic tudo(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class VerificaAssinaturaCall {
  static Future<ApiCallResponse> call({
    String? assinaturaId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'VerificaAssinaturaCall',
        'variables': {
          'assinaturaId': assinaturaId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic pLANstatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class VerificarPlanoCall {
  static Future<ApiCallResponse> call({
    String? planID = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'VerificarPlanoCall',
        'variables': {
          'planID': planID,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ModificarPlanoCall {
  static Future<ApiCallResponse> call({
    String? planID = '',
  }) async {
    final ffApiRequestBody = '''
{
    "name": "Dieta Facil Premium",
    "status": "active",
    "description": "Dieta Facil",
    "shippable": false,
    "payment_methods": [
        "credit_card"
    ],
    "installments": [
        1
    ],
    "minimum_price": 990,
    "statement_descriptor": "Dieta Facil",
    "currency": "BRL",
    "interval": "month",
    "interval_count": 1,
    "billing_type": "prepaid",
    "items": [
        {
            "id": "pi_0bLl6LmTY7SzkVPE",
            "name": "Dieta Facil Premium",
            "quantity": 1,
            "pricing_scheme": {
                "price": 990,
                "scheme_type": "unit"
            }
        },
        {
            "id": "pi_QOGyX4MBfkSJoYRe",
            "name": "Matrícula",
            "quantity": 1,
            "cycles": 1,
            "pricing_scheme": {
                "price": 0,
                "scheme_type": "unit"
            }
        }
    ],
    "metadata": {
        "id": "dieta_facil_premium"
    }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Modificar Plano',
      apiUrl: 'https://api.pagar.me/core/v5/plans/${planID}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Basic c2tfMGYyMWUzNzFhNjE0NGM3Y2E3NWU0MTBmNWFkMDJiOWE6',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CriarPlanoCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
    "name": "Dieta Facil Premium",
    "description": "Dieta Facil",
    "shippable": false,
    "payment_methods": [
        "credit_card"
    ],
    "installments": [
        1
    ],
    "minimum_price": 990,
    "statement_descriptor": "Dieta Facil",
    "currency": "BRL",
    "interval": "month",
    "interval_count": 1,
    "billing_type": "prepaid",
    "items": [
        {
            "id": "pi_0bLl6LmTY7SzkVPE",
            "name": "Dieta Facil Premium",
            "quantity": 1,
            "pricing_scheme": {
                "price": 990,
                "scheme_type": "unit"
            }
        },
        {
            "id": "pi_QOGyX4MBfkSJoYRe",
            "name": "Matrícula",
            "cycles": 1,
            "quantity": 1,
            "pricing_scheme": {
                "price": 0,
                "scheme_type": "unit"
            }
        }
    ],
    "metadata": {
        "id": "dieta_facil"
    }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Criar Plano',
      apiUrl: 'https://api.pagar.me/core/v5/plans',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic c2tfMGYyMWUzNzFhNjE0NGM3Y2E3NWU0MTBmNWFkMDJiOWE6',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AlterarMeioDePagamentoCall {
  static Future<ApiCallResponse> call({
    String? idAssinatura = '',
    String? cardnumber = '',
    String? ano = '',
    String? mes = '',
    String? cvv = '',
    String? address1 = '',
    String? address2 = '',
    String? cep = '',
    String? cidade = '',
    String? estado = '',
    String? nome = '',
    String? rua = '',
    String? bairro = '',
    String? addressnumber = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AlterarMeioDePagamentoCall',
        'variables': {
          'idAssinatura': idAssinatura,
          'cardnumber': cardnumber,
          'ano': ano,
          'mes': mes,
          'cvv': cvv,
          'address1': address1,
          'address2': address2,
          'cep': cep,
          'cidade': cidade,
          'estado': estado,
          'nome': nome,
          'rua': rua,
          'bairro': bairro,
          'addressnumber': addressnumber,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CancelarAssinaturaCall {
  static Future<ApiCallResponse> call({
    String? assinaturaId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CancelarAssinaturaCall',
        'variables': {
          'assinaturaId': assinaturaId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CriarClienteCall {
  static Future<ApiCallResponse> call({
    String? nome = '',
    String? email = '',
    String? cpf = '',
    String? sexo = '',
    String? mobilePhone = '',
    String? address1 = '',
    String? address2 = '',
    String? cidade = '',
    String? estado = '',
    String? cep = '',
    String? uid = '',
    String? dataNascimento = '',
    String? ddd = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CriarClienteCall',
        'variables': {
          'nome': nome,
          'email': email,
          'cpf': cpf,
          'sexo': sexo,
          'mobilePhone': mobilePhone,
          'address1': address1,
          'address2': address2,
          'cidade': cidade,
          'estado': estado,
          'cep': cep,
          'uid': uid,
          'dataNascimento': dataNascimento,
          'ddd': ddd,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeepSeekAlimentosCall {
  static Future<ApiCallResponse> call({
    String? token = 'sk-d5c3ce548b8c4ad2b609a61611d9e270',
    String? macro = '',
    String? quantidade = '',
    String? alimento = '',
    String? alimento2 = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "deepseek-chat",
  "messages": [
    {
      "role": "system",
      "content": "Você irá fazer verificar a equivalência de macronutrientes entre os alimentos. Diga apenas o resultado sem comentários adicionais."
    },
    {
      "role": "user",
      "content": "Em quantidade de ${escapeStringForJson(macro)}, ${escapeStringForJson(quantidade)} gramas de ${escapeStringForJson(alimento)} corresponte a quantas gramas de ${escapeStringForJson(alimento2)}."
    }
  ]
  
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeepSeekAlimentos',
      apiUrl: 'https://api.deepseek.com/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json; charset=utf-8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeepSeekDietaCall {
  static Future<ApiCallResponse> call({
    String? token = 'sk-d5c3ce548b8c4ad2b609a61611d9e270',
    double? numRefeicoes,
    double? proteina,
    double? carbo,
    double? gordura,
    String? cafeDaManha = '',
    String? lanche = '',
    String? almoco = '',
    String? preTreino = '',
    String? posTreino = '',
    String? refChocolate = '',
    String? tipoChocolate = '',
    String? frutasPreferidas = '',
    String? treino = '',
    String? fraseChocolate = '',
    String? calorias = '',
    String? objetivo = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "deepseek-chat",
  "messages": [
    {
      "role": "system",
      "content": "Gere um plano alimentar de ${numRefeicoes} refeições diárias com as metas: Proteína ${proteina}g, Carboidratos ${carbo}g, Gorduras ${gordura}g. REGRAS ABSOLUTAS:\\n1) Use APENAS os alimentos fornecidos\\n2) Distribua macros proporcionalmente\\n3) Quantidades em g/ml/unid/fatias\\n4) Máximo 5 itens/refeição (exceto café).Se  café estiver na lista de alimentos, sempre colocar 1 chicara de café sem açúcar nas 3 opções daquela refeição.\\n5) 3 opções/refeição (variar pelo menos 1 item)\\n6) Incluir: ${escapeStringForJson(fraseChocolate)}\\n7) Todas opções devem conter proteínas\\n8) Sem gorduras em pré/pós-treino\\n9) Combinações prioritárias:\\n- tapioca/ovo/frango/iogurte\\n- arroz/feijão/frango\\n- whey/banana/aveia\\n\\n10) Formato OBRIGATÓRIO:\\n- Itens com quantidades e calorias entre parênteses\\n- Títulos em # Header 1 e Linhas divisórias entre as ${numRefeicoes} refeições. Colococar Opção 1, Opção 2 e Opção 3 em negrito. (---)\\n\\n**REGRA DE OURO (CALORIAS EXATAS):**\\n1) Calcular soma inicial\\n2) Se ≠ ${escapeStringForJson(calorias)}, ajustar AUTOMATICAMENTE nesta ordem:\\n   - Carboidratos: +10-20g/ajuste (arroz/batata/aveia)\\n   - Proteínas: +5-10g/ajuste (frango/ovos/whey)\\n3) Repetir até bater EXATAMENTE ${escapeStringForJson(calorias)} kcal na soma de todas as opções 1 das ${numRefeicoes} apresentadas. Se for necessário, pode dobrar porções de carboidratos, ou multiplicá-las de forma que as calorias sejam atendidas. Atender as calorias é a prioridade máxima.\\n Sem textos extras - apenas liste os itens."
    },
    {
      "role": "user",
      "content": "Dados:\\n- Alimentos:\\n  * Café da manhã: ${escapeStringForJson(cafeDaManha)}\\n  * Lanches: ${escapeStringForJson(lanche)}\\n  * Almoço: ${escapeStringForJson(almoco)}\\n  * Pré-treino: ${escapeStringForJson(preTreino)}\\n  * Pós-treino: ${escapeStringForJson(posTreino)}\\n\\n- Preferências:\\n  * Frutas: ${escapeStringForJson(frutasPreferidas)}\\n  * Treino: ${escapeStringForJson(treino)}\\n  * Objetivo: ${escapeStringForJson(objetivo)}\\n\\nExemplo VÁLIDO:\\n**Café da manhã**\\n- 100g tapioca (150 kcal)\\n- 2 ovos (140 kcal)\\n- 200ml iogurte (120 kcal)\\n---\\n**SOMA DAS CALORIAS TOTAIS DO DIA: 2500 kcal (P: 150g, C: 300g, G: 60g)**"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeepSeekDieta',
      apiUrl: 'https://api.deepseek.com/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
