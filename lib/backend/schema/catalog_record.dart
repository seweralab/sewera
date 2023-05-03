import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'catalog_record.g.dart';

abstract class CatalogRecord
    implements Built<CatalogRecord, CatalogRecordBuilder> {
  static Serializer<CatalogRecord> get serializer => _$catalogRecordSerializer;

  String? get title;

  BuiltList<RowyImgStruct>? get icon;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CatalogRecordBuilder builder) => builder
    ..title = ''
    ..icon = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('catalog');

  static Stream<CatalogRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CatalogRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CatalogRecord._();
  factory CatalogRecord([void Function(CatalogRecordBuilder) updates]) =
      _$CatalogRecord;

  static CatalogRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCatalogRecordData({
  String? title,
}) {
  final firestoreData = serializers.toFirestore(
    CatalogRecord.serializer,
    CatalogRecord(
      (c) => c
        ..title = title
        ..icon = null,
    ),
  );

  return firestoreData;
}
