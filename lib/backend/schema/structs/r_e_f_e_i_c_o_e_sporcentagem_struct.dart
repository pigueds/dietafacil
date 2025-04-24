// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class REFEICOESporcentagemStruct extends FFFirebaseStruct {
  REFEICOESporcentagemStruct({
    String? refeicao,
    double? porcentagemREF,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _refeicao = refeicao,
        _porcentagemREF = porcentagemREF,
        super(firestoreUtilData);

  // "Refeicao" field.
  String? _refeicao;
  String get refeicao => _refeicao ?? '';
  set refeicao(String? val) => _refeicao = val;

  bool hasRefeicao() => _refeicao != null;

  // "porcentagemREF" field.
  double? _porcentagemREF;
  double get porcentagemREF => _porcentagemREF ?? 0.0;
  set porcentagemREF(double? val) => _porcentagemREF = val;

  void incrementPorcentagemREF(double amount) =>
      porcentagemREF = porcentagemREF + amount;

  bool hasPorcentagemREF() => _porcentagemREF != null;

  static REFEICOESporcentagemStruct fromMap(Map<String, dynamic> data) =>
      REFEICOESporcentagemStruct(
        refeicao: data['Refeicao'] as String?,
        porcentagemREF: castToType<double>(data['porcentagemREF']),
      );

  static REFEICOESporcentagemStruct? maybeFromMap(dynamic data) => data is Map
      ? REFEICOESporcentagemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Refeicao': _refeicao,
        'porcentagemREF': _porcentagemREF,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Refeicao': serializeParam(
          _refeicao,
          ParamType.String,
        ),
        'porcentagemREF': serializeParam(
          _porcentagemREF,
          ParamType.double,
        ),
      }.withoutNulls;

  static REFEICOESporcentagemStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      REFEICOESporcentagemStruct(
        refeicao: deserializeParam(
          data['Refeicao'],
          ParamType.String,
          false,
        ),
        porcentagemREF: deserializeParam(
          data['porcentagemREF'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'REFEICOESporcentagemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is REFEICOESporcentagemStruct &&
        refeicao == other.refeicao &&
        porcentagemREF == other.porcentagemREF;
  }

  @override
  int get hashCode => const ListEquality().hash([refeicao, porcentagemREF]);
}

REFEICOESporcentagemStruct createREFEICOESporcentagemStruct({
  String? refeicao,
  double? porcentagemREF,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    REFEICOESporcentagemStruct(
      refeicao: refeicao,
      porcentagemREF: porcentagemREF,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

REFEICOESporcentagemStruct? updateREFEICOESporcentagemStruct(
  REFEICOESporcentagemStruct? rEFEICOESporcentagem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    rEFEICOESporcentagem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addREFEICOESporcentagemStructData(
  Map<String, dynamic> firestoreData,
  REFEICOESporcentagemStruct? rEFEICOESporcentagem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (rEFEICOESporcentagem == null) {
    return;
  }
  if (rEFEICOESporcentagem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && rEFEICOESporcentagem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final rEFEICOESporcentagemData =
      getREFEICOESporcentagemFirestoreData(rEFEICOESporcentagem, forFieldValue);
  final nestedData =
      rEFEICOESporcentagemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      rEFEICOESporcentagem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getREFEICOESporcentagemFirestoreData(
  REFEICOESporcentagemStruct? rEFEICOESporcentagem, [
  bool forFieldValue = false,
]) {
  if (rEFEICOESporcentagem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(rEFEICOESporcentagem.toMap());

  // Add any Firestore field values
  rEFEICOESporcentagem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getREFEICOESporcentagemListFirestoreData(
  List<REFEICOESporcentagemStruct>? rEFEICOESporcentagems,
) =>
    rEFEICOESporcentagems
        ?.map((e) => getREFEICOESporcentagemFirestoreData(e, true))
        .toList() ??
    [];
