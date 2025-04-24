import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/info_termos_condicoes_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'login_c_a_d_a_s_t_r_o_widget.dart' show LoginCADASTROWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class LoginCADASTROModel extends FlutterFlowModel<LoginCADASTROWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o seu email.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Informe um email válido.';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe sua senha.';
    }

    if (val.length < 6) {
      return 'Mínimo 6 caracteres.';
    }

    return null;
  }

  // State field(s) for PASSWORD2 widget.
  FocusNode? password2FocusNode;
  TextEditingController? password2TextController;
  late bool password2Visibility;
  String? Function(BuildContext, String?)? password2TextControllerValidator;
  String? _password2TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe sua confirmação de senha.';
    }

    if (val.length < 6) {
      return 'Mínimo 6 caracteres.';
    }

    return null;
  }

  // State field(s) for TELEFONE widget.
  FocusNode? telefoneFocusNode;
  TextEditingController? telefoneTextController;
  final telefoneMask = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)? telefoneTextControllerValidator;
  String? _telefoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe seu telefone.';
    }

    if (val.length < 13) {
      return 'Digite o número completo.';
    }

    return null;
  }

  // State field(s) for check_termos widget.
  bool? checkTermosValue;

  @override
  void initState(BuildContext context) {
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    password2Visibility = false;
    password2TextControllerValidator = _password2TextControllerValidator;
    telefoneTextControllerValidator = _telefoneTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    password2FocusNode?.dispose();
    password2TextController?.dispose();

    telefoneFocusNode?.dispose();
    telefoneTextController?.dispose();
  }
}
