import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/menu_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'dados_alimentos_preferidos_ia_widget.dart'
    show DadosAlimentosPreferidosIaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DadosAlimentosPreferidosIaModel
    extends FlutterFlowModel<DadosAlimentosPreferidosIaWidget> {
  ///  Local state fields for this page.

  String mensagemWAIT = 'A melhor dieta é a que você consegue fazer!';

  /// Condicional para mostrar dieta
  bool? dietapronta;

  String tempFRUTAS = 'Frutas';

  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChipsCAFE widget.
  FormFieldController<List<String>>? choiceChipsCAFEValueController;
  List<String>? get choiceChipsCAFEValues =>
      choiceChipsCAFEValueController?.value;
  set choiceChipsCAFEValues(List<String>? val) =>
      choiceChipsCAFEValueController?.value = val;
  // State field(s) for ChoiceChipsALMOCO widget.
  FormFieldController<List<String>>? choiceChipsALMOCOValueController;
  List<String>? get choiceChipsALMOCOValues =>
      choiceChipsALMOCOValueController?.value;
  set choiceChipsALMOCOValues(List<String>? val) =>
      choiceChipsALMOCOValueController?.value = val;
  // State field(s) for ChoiceChipsLANCHES widget.
  FormFieldController<List<String>>? choiceChipsLANCHESValueController;
  List<String>? get choiceChipsLANCHESValues =>
      choiceChipsLANCHESValueController?.value;
  set choiceChipsLANCHESValues(List<String>? val) =>
      choiceChipsLANCHESValueController?.value = val;
  // State field(s) for ChoiceChipsPRETREINO widget.
  FormFieldController<List<String>>? choiceChipsPRETREINOValueController;
  List<String>? get choiceChipsPRETREINOValues =>
      choiceChipsPRETREINOValueController?.value;
  set choiceChipsPRETREINOValues(List<String>? val) =>
      choiceChipsPRETREINOValueController?.value = val;
  // State field(s) for choicechipsFRUTAS widget.
  FormFieldController<List<String>>? choicechipsFRUTASValueController;
  List<String>? get choicechipsFRUTASValues =>
      choicechipsFRUTASValueController?.value;
  set choicechipsFRUTASValues(List<String>? val) =>
      choicechipsFRUTASValueController?.value = val;
  // State field(s) for chheckboxCHOCOLATE widget.
  bool? chheckboxCHOCOLATEValue;
  // State field(s) for ref_chocolate widget.
  String? refChocolateValue;
  FormFieldController<String>? refChocolateValueController;
  // State field(s) for choiceCHOCOLATE widget.
  FormFieldController<List<String>>? choiceCHOCOLATEValueController;
  List<String>? get choiceCHOCOLATEValues =>
      choiceCHOCOLATEValueController?.value;
  set choiceCHOCOLATEValues(List<String>? val) =>
      choiceCHOCOLATEValueController?.value = val;
  // Stores action output result for [Backend Call - API (Verifica Assinatura)] action in Button widget.
  ApiCallResponse? retornoVerificaAssinatura;
  // Stores action output result for [Custom Action - convertLista] action in Button widget.
  String? favoritosCafeApi;
  // Stores action output result for [Custom Action - convertLista] action in Button widget.
  String? favoritosAlmocoApi;
  // Stores action output result for [Custom Action - convertLista] action in Button widget.
  String? favoritosLanchesApi;
  // Stores action output result for [Custom Action - convertLista] action in Button widget.
  String? favoritosPretreinoApi;
  // Stores action output result for [Custom Action - convertLista] action in Button widget.
  String? favoritosFrutasApi;
  // Stores action output result for [Custom Action - convertLista] action in Button widget.
  String? favoritosChocolateApi;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
