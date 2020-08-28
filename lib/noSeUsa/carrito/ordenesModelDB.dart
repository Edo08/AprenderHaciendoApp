/* import 'package:cloud_firestore/cloud_firestore.dart';

class OrdernesModelDB {
  static const TRANSACTIONCODE = "transactionCode";
  //static const FECHA = "fecha";
  static const CART = "cart";
  static const TOTAL = "total";
  static const UID = "uid";
  static const FECHA = "fecha";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  int _transactionCode;
  double _total;
  String _uid;
  String _status;
  int _createdAt;
  Timestamp _fecha;

//  getters
  Timestamp get fecha => _fecha;
  int get transactionCode => _transactionCode;
  double get total => _total;
  String get uid => _uid;
  String get status => _status;
  int get createdAt => _createdAt;

  // public variable
  List cart;

  OrdernesModelDB.fromSnapshot(DocumentSnapshot snapshot) {
    _transactionCode = snapshot.data[TRANSACTIONCODE];
    _fecha = snapshot.data[FECHA];
    _total = snapshot.data[TOTAL];
    _uid = snapshot.data[UID];
    cart = snapshot.data[CART];
    _status = snapshot.data[STATUS];
    _createdAt = snapshot.data[CREATED_AT];
  }

  /* Timestamp _getfecha() {
     var _fecha = Timestamp.now();
    return _fecha;
  } */
}
 */