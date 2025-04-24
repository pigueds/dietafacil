import '/components/menu_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'converso_a_l_i_m_e_n_t_o_s_widget.dart' show ConversoALIMENTOSWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConversoALIMENTOSModel extends FlutterFlowModel<ConversoALIMENTOSWidget> {
  ///  Local state fields for this page.

  List<String> food1Name = [
    'Arroz branco cozido',
    'Arroz integral cozido',
    'Batata-doce cozida'
  ];
  void addToFood1Name(String item) => food1Name.add(item);
  void removeFromFood1Name(String item) => food1Name.remove(item);
  void removeAtIndexFromFood1Name(int index) => food1Name.removeAt(index);
  void insertAtIndexInFood1Name(int index, String item) =>
      food1Name.insert(index, item);
  void updateFood1NameAtIndex(int index, Function(String) updateFn) =>
      food1Name[index] = updateFn(food1Name[index]);

  List<String> proteinasLIST = [];
  void addToProteinasLIST(String item) => proteinasLIST.add(item);
  void removeFromProteinasLIST(String item) => proteinasLIST.remove(item);
  void removeAtIndexFromProteinasLIST(int index) =>
      proteinasLIST.removeAt(index);
  void insertAtIndexInProteinasLIST(int index, String item) =>
      proteinasLIST.insert(index, item);
  void updateProteinasLISTAtIndex(int index, Function(String) updateFn) =>
      proteinasLIST[index] = updateFn(proteinasLIST[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getCarbsList] action in conversoALIMENTOS widget.
  List<String>? listacarboidrato;
  // Stores action output result for [Custom Action - getProteinList] action in conversoALIMENTOS widget.
  List<String>? listaProteinas;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Custom Action - calculateFoodEquivalent] action in Button widget.
  double? resultadoCarbo;
  // State field(s) for gproteinas widget.
  FocusNode? gproteinasFocusNode;
  TextEditingController? gproteinasTextController;
  String? Function(BuildContext, String?)? gproteinasTextControllerValidator;
  // State field(s) for proteina1 widget.
  String? proteina1Value;
  FormFieldController<String>? proteina1ValueController;
  // State field(s) for proteina2 widget.
  String? proteina2Value;
  FormFieldController<String>? proteina2ValueController;
  // Stores action output result for [Custom Action - calculateProteinEquivalent] action in Button widget.
  double? proteinaEquivalent;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    gproteinasFocusNode?.dispose();
    gproteinasTextController?.dispose();
  }
}
