import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/info_atividade_widget.dart';
import '/components/info_configavancada_widget.dart';
import '/components/menu_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'dados_do_usuario_widget.dart' show DadosDoUsuarioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class DadosDoUsuarioModel extends FlutterFlowModel<DadosDoUsuarioWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for InputNome widget.
  FocusNode? inputNomeFocusNode;
  TextEditingController? inputNomeTextController;
  String? Function(BuildContext, String?)? inputNomeTextControllerValidator;
  String? _inputNomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o seu nome';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for InputAltura widget.
  FocusNode? inputAlturaFocusNode;
  TextEditingController? inputAlturaTextController;
  final inputAlturaMask = MaskTextInputFormatter(mask: '#.##');
  String? Function(BuildContext, String?)? inputAlturaTextControllerValidator;
  String? _inputAlturaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe a sua altura';
    }

    return null;
  }

  // State field(s) for InputPeso widget.
  FocusNode? inputPesoFocusNode;
  TextEditingController? inputPesoTextController;
  final inputPesoMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? inputPesoTextControllerValidator;
  String? _inputPesoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o peso';
    }

    return null;
  }

  // State field(s) for InputIdade widget.
  FocusNode? inputIdadeFocusNode;
  TextEditingController? inputIdadeTextController;
  final inputIdadeMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? inputIdadeTextControllerValidator;
  String? _inputIdadeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe a idade';
    }

    return null;
  }

  // State field(s) for InputSexo widget.
  FormFieldController<String>? inputSexoValueController;
  // State field(s) for NivelAtividade widget.
  String? nivelAtividadeValue;
  FormFieldController<String>? nivelAtividadeValueController;
  // State field(s) for Objetivo widget.
  String? objetivoValue;
  FormFieldController<String>? objetivoValueController;
  // State field(s) for treino widget.
  String? treinoValue;
  FormFieldController<String>? treinoValueController;
  // State field(s) for SliderRefeicoes widget.
  double? sliderRefeicoesValue;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? formsValidado;

  @override
  void initState(BuildContext context) {
    inputNomeTextControllerValidator = _inputNomeTextControllerValidator;
    inputAlturaTextControllerValidator = _inputAlturaTextControllerValidator;
    inputPesoTextControllerValidator = _inputPesoTextControllerValidator;
    inputIdadeTextControllerValidator = _inputIdadeTextControllerValidator;
  }

  @override
  void dispose() {
    inputNomeFocusNode?.dispose();
    inputNomeTextController?.dispose();

    inputAlturaFocusNode?.dispose();
    inputAlturaTextController?.dispose();

    inputPesoFocusNode?.dispose();
    inputPesoTextController?.dispose();

    inputIdadeFocusNode?.dispose();
    inputIdadeTextController?.dispose();
  }

  /// Additional helper methods.
  String? get inputSexoValue => inputSexoValueController?.value;
}
