import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CatalogRecord extends FirestoreRecord {
  CatalogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "icon" field.
  List<RowyImgStruct>? _icon;
  List<RowyImgStruct> get icon => _icon ?? const [];
  bool hasIcon() => _icon != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _icon = getStructList(
      snapshotData['icon'],
      RowyImgStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('catalog');

  static Stream<CatalogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CatalogRecord.fromSnapshot(s));

  static Future<CatalogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CatalogRecord.fromSnapshot(s));

  static CatalogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CatalogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CatalogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CatalogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CatalogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CatalogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCatalogRecordData({
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}
