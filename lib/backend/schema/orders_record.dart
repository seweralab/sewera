import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'orders_record.g.dart';

abstract class OrdersRecord
    implements Built<OrdersRecord, OrdersRecordBuilder> {
  static Serializer<OrdersRecord> get serializer => _$ordersRecordSerializer;

  String? get status;

  int? get cost;

  String? get comment;

  BuiltList<String>? get details;

  DocumentReference? get client;

  @BuiltValueField(wireName: 'date_until')
  bool? get dateUntil;

  String? get payment;

  String? get addr;

  BuiltList<String>? get photos;

  String? get quiz;

  String? get date;

  String? get servicename;

  int? get cashback;

  int? get discount;

  @BuiltValueField(wireName: 'order_date')
  DateTime? get orderDate;

  String? get description;

  String? get deadline;

  @BuiltValueField(wireName: 'why_cancel')
  String? get whyCancel;

  DocumentReference? get service;

  @BuiltValueField(wireName: 'cachback_select')
  String? get cachbackSelect;

  @BuiltValueField(wireName: 'cachback_used')
  int? get cachbackUsed;

  @BuiltValueField(wireName: 'changed_fields')
  BuiltList<String>? get changedFields;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OrdersRecordBuilder builder) => builder
    ..status = ''
    ..cost = 0
    ..comment = ''
    ..details = ListBuilder()
    ..dateUntil = false
    ..payment = ''
    ..addr = ''
    ..photos = ListBuilder()
    ..quiz = ''
    ..date = ''
    ..servicename = ''
    ..cashback = 0
    ..discount = 0
    ..description = ''
    ..deadline = ''
    ..whyCancel = ''
    ..cachbackSelect = ''
    ..cachbackUsed = 0
    ..changedFields = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OrdersRecord._();
  factory OrdersRecord([void Function(OrdersRecordBuilder) updates]) =
      _$OrdersRecord;

  static OrdersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
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
  final firestoreData = serializers.toFirestore(
    OrdersRecord.serializer,
    OrdersRecord(
      (o) => o
        ..status = status
        ..cost = cost
        ..comment = comment
        ..details = null
        ..client = client
        ..dateUntil = dateUntil
        ..payment = payment
        ..addr = addr
        ..photos = null
        ..quiz = quiz
        ..date = date
        ..servicename = servicename
        ..cashback = cashback
        ..discount = discount
        ..orderDate = orderDate
        ..description = description
        ..deadline = deadline
        ..whyCancel = whyCancel
        ..service = service
        ..cachbackSelect = cachbackSelect
        ..cachbackUsed = cachbackUsed
        ..changedFields = null,
    ),
  );

  return firestoreData;
}
