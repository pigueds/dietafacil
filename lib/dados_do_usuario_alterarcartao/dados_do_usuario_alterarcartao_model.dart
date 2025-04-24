import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dados_do_usuario_alterarcartao_widget.dart'
    show DadosDoUsuarioAlterarcartaoWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class DadosDoUsuarioAlterarcartaoModel
    extends FlutterFlowModel<DadosDoUsuarioAlterarcartaoWidget> {
  ///  Local state fields for this page.

  String? ddd;

  /// telefone sem ddd
  String? phone;

  String active = 'active';

  String? cardMES;

  String? cardANO;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for cartao widget.
  FocusNode? cartaoFocusNode;
  TextEditingController? cartaoTextController;
  final cartaoMask = MaskTextInputFormatter(mask: '#### #### #### ####');
  String? Function(BuildContext, String?)? cartaoTextControllerValidator;
  String? _cartaoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o número do cartão';
    }

    return null;
  }

  // State field(s) for validade widget.
  FocusNode? validadeFocusNode;
  TextEditingController? validadeTextController;
  final validadeMask = MaskTextInputFormatter(mask: '##/##');
  String? Function(BuildContext, String?)? validadeTextControllerValidator;
  String? _validadeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Data validade';
    }

    return null;
  }

  // State field(s) for cvv widget.
  FocusNode? cvvFocusNode;
  TextEditingController? cvvTextController;
  String? Function(BuildContext, String?)? cvvTextControllerValidator;
  String? _cvvTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Código';
    }

    if (val.length < 3) {
      return 'Mínimo 3 dígitos';
    }

    return null;
  }

  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  String? _nomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o seu nome';
    }

    return null;
  }

  // State field(s) for cpf widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfTextController;
  final cpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpfTextControllerValidator;
  String? _cpfTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o seu CPF';
    }

    if (val.length < 14) {
      return 'CPF incorreto';
    }

    return null;
  }

  // State field(s) for CEP widget.
  FocusNode? cepFocusNode;
  TextEditingController? cepTextController;
  final cepMask = MaskTextInputFormatter(mask: '##.###-###');
  String? Function(BuildContext, String?)? cepTextControllerValidator;
  String? _cepTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o CEP';
    }

    if (val.length < 10) {
      return 'CEP incorreto';
    }

    return null;
  }

  // Stores action output result for [Custom Action - buscaCep] action in CEP widget.
  String? enderecoCep;
  // Stores action output result for [Custom Action - buscaCEPCidade] action in CEP widget.
  String? cidade;
  // Stores action output result for [Custom Action - buscaCEPEstado] action in CEP widget.
  String? estado;
  // Stores action output result for [Custom Action - buscaCEPRua] action in CEP widget.
  String? rua;
  // Stores action output result for [Custom Action - buscaCEPbairro] action in CEP widget.
  String? bairro;
  // State field(s) for Rua widget.
  FocusNode? ruaFocusNode;
  TextEditingController? ruaTextController;
  String? Function(BuildContext, String?)? ruaTextControllerValidator;
  String? _ruaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o endereço';
    }

    return null;
  }

  // State field(s) for Numero widget.
  FocusNode? numeroFocusNode;
  TextEditingController? numeroTextController;
  String? Function(BuildContext, String?)? numeroTextControllerValidator;
  String? _numeroTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o número';
    }

    return null;
  }

  // State field(s) for Complemento widget.
  FocusNode? complementoFocusNode;
  TextEditingController? complementoTextController;
  String? Function(BuildContext, String?)? complementoTextControllerValidator;
  // State field(s) for Cidade widget.
  FocusNode? cidadeFocusNode;
  TextEditingController? cidadeTextController;
  String? Function(BuildContext, String?)? cidadeTextControllerValidator;
  String? _cidadeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe a cidade';
    }

    return null;
  }

  // State field(s) for Estado widget.
  String? estadoValue;
  FormFieldController<String>? estadoValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidado;
  // Stores action output result for [Custom Action - extractMonthFromMMYY] action in Button widget.
  String? mes;
  // Stores action output result for [Custom Action - extractYearFromMMYY] action in Button widget.
  String? cardAno;
  // Stores action output result for [Backend Call - API (Alterar meio de pagamento)] action in Button widget.
  ApiCallResponse? cartaoAlterado;

  @override
  void initState(BuildContext context) {
    cartaoTextControllerValidator = _cartaoTextControllerValidator;
    validadeTextControllerValidator = _validadeTextControllerValidator;
    cvvTextControllerValidator = _cvvTextControllerValidator;
    nomeTextControllerValidator = _nomeTextControllerValidator;
    cpfTextControllerValidator = _cpfTextControllerValidator;
    cepTextControllerValidator = _cepTextControllerValidator;
    ruaTextControllerValidator = _ruaTextControllerValidator;
    numeroTextControllerValidator = _numeroTextControllerValidator;
    cidadeTextControllerValidator = _cidadeTextControllerValidator;
  }

  @override
  void dispose() {
    cartaoFocusNode?.dispose();
    cartaoTextController?.dispose();

    validadeFocusNode?.dispose();
    validadeTextController?.dispose();

    cvvFocusNode?.dispose();
    cvvTextController?.dispose();

    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    cpfFocusNode?.dispose();
    cpfTextController?.dispose();

    cepFocusNode?.dispose();
    cepTextController?.dispose();

    ruaFocusNode?.dispose();
    ruaTextController?.dispose();

    numeroFocusNode?.dispose();
    numeroTextController?.dispose();

    complementoFocusNode?.dispose();
    complementoTextController?.dispose();

    cidadeFocusNode?.dispose();
    cidadeTextController?.dispose();
  }
}
