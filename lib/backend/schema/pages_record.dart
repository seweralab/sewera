import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pages_record.g.dart';

abstract class PagesRecord implements Built<PagesRecord, PagesRecordBuilder> {
  static Serializer<PagesRecord> get serializer => _$pagesRecordSerializer;

  String? get content;

  @BuiltValueField(wireName: 'Page')
  String? get page;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PagesRecordBuilder builder) => builder
    ..content = ''
    ..page = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pages');

  static Stream<PagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PagesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PagesRecord._();
  factory PagesRecord([void Function(PagesRecordBuilder) updates]) =
      _$PagesRecord;

  static PagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPagesRecordData({
  String? content,
  String? page,
}) {
  final firestoreData = serializers.toFirestore(
    PagesRecord.serializer,
    PagesRecord(
      (p) => p
        ..content = content
        ..page = page,
    ),
  );

  return firestoreData;
}
