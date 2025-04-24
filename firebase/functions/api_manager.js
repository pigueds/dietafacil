const axios = require("axios").default;
const qs = require("qs");

async function _criarCardIdCall(context, ffVariables) {
  var number = ffVariables["number"];
  var mes = ffVariables["mes"];
  var ano = ffVariables["ano"];
  var cvv = ffVariables["cvv"];
  var cpf = ffVariables["cpf"];
  var nome = ffVariables["nome"];
  var bandeira = ffVariables["bandeira"];
  var label = ffVariables["label"];
  var address1 = ffVariables["address1"];
  var address2 = ffVariables["address2"];
  var cep = ffVariables["cep"];
  var cidade = ffVariables["cidade"];
  var estado = ffVariables["estado"];
  var publicKey = ffVariables["publicKey"];
  var codCliente = ffVariables["codCliente"];

  var url = `https://api.pagar.me/core/v5/customers/${codCliente}/cards`;
  var headers = {
    Authorization: `Basic c2tfMGYyMWUzNzFhNjE0NGM3Y2E3NWU0MTBmNWFkMDJiOWE6`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "number": "${escapeStringForJson(number)}",
  "holder_name": "${escapeStringForJson(nome)}",
  "holder_document": "${escapeStringForJson(cpf)}",
  "exp_month": "${escapeStringForJson(mes)}",
  "exp_year": "${escapeStringForJson(ano)}",
  "cvv": "${escapeStringForJson(cvv)}",
  "brand": "${escapeStringForJson(bandeira)}",
  "label": "${escapeStringForJson(label)}",
  "billing_address": {
    "line_1": "${escapeStringForJson(address1)}",
    "line_2": "${escapeStringForJson(address2)}",
    "zip_code": "${escapeStringForJson(cep)}",
    "city": "${escapeStringForJson(cidade)}",
    "state": "${escapeStringForJson(estado)}",
    "country": "BR"
  },
  "metadata": {
    "Classificação": "Cliente Premium"
  }
}
`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _compraComCardIdCall(context, ffVariables) {
  var token = ffVariables["token"];
  var planId = ffVariables["planId"];
  var nome = ffVariables["nome"];
  var email = ffVariables["email"];
  var cpf = ffVariables["cpf"];
  var address1 = ffVariables["address1"];
  var address2 = ffVariables["address2"];
  var cep = ffVariables["cep"];
  var cidade = ffVariables["cidade"];
  var estado = ffVariables["estado"];
  var mobilePhone = ffVariables["mobilePhone"];
  var cvv = ffVariables["cvv"];
  var ddd = ffVariables["ddd"];
  var uid = ffVariables["uid"];

  var url = `https://api.pagar.me/core/v5/subscriptions`;
  var headers = {
    Authorization: `Basic c2tfMGYyMWUzNzFhNjE0NGM3Y2E3NWU0MTBmNWFkMDJiOWE6`,
  };
  var params = {};
  var ffApiRequestBody = `
{
    "customer": {
        "name": "${escapeStringForJson(nome)}",
        "type": "individual",
        "email": "${escapeStringForJson(email)}",
        "document": "${escapeStringForJson(cpf)}",
        "address": {
            "line_1": "${escapeStringForJson(address1)}",
            "line_2": "${escapeStringForJson(address2)}",
            "zip_code": "${escapeStringForJson(cep)}",
            "city": "${escapeStringForJson(cidade)}",
            "state": "${escapeStringForJson(estado)}",
            "country": "BR"
        },
        "phones": {
            "home_phone": {
                "country_code": "55",
                "area_code": "${escapeStringForJson(ddd)}",
                "number": "000000000"
            },
            "mobile_phone": {
                "country_code": "55",
                "area_code": "${escapeStringForJson(ddd)}",
                "number": "${escapeStringForJson(mobilePhone)}"
            }
        }
    },
    "plan_id": "${escapeStringForJson(planId)}",
    "discounts": [
        {
            "discount_type": "percentage",
            "value": 1,
            "cycles": 12
        }
    ],
    "increments": [
        {
            "increment_type": "percentage",
            "value": 0,
            "cycles": 3
        }
    ],
    "payment_method": "credit_card",
    "card_id": "${escapeStringForJson(token)}",
    "credit_card": {
        "installments": 1,
        "statement_descriptor": "AVENGERS", 
        "card": {
            "cvv": "${escapeStringForJson(cvv)}",
            "billing_address": {
            "line_1": "${escapeStringForJson(address1)}",
            "zip_code": "${escapeStringForJson(cep)}",
            "city": "${escapeStringForJson(cidade)}",
            "state": "${escapeStringForJson(estado)}",
            "country": "BR"
            }
        }
    },
    "currency": "BRL",
   
    "metadata": {
        "id": "${escapeStringForJson(uid)}"
    }
}
`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _verificaAssinaturaCall(context, ffVariables) {
  var assinaturaId = ffVariables["assinaturaId"];

  var url = `https://api.pagar.me/core/v5/subscriptions/${assinaturaId}`;
  var headers = {
    Authorization: `Basic c2tfMGYyMWUzNzFhNjE0NGM3Y2E3NWU0MTBmNWFkMDJiOWE6`,
  };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _verificarPlanoCall(context, ffVariables) {
  var planID = ffVariables["planID"];

  var url = `https://api.pagar.me/core/v5/plans/${planID}`;
  var headers = {
    Authorization: `Basic c2tfMGYyMWUzNzFhNjE0NGM3Y2E3NWU0MTBmNWFkMDJiOWE6`,
  };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _alterarMeioDePagamentoCall(context, ffVariables) {
  var idAssinatura = ffVariables["idAssinatura"];
  var cardnumber = ffVariables["cardnumber"];
  var ano = ffVariables["ano"];
  var mes = ffVariables["mes"];
  var cvv = ffVariables["cvv"];
  var address1 = ffVariables["address1"];
  var address2 = ffVariables["address2"];
  var cep = ffVariables["cep"];
  var cidade = ffVariables["cidade"];
  var estado = ffVariables["estado"];
  var nome = ffVariables["nome"];
  var rua = ffVariables["rua"];
  var bairro = ffVariables["bairro"];
  var addressnumber = ffVariables["addressnumber"];

  var url = `https://api.pagar.me/core/v5/subscriptions/${idAssinatura}/payment-method`;
  var headers = {
    Authorization: `Basic c2tfMGYyMWUzNzFhNjE0NGM3Y2E3NWU0MTBmNWFkMDJiOWE6`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "payment_method": "credit_card",  
  "card": {                        
    "number": "${escapeStringForJson(cardnumber)}",       
    "holder_name": "${escapeStringForJson(nome)}",        
    "exp_month": "${escapeStringForJson(mes)}",             
    "exp_year": "${escapeStringForJson(ano)}",             
    "cvv": "${escapeStringForJson(cvv)}",                
    "billing_address": {          
            "street": "${escapeStringForJson(rua)}",
            "number": "${escapeStringForJson(addressnumber)}",
            "complement": "${escapeStringForJson(address2)}",
            "zip_code": "${escapeStringForJson(cep)}",
            "neighborhood": "${escapeStringForJson(bairro)}",
            "city": "${escapeStringForJson(cidade)}",
            "state": "${escapeStringForJson(estado)}",
            "country": "BR",
            "line_1": "${escapeStringForJson(address1)}",
            "line_2": "${escapeStringForJson(address2)}"
    }
  }
}`;

  return makeApiRequest({
    method: "patch",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _cancelarAssinaturaCall(context, ffVariables) {
  var assinaturaId = ffVariables["assinaturaId"];

  var url = `https://api.pagar.me/core/v5/subscriptions/${assinaturaId}`;
  var headers = {
    Authorization: `Basic c2tfMGYyMWUzNzFhNjE0NGM3Y2E3NWU0MTBmNWFkMDJiOWE6`,
  };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _criarClienteCall(context, ffVariables) {
  var nome = ffVariables["nome"];
  var email = ffVariables["email"];
  var cpf = ffVariables["cpf"];
  var sexo = ffVariables["sexo"];
  var mobilePhone = ffVariables["mobilePhone"];
  var address1 = ffVariables["address1"];
  var address2 = ffVariables["address2"];
  var cidade = ffVariables["cidade"];
  var estado = ffVariables["estado"];
  var cep = ffVariables["cep"];
  var uid = ffVariables["uid"];
  var dataNascimento = ffVariables["dataNascimento"];
  var ddd = ffVariables["ddd"];

  var url = `https://api.pagar.me/core/v5/customers`;
  var headers = {
    Authorization: `Basic c2tfMGYyMWUzNzFhNjE0NGM3Y2E3NWU0MTBmNWFkMDJiOWE6`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "type": "individual",
  "name": "${escapeStringForJson(nome)}",
  "email": "${escapeStringForJson(email)}",
  "document_type": "CPF",
  "document": "${escapeStringForJson(cpf)}",
  "gender": "${escapeStringForJson(sexo)}",
  "phones": {
    "home_phone": {
      "country_code": "55",
      "area_code": "${escapeStringForJson(ddd)}",
      "number": "000000000"
    },
    "mobile_phone": {
      "country_code": "55",
      "area_code": "${escapeStringForJson(ddd)}",
      "number": "${escapeStringForJson(mobilePhone)}"
    }
  },
  "address": {
    "line_1": "${escapeStringForJson(address1)}",
    "line_2": "${escapeStringForJson(address2)}",
    "zip_code": "${escapeStringForJson(cep)}",
    "city": "${escapeStringForJson(cidade)}",
    "state": "${escapeStringForJson(estado)}",
    "country": "BR"
  },
  "code": "${escapeStringForJson(uid)}",
  "birthdate": "01/09/1993",
  "metadata": {
    "company": "PessoaFisica"
  }
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    CriarCardIdCall: _criarCardIdCall,
    CompraComCardIdCall: _compraComCardIdCall,
    VerificaAssinaturaCall: _verificaAssinaturaCall,
    VerificarPlanoCall: _verificarPlanoCall,
    AlterarMeioDePagamentoCall: _alterarMeioDePagamentoCall,
    CancelarAssinaturaCall: _cancelarAssinaturaCall,
    CriarClienteCall: _criarClienteCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
  isStreamingApi,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      responseType: isStreamingApi ? "stream" : "json",
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
        isStreamingApi: isStreamingApi,
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}
function escapeStringForJson(val) {
  if (typeof val !== "string") {
    return val;
  }
  return val
    .replace(/[\\]/g, "\\\\")
    .replace(/["]/g, '\\"')
    .replace(/[\n]/g, "\\n")
    .replace(/[\t]/g, "\\t");
}

module.exports = { makeApiCall };
