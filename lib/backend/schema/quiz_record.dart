import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizRecord extends FirestoreRecord {
  QuizRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "alternative" field.
  bool? _alternative;
  bool get alternative => _alternative ?? false;
  bool hasAlternative() => _alternative != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "input" field.
  String? _input;
  String get input => _input ?? '';
  bool hasInput() => _input != null;

  // "options" field.
  String? _options;
  String get options => _options ?? '';
  bool hasOptions() => _options != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _type = snapshotData['type'] as String?;
    _alternative = snapshotData['alternative'] as bool?;
    _order = snapshotData['order'] as int?;
    _input = snapshotData['input'] as String?;
    _options = snapshotData['options'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('quiz')
          : FirebaseFirestore.instance.collectionGroup('quiz');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('quiz').doc();

  static Stream<QuizRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizRecord.fromSnapshot(s));

  static Future<QuizRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizRecord.fromSnapshot(s));

  static QuizRecord fromSnapshot(DocumentSnapshot snapshot) => QuizRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createQuizRecordData({
  String? title,
  String? type,
  bool? alternative,
  int? order,
  String? input,
  String? options,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'type': type,
      'alternative': alternative,
      'order': order,
      'input': input,
      'options': options,
    }.withoutNulls,
  );

  return firestoreData;
}
