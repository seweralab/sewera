import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PagesRecord extends FirestoreRecord {
  PagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "Page" field.
  String? _page;
  String get page => _page ?? '';
  bool hasPage() => _page != null;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _page = snapshotData['Page'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pages');

  static Stream<PagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PagesRecord.fromSnapshot(s));

  static Future<PagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PagesRecord.fromSnapshot(s));

  static PagesRecord fromSnapshot(DocumentSnapshot snapshot) => PagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPagesRecordData({
  String? content,
  String? page,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'Page': page,
    }.withoutNulls,
  );

  return firestoreData;
}
