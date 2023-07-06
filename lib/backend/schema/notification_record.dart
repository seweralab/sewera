import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "viewed" field.
  bool? _viewed;
  bool get viewed => _viewed ?? false;
  bool hasViewed() => _viewed != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _text = snapshotData['text'] as String?;
    _viewed = snapshotData['viewed'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('notification')
          : FirebaseFirestore.instance.collectionGroup('notification');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('notification').doc();

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  DateTime? date,
  String? title,
  String? text,
  bool? viewed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'title': title,
      'text': text,
      'viewed': viewed,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.title == e2?.title &&
        e1?.text == e2?.text &&
        e1?.viewed == e2?.viewed;
  }

  @override
  int hash(NotificationRecord? e) =>
      const ListEquality().hash([e?.date, e?.title, e?.text, e?.viewed]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
