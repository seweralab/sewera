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

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

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

  // "orders" field.
  DocumentReference? _orders;
  DocumentReference? get orders => _orders;
  bool hasOrders() => _orders != null;

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  bool hasSurname() => _surname != null;

  // "patronymic" field.
  String? _patronymic;
  String get patronymic => _patronymic ?? '';
  bool hasPatronymic() => _patronymic != null;

  // "birthday" field.
  String? _birthday;
  String get birthday => _birthday ?? '';
  bool hasBirthday() => _birthday != null;

  // "md_name" field.
  String? _mdName;
  String get mdName => _mdName ?? '';
  bool hasMdName() => _mdName != null;

  // "md_type" field.
  String? _mdType;
  String get mdType => _mdType ?? '';
  bool hasMdType() => _mdType != null;

  // "addr" field.
  String? _addr;
  String get addr => _addr ?? '';
  bool hasAddr() => _addr != null;

  // "md_septic" field.
  String? _mdSeptic;
  String get mdSeptic => _mdSeptic ?? '';
  bool hasMdSeptic() => _mdSeptic != null;

  // "md_area" field.
  String? _mdArea;
  String get mdArea => _mdArea ?? '';
  bool hasMdArea() => _mdArea != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "push" field.
  bool? _push;
  bool get push => _push ?? false;
  bool hasPush() => _push != null;

  // "sms" field.
  bool? _sms;
  bool get sms => _sms ?? false;
  bool hasSms() => _sms != null;

  // "email_notifications" field.
  bool? _emailNotifications;
  bool get emailNotifications => _emailNotifications ?? false;
  bool hasEmailNotifications() => _emailNotifications != null;

  // "no_orders" field.
  bool? _noOrders;
  bool get noOrders => _noOrders ?? false;
  bool hasNoOrders() => _noOrders != null;

  // "new_notification" field.
  bool? _newNotification;
  bool get newNotification => _newNotification ?? false;
  bool hasNewNotification() => _newNotification != null;

  // "new_notifications" field.
  List<String>? _newNotifications;
  List<String> get newNotifications => _newNotifications ?? const [];
  bool hasNewNotifications() => _newNotifications != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _orders = snapshotData['orders'] as DocumentReference?;
    _surname = snapshotData['surname'] as String?;
    _patronymic = snapshotData['patronymic'] as String?;
    _birthday = snapshotData['birthday'] as String?;
    _mdName = snapshotData['md_name'] as String?;
    _mdType = snapshotData['md_type'] as String?;
    _addr = snapshotData['addr'] as String?;
    _mdSeptic = snapshotData['md_septic'] as String?;
    _mdArea = snapshotData['md_area'] as String?;
    _photo = snapshotData['photo'] as String?;
    _push = snapshotData['push'] as bool?;
    _sms = snapshotData['sms'] as bool?;
    _emailNotifications = snapshotData['email_notifications'] as bool?;
    _noOrders = snapshotData['no_orders'] as bool?;
    _newNotification = snapshotData['new_notification'] as bool?;
    _newNotifications = getDataList(snapshotData['new_notifications']);
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
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DocumentReference? orders,
  String? surname,
  String? patronymic,
  String? birthday,
  String? mdName,
  String? mdType,
  String? addr,
  String? mdSeptic,
  String? mdArea,
  String? photo,
  bool? push,
  bool? sms,
  bool? emailNotifications,
  bool? noOrders,
  bool? newNotification,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'orders': orders,
      'surname': surname,
      'patronymic': patronymic,
      'birthday': birthday,
      'md_name': mdName,
      'md_type': mdType,
      'addr': addr,
      'md_septic': mdSeptic,
      'md_area': mdArea,
      'photo': photo,
      'push': push,
      'sms': sms,
      'email_notifications': emailNotifications,
      'no_orders': noOrders,
      'new_notification': newNotification,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.orders == e2?.orders &&
        e1?.surname == e2?.surname &&
        e1?.patronymic == e2?.patronymic &&
        e1?.birthday == e2?.birthday &&
        e1?.mdName == e2?.mdName &&
        e1?.mdType == e2?.mdType &&
        e1?.addr == e2?.addr &&
        e1?.mdSeptic == e2?.mdSeptic &&
        e1?.mdArea == e2?.mdArea &&
        e1?.photo == e2?.photo &&
        e1?.push == e2?.push &&
        e1?.sms == e2?.sms &&
        e1?.emailNotifications == e2?.emailNotifications &&
        e1?.noOrders == e2?.noOrders &&
        e1?.newNotification == e2?.newNotification &&
        listEquality.equals(e1?.newNotifications, e2?.newNotifications);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.orders,
        e?.surname,
        e?.patronymic,
        e?.birthday,
        e?.mdName,
        e?.mdType,
        e?.addr,
        e?.mdSeptic,
        e?.mdArea,
        e?.photo,
        e?.push,
        e?.sms,
        e?.emailNotifications,
        e?.noOrders,
        e?.newNotification,
        e?.newNotifications
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
