import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _stateNome = prefs.getString('ff_stateNome') ?? _stateNome;
    });
    _safeInit(() {
      _statePeso = prefs.getDouble('ff_statePeso') ?? _statePeso;
    });
    _safeInit(() {
      _stateAltura = prefs.getDouble('ff_stateAltura') ?? _stateAltura;
    });
    _safeInit(() {
      _stateFatorAtividade =
          prefs.getDouble('ff_stateFatorAtividade') ?? _stateFatorAtividade;
    });
    _safeInit(() {
      _gproteinaporkg = prefs.getDouble('ff_gproteinaporkg') ?? _gproteinaporkg;
    });
    _safeInit(() {
      _ggorduraporkg = prefs.getDouble('ff_ggorduraporkg') ?? _ggorduraporkg;
    });
    _safeInit(() {
      _stateIdade = prefs.getDouble('ff_stateIdade') ?? _stateIdade;
    });
    _safeInit(() {
      _stateNIVELatividade =
          prefs.getString('ff_stateNIVELatividade') ?? _stateNIVELatividade;
    });
    _safeInit(() {
      _stateOBJETIVO = prefs.getString('ff_stateOBJETIVO') ?? _stateOBJETIVO;
    });
    _safeInit(() {
      _stateGENERO = prefs.getString('ff_stateGENERO') ?? _stateGENERO;
    });
    _safeInit(() {
      _FavoritosCAFE =
          prefs.getStringList('ff_FavoritosCAFE') ?? _FavoritosCAFE;
    });
    _safeInit(() {
      _FavoritosALMOCO =
          prefs.getStringList('ff_FavoritosALMOCO') ?? _FavoritosALMOCO;
    });
    _safeInit(() {
      _FavoritosLANCHES =
          prefs.getStringList('ff_FavoritosLANCHES') ?? _FavoritosLANCHES;
    });
    _safeInit(() {
      _FavoritosPRETREINO =
          prefs.getStringList('ff_FavoritosPRETREINO') ?? _FavoritosPRETREINO;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _stateNome = '';
  String get stateNome => _stateNome;
  set stateNome(String value) {
    _stateNome = value;
    prefs.setString('ff_stateNome', value);
  }

  double _statePeso = 0.0;
  double get statePeso => _statePeso;
  set statePeso(double value) {
    _statePeso = value;
    prefs.setDouble('ff_statePeso', value);
  }

  double _stateAltura = 0.0;
  double get stateAltura => _stateAltura;
  set stateAltura(double value) {
    _stateAltura = value;
    prefs.setDouble('ff_stateAltura', value);
  }

  double _stateTMB = 0.0;
  double get stateTMB => _stateTMB;
  set stateTMB(double value) {
    _stateTMB = value;
  }

  double _stateTDEE = 0.0;
  double get stateTDEE => _stateTDEE;
  set stateTDEE(double value) {
    _stateTDEE = value;
  }

  double _stateFatorAtividade = 0.0;
  double get stateFatorAtividade => _stateFatorAtividade;
  set stateFatorAtividade(double value) {
    _stateFatorAtividade = value;
    prefs.setDouble('ff_stateFatorAtividade', value);
  }

  double _gproteinaporkg = 2.0;
  double get gproteinaporkg => _gproteinaporkg;
  set gproteinaporkg(double value) {
    _gproteinaporkg = value;
    prefs.setDouble('ff_gproteinaporkg', value);
  }

  double _ggorduraporkg = 0.5;
  double get ggorduraporkg => _ggorduraporkg;
  set ggorduraporkg(double value) {
    _ggorduraporkg = value;
    prefs.setDouble('ff_ggorduraporkg', value);
  }

  double _gproteinadiaria = 0.0;
  double get gproteinadiaria => _gproteinadiaria;
  set gproteinadiaria(double value) {
    _gproteinadiaria = value;
  }

  double _ggorduradiaria = 0.0;
  double get ggorduradiaria => _ggorduradiaria;
  set ggorduradiaria(double value) {
    _ggorduradiaria = value;
  }

  double _gcarbodiario = 0.0;
  double get gcarbodiario => _gcarbodiario;
  set gcarbodiario(double value) {
    _gcarbodiario = value;
  }

  double _stateIdade = 0.0;
  double get stateIdade => _stateIdade;
  set stateIdade(double value) {
    _stateIdade = value;
    prefs.setDouble('ff_stateIdade', value);
  }

  String _stateNIVELatividade = '';
  String get stateNIVELatividade => _stateNIVELatividade;
  set stateNIVELatividade(String value) {
    _stateNIVELatividade = value;
    prefs.setString('ff_stateNIVELatividade', value);
  }

  String _stateOBJETIVO = '';
  String get stateOBJETIVO => _stateOBJETIVO;
  set stateOBJETIVO(String value) {
    _stateOBJETIVO = value;
    prefs.setString('ff_stateOBJETIVO', value);
  }

  String _stateGENERO = 'Homem';
  String get stateGENERO => _stateGENERO;
  set stateGENERO(String value) {
    _stateGENERO = value;
    prefs.setString('ff_stateGENERO', value);
  }

  double _IMC = 0.0;
  double get IMC => _IMC;
  set IMC(double value) {
    _IMC = value;
  }

  List<String> _FavoritosCAFE = [
    'Pão com ovo',
    'Tapioca e frango',
    'Iogurte',
    'Frutas'
  ];
  List<String> get FavoritosCAFE => _FavoritosCAFE;
  set FavoritosCAFE(List<String> value) {
    _FavoritosCAFE = value;
    prefs.setStringList('ff_FavoritosCAFE', value);
  }

  void addToFavoritosCAFE(String value) {
    FavoritosCAFE.add(value);
    prefs.setStringList('ff_FavoritosCAFE', _FavoritosCAFE);
  }

  void removeFromFavoritosCAFE(String value) {
    FavoritosCAFE.remove(value);
    prefs.setStringList('ff_FavoritosCAFE', _FavoritosCAFE);
  }

  void removeAtIndexFromFavoritosCAFE(int index) {
    FavoritosCAFE.removeAt(index);
    prefs.setStringList('ff_FavoritosCAFE', _FavoritosCAFE);
  }

  void updateFavoritosCAFEAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    FavoritosCAFE[index] = updateFn(_FavoritosCAFE[index]);
    prefs.setStringList('ff_FavoritosCAFE', _FavoritosCAFE);
  }

  void insertAtIndexInFavoritosCAFE(int index, String value) {
    FavoritosCAFE.insert(index, value);
    prefs.setStringList('ff_FavoritosCAFE', _FavoritosCAFE);
  }

  List<String> _FavoritosALMOCO = [];
  List<String> get FavoritosALMOCO => _FavoritosALMOCO;
  set FavoritosALMOCO(List<String> value) {
    _FavoritosALMOCO = value;
    prefs.setStringList('ff_FavoritosALMOCO', value);
  }

  void addToFavoritosALMOCO(String value) {
    FavoritosALMOCO.add(value);
    prefs.setStringList('ff_FavoritosALMOCO', _FavoritosALMOCO);
  }

  void removeFromFavoritosALMOCO(String value) {
    FavoritosALMOCO.remove(value);
    prefs.setStringList('ff_FavoritosALMOCO', _FavoritosALMOCO);
  }

  void removeAtIndexFromFavoritosALMOCO(int index) {
    FavoritosALMOCO.removeAt(index);
    prefs.setStringList('ff_FavoritosALMOCO', _FavoritosALMOCO);
  }

  void updateFavoritosALMOCOAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    FavoritosALMOCO[index] = updateFn(_FavoritosALMOCO[index]);
    prefs.setStringList('ff_FavoritosALMOCO', _FavoritosALMOCO);
  }

  void insertAtIndexInFavoritosALMOCO(int index, String value) {
    FavoritosALMOCO.insert(index, value);
    prefs.setStringList('ff_FavoritosALMOCO', _FavoritosALMOCO);
  }

  List<String> _FavoritosLANCHES = [];
  List<String> get FavoritosLANCHES => _FavoritosLANCHES;
  set FavoritosLANCHES(List<String> value) {
    _FavoritosLANCHES = value;
    prefs.setStringList('ff_FavoritosLANCHES', value);
  }

  void addToFavoritosLANCHES(String value) {
    FavoritosLANCHES.add(value);
    prefs.setStringList('ff_FavoritosLANCHES', _FavoritosLANCHES);
  }

  void removeFromFavoritosLANCHES(String value) {
    FavoritosLANCHES.remove(value);
    prefs.setStringList('ff_FavoritosLANCHES', _FavoritosLANCHES);
  }

  void removeAtIndexFromFavoritosLANCHES(int index) {
    FavoritosLANCHES.removeAt(index);
    prefs.setStringList('ff_FavoritosLANCHES', _FavoritosLANCHES);
  }

  void updateFavoritosLANCHESAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    FavoritosLANCHES[index] = updateFn(_FavoritosLANCHES[index]);
    prefs.setStringList('ff_FavoritosLANCHES', _FavoritosLANCHES);
  }

  void insertAtIndexInFavoritosLANCHES(int index, String value) {
    FavoritosLANCHES.insert(index, value);
    prefs.setStringList('ff_FavoritosLANCHES', _FavoritosLANCHES);
  }

  List<String> _FavoritosPRETREINO = [];
  List<String> get FavoritosPRETREINO => _FavoritosPRETREINO;
  set FavoritosPRETREINO(List<String> value) {
    _FavoritosPRETREINO = value;
    prefs.setStringList('ff_FavoritosPRETREINO', value);
  }

  void addToFavoritosPRETREINO(String value) {
    FavoritosPRETREINO.add(value);
    prefs.setStringList('ff_FavoritosPRETREINO', _FavoritosPRETREINO);
  }

  void removeFromFavoritosPRETREINO(String value) {
    FavoritosPRETREINO.remove(value);
    prefs.setStringList('ff_FavoritosPRETREINO', _FavoritosPRETREINO);
  }

  void removeAtIndexFromFavoritosPRETREINO(int index) {
    FavoritosPRETREINO.removeAt(index);
    prefs.setStringList('ff_FavoritosPRETREINO', _FavoritosPRETREINO);
  }

  void updateFavoritosPRETREINOAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    FavoritosPRETREINO[index] = updateFn(_FavoritosPRETREINO[index]);
    prefs.setStringList('ff_FavoritosPRETREINO', _FavoritosPRETREINO);
  }

  void insertAtIndexInFavoritosPRETREINO(int index, String value) {
    FavoritosPRETREINO.insert(index, value);
    prefs.setStringList('ff_FavoritosPRETREINO', _FavoritosPRETREINO);
  }

  double _numeroREFEICOESdia = 6.0;
  double get numeroREFEICOESdia => _numeroREFEICOESdia;
  set numeroREFEICOESdia(double value) {
    _numeroREFEICOESdia = value;
  }

  bool _userPREMIUM = false;
  bool get userPREMIUM => _userPREMIUM;
  set userPREMIUM(bool value) {
    _userPREMIUM = value;
  }

  DateTime? _dataDIETA = DateTime.fromMillisecondsSinceEpoch(1743735600000);
  DateTime? get dataDIETA => _dataDIETA;
  set dataDIETA(DateTime? value) {
    _dataDIETA = value;
  }

  String _cardNumber = '';
  String get cardNumber => _cardNumber;
  set cardNumber(String value) {
    _cardNumber = value;
  }

  String _cardbrand = '';
  String get cardbrand => _cardbrand;
  set cardbrand(String value) {
    _cardbrand = value;
  }

  String _buscaCEPRua = '';
  String get buscaCEPRua => _buscaCEPRua;
  set buscaCEPRua(String value) {
    _buscaCEPRua = value;
  }

  String _buscaCEPbairro = '';
  String get buscaCEPbairro => _buscaCEPbairro;
  set buscaCEPbairro(String value) {
    _buscaCEPbairro = value;
  }

  String _NomeCOMPLETO = '';
  String get NomeCOMPLETO => _NomeCOMPLETO;
  set NomeCOMPLETO(String value) {
    _NomeCOMPLETO = value;
  }

  String _cpf = '';
  String get cpf => _cpf;
  set cpf(String value) {
    _cpf = value;
  }

  String _address1 = '';
  String get address1 => _address1;
  set address1(String value) {
    _address1 = value;
  }

  String _cep = '';
  String get cep => _cep;
  set cep(String value) {
    _cep = value;
  }

  String _buscaCEPCidade = '';
  String get buscaCEPCidade => _buscaCEPCidade;
  set buscaCEPCidade(String value) {
    _buscaCEPCidade = value;
  }

  String _buscaCEPEstado = '';
  String get buscaCEPEstado => _buscaCEPEstado;
  set buscaCEPEstado(String value) {
    _buscaCEPEstado = value;
  }

  String _motivoCancelamento = '';
  String get motivoCancelamento => _motivoCancelamento;
  set motivoCancelamento(String value) {
    _motivoCancelamento = value;
  }

  double _kcalMANUAL = 0.0;
  double get kcalMANUAL => _kcalMANUAL;
  set kcalMANUAL(double value) {
    _kcalMANUAL = value;
  }

  bool _kcalMANUALhabilitado = false;
  bool get kcalMANUALhabilitado => _kcalMANUALhabilitado;
  set kcalMANUALhabilitado(bool value) {
    _kcalMANUALhabilitado = value;
  }

  String _stringCAFE = '';
  String get stringCAFE => _stringCAFE;
  set stringCAFE(String value) {
    _stringCAFE = value;
  }

  String _stringLANCHES = '';
  String get stringLANCHES => _stringLANCHES;
  set stringLANCHES(String value) {
    _stringLANCHES = value;
  }

  String _stringALMOCO = '';
  String get stringALMOCO => _stringALMOCO;
  set stringALMOCO(String value) {
    _stringALMOCO = value;
  }

  String _stringPRETREINO = '';
  String get stringPRETREINO => _stringPRETREINO;
  set stringPRETREINO(String value) {
    _stringPRETREINO = value;
  }

  String _stringPOSTREINO = '';
  String get stringPOSTREINO => _stringPOSTREINO;
  set stringPOSTREINO(String value) {
    _stringPOSTREINO = value;
  }

  String _horatreino = '';
  String get horatreino => _horatreino;
  set horatreino(String value) {
    _horatreino = value;
  }

  String _refeicaoCHOCOLATE = '';
  String get refeicaoCHOCOLATE => _refeicaoCHOCOLATE;
  set refeicaoCHOCOLATE(String value) {
    _refeicaoCHOCOLATE = value;
  }

  String _tipoCHOCOLATE = '';
  String get tipoCHOCOLATE => _tipoCHOCOLATE;
  set tipoCHOCOLATE(String value) {
    _tipoCHOCOLATE = value;
  }

  String _frutasPREFERIDAS = '';
  String get frutasPREFERIDAS => _frutasPREFERIDAS;
  set frutasPREFERIDAS(String value) {
    _frutasPREFERIDAS = value;
  }

  String _showDIETA = '';
  String get showDIETA => _showDIETA;
  set showDIETA(String value) {
    _showDIETA = value;
  }

  List<String> _prefCHOCOLATElist = [];
  List<String> get prefCHOCOLATElist => _prefCHOCOLATElist;
  set prefCHOCOLATElist(List<String> value) {
    _prefCHOCOLATElist = value;
  }

  void addToPrefCHOCOLATElist(String value) {
    prefCHOCOLATElist.add(value);
  }

  void removeFromPrefCHOCOLATElist(String value) {
    prefCHOCOLATElist.remove(value);
  }

  void removeAtIndexFromPrefCHOCOLATElist(int index) {
    prefCHOCOLATElist.removeAt(index);
  }

  void updatePrefCHOCOLATElistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    prefCHOCOLATElist[index] = updateFn(_prefCHOCOLATElist[index]);
  }

  void insertAtIndexInPrefCHOCOLATElist(int index, String value) {
    prefCHOCOLATElist.insert(index, value);
  }

  String _fraseCHOCOLATE = '';
  String get fraseCHOCOLATE => _fraseCHOCOLATE;
  set fraseCHOCOLATE(String value) {
    _fraseCHOCOLATE = value;
  }

  String _dietaPRONTA = '';
  String get dietaPRONTA => _dietaPRONTA;
  set dietaPRONTA(String value) {
    _dietaPRONTA = value;
  }

  double _stateTDEEinter = 0.0;
  double get stateTDEEinter => _stateTDEEinter;
  set stateTDEEinter(double value) {
    _stateTDEEinter = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
