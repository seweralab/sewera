import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "cost" field.
  int? _cost;
  int get cost => _cost ?? 0;
  bool hasCost() => _cost != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "details" field.
  List<String>? _details;
  List<String> get details => _details ?? const [];
  bool hasDetails() => _details != null;

  // "client" field.
  DocumentReference? _client;
  DocumentReference? get client => _client;
  bool hasClient() => _client != null;

  // "date_until" field.
  bool? _dateUntil;
  bool get dateUntil => _dateUntil ?? false;
  bool hasDateUntil() => _dateUntil != null;

  // "payment" field.
  String? _payment;
  String get payment => _payment ?? '';
  bool hasPayment() => _payment != null;

  // "addr" field.
  String? _addr;
  String get addr => _addr ?? '';
  bool hasAddr() => _addr != null;

  // "photos" field.
  List<String>? _photos;
  List<String> get photos => _photos ?? const [];
  bool hasPhotos() => _photos != null;

  // "quiz" field.
  String? _quiz;
  String get quiz => _quiz ?? '';
  bool hasQuiz() => _quiz != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "servicename" field.
  String? _servicename;
  String get servicename => _servicename ?? '';
  bool hasServicename() => _servicename != null;

  // "cashback" field.
  int? _cashback;
  int get cashback => _cashback ?? 0;
  bool hasCashback() => _cashback != null;

  // "discount" field.
  int? _discount;
  int get discount => _discount ?? 0;
  bool hasDiscount() => _discount != null;

  // "order_date" field.
  DateTime? _orderDate;
  DateTime? get orderDate => _orderDate;
  bool hasOrderDate() => _orderDate != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "deadline" field.
  String? _deadline;
  String get deadline => _deadline ?? '';
  bool hasDeadline() => _deadline != null;

  // "why_cancel" field.
  String? _whyCancel;
  String get whyCancel => _whyCancel ?? '';
  bool hasWhyCancel() => _whyCancel != null;

  // "service" field.
  DocumentReference? _service;
  DocumentReference? get service => _service;
  bool hasService() => _service != null;

  // "cachback_select" field.
  String? _cachbackSelect;
  String get cachbackSelect => _cachbackSelect ?? '';
  bool hasCachbackSelect() => _cachbackSelect != null;

  // "cachback_used" field.
  int? _cachbackUsed;
  int get cachbackUsed => _cachbackUsed ?? 0;
  bool hasCachbackUsed() => _cachbackUsed != null;

  // "changed_fields" field.
  List<String>? _changedFields;
  List<String> get changedFields => _changedFields ?? const [];
  bool hasChangedFields() => _changedFields != null;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _cost = snapshotData['cost'] as int?;
    _comment = snapshotData['comment'] as String?;
    _details = getDataList(snapshotData['details']);
    _client = snapshotData['client'] as DocumentReference?;
    _dateUntil = snapshotData['date_until'] as bool?;
    _payment = snapshotData['payment'] as String?;
    _addr = snapshotData['addr'] as String?;
    _photos = getDataList(snapshotData['photos']);
    _quiz = snapshotData['quiz'] as String?;
    _date = snapshotData['date'] as String?;
    _servicename = snapshotData['servicename'] as String?;
    _cashback = snapshotData['cashback'] as int?;
    _discount = snapshotData['discount'] as int?;
    _orderDate = snapshotData['order_date'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _deadline = snapshotData['deadline'] as String?;
    _whyCancel = snapshotData['why_cancel'] as String?;
    _service = snapshotData['service'] as DocumentReference?;
    _cachbackSelect = snapshotData['cachback_select'] as String?;
    _cachbackUsed = snapshotData['cachback_used'] as int?;
    _changedFields = getDataList(snapshotData['changed_fields']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createOrdersRecordData({
  String? status,
  int? cost,
  String? comment,
  DocumentReference? client,
  bool? dateUntil,
  String? payment,
  String? addr,
  String? quiz,
  String? date,
  String? servicename,
  int? cashback,
  int? discount,
  DateTime? orderDate,
  String? description,
  String? deadline,
  String? whyCancel,
  DocumentReference? service,
  String? cachbackSelect,
  int? cachbackUsed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'cost': cost,
      'comment': comment,
      'client': client,
      'date_until': dateUntil,
      'payment': payment,
      'addr': addr,
      'quiz': quiz,
      'date': date,
      'servicename': servicename,
      'cashback': cashback,
      'discount': discount,
      'order_date': orderDate,
      'description': description,
      'deadline': deadline,
      'why_cancel': whyCancel,
      'service': service,
      'cachback_select': cachbackSelect,
      'cachback_used': cachbackUsed,
    }.withoutNulls,
  );

  return firestoreData;
}
