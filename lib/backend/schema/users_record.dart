import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  DocumentReference? get orders;

  int? get cashback;

  String? get surname;

  String? get patronymic;

  String? get birthday;

  @BuiltValueField(wireName: 'md_name')
  String? get mdName;

  @BuiltValueField(wireName: 'md_type')
  String? get mdType;

  String? get addr;

  LatLng? get coords;

  @BuiltValueField(wireName: 'md_septic')
  String? get mdSeptic;

  @BuiltValueField(wireName: 'md_area')
  String? get mdArea;

  @BuiltValueField(wireName: 'md_photos')
  BuiltList<String>? get mdPhotos;

  String? get photo;

  bool? get push;

  bool? get sms;

  @BuiltValueField(wireName: 'email_notifications')
  bool? get emailNotifications;

  @BuiltValueField(wireName: 'no_orders')
  bool? get noOrders;

  @BuiltValueField(wireName: 'new_notification')
  bool? get newNotification;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..cashback = 0
    ..surname = ''
    ..patronymic = ''
    ..birthday = ''
    ..mdName = ''
    ..mdType = ''
    ..addr = ''
    ..mdSeptic = ''
    ..mdArea = ''
    ..mdPhotos = ListBuilder()
    ..photo = ''
    ..push = false
    ..sms = false
    ..emailNotifications = false
    ..noOrders = false
    ..newNotification = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DocumentReference? orders,
  int? cashback,
  String? surname,
  String? patronymic,
  String? birthday,
  String? mdName,
  String? mdType,
  String? addr,
  LatLng? coords,
  String? mdSeptic,
  String? mdArea,
  String? photo,
  bool? push,
  bool? sms,
  bool? emailNotifications,
  bool? noOrders,
  bool? newNotification,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..orders = orders
        ..cashback = cashback
        ..surname = surname
        ..patronymic = patronymic
        ..birthday = birthday
        ..mdName = mdName
        ..mdType = mdType
        ..addr = addr
        ..coords = coords
        ..mdSeptic = mdSeptic
        ..mdArea = mdArea
        ..mdPhotos = null
        ..photo = photo
        ..push = push
        ..sms = sms
        ..emailNotifications = emailNotifications
        ..noOrders = noOrders
        ..newNotification = newNotification,
    ),
  );

  return firestoreData;
}
