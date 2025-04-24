import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "ASSINATURA_id" field.
  String? _aSSINATURAId;
  String get aSSINATURAId => _aSSINATURAId ?? '';
  bool hasASSINATURAId() => _aSSINATURAId != null;

  // "status_plano" field.
  String? _statusPlano;
  String get statusPlano => _statusPlano ?? '';
  bool hasStatusPlano() => _statusPlano != null;

  // "peso" field.
  double? _peso;
  double get peso => _peso ?? 0.0;
  bool hasPeso() => _peso != null;

  // "altura" field.
  double? _altura;
  double get altura => _altura ?? 0.0;
  bool hasAltura() => _altura != null;

  // "idade" field.
  double? _idade;
  double get idade => _idade ?? 0.0;
  bool hasIdade() => _idade != null;

  // "objetivo" field.
  String? _objetivo;
  String get objetivo => _objetivo ?? '';
  bool hasObjetivo() => _objetivo != null;

  // "genero" field.
  String? _genero;
  String get genero => _genero ?? '';
  bool hasGenero() => _genero != null;

  // "nivelatividade" field.
  String? _nivelatividade;
  String get nivelatividade => _nivelatividade ?? '';
  bool hasNivelatividade() => _nivelatividade != null;

  // "num_refeicoes" field.
  double? _numRefeicoes;
  double get numRefeicoes => _numRefeicoes ?? 0.0;
  bool hasNumRefeicoes() => _numRefeicoes != null;

  // "hora_treino" field.
  String? _horaTreino;
  String get horaTreino => _horaTreino ?? '';
  bool hasHoraTreino() => _horaTreino != null;

  // "dieta_pronta" field.
  String? _dietaPronta;
  String get dietaPronta => _dietaPronta ?? '';
  bool hasDietaPronta() => _dietaPronta != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _aSSINATURAId = snapshotData['ASSINATURA_id'] as String?;
    _statusPlano = snapshotData['status_plano'] as String?;
    _peso = castToType<double>(snapshotData['peso']);
    _altura = castToType<double>(snapshotData['altura']);
    _idade = castToType<double>(snapshotData['idade']);
    _objetivo = snapshotData['objetivo'] as String?;
    _genero = snapshotData['genero'] as String?;
    _nivelatividade = snapshotData['nivelatividade'] as String?;
    _numRefeicoes = castToType<double>(snapshotData['num_refeicoes']);
    _horaTreino = snapshotData['hora_treino'] as String?;
    _dietaPronta = snapshotData['dieta_pronta'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? photoUrl,
  String? aSSINATURAId,
  String? statusPlano,
  double? peso,
  double? altura,
  double? idade,
  String? objetivo,
  String? genero,
  String? nivelatividade,
  double? numRefeicoes,
  String? horaTreino,
  String? dietaPronta,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
      'ASSINATURA_id': aSSINATURAId,
      'status_plano': statusPlano,
      'peso': peso,
      'altura': altura,
      'idade': idade,
      'objetivo': objetivo,
      'genero': genero,
      'nivelatividade': nivelatividade,
      'num_refeicoes': numRefeicoes,
      'hora_treino': horaTreino,
      'dieta_pronta': dietaPronta,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.aSSINATURAId == e2?.aSSINATURAId &&
        e1?.statusPlano == e2?.statusPlano &&
        e1?.peso == e2?.peso &&
        e1?.altura == e2?.altura &&
        e1?.idade == e2?.idade &&
        e1?.objetivo == e2?.objetivo &&
        e1?.genero == e2?.genero &&
        e1?.nivelatividade == e2?.nivelatividade &&
        e1?.numRefeicoes == e2?.numRefeicoes &&
        e1?.horaTreino == e2?.horaTreino &&
        e1?.dietaPronta == e2?.dietaPronta;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.photoUrl,
        e?.aSSINATURAId,
        e?.statusPlano,
        e?.peso,
        e?.altura,
        e?.idade,
        e?.objetivo,
        e?.genero,
        e?.nivelatividade,
        e?.numRefeicoes,
        e?.horaTreino,
        e?.dietaPronta
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
