import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'services_record.g.dart';

abstract class ServicesRecord
    implements Built<ServicesRecord, ServicesRecordBuilder> {
  static Serializer<ServicesRecord> get serializer =>
      _$servicesRecordSerializer;

  String? get title;

  BuiltList<String>? get category;

  int? get order;

  bool? get popular;

  int? get cashback;

  BuiltList<RowyImgStruct>? get img;

  BuiltList<String>? get synonims;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ServicesRecordBuilder builder) => builder
    ..title = ''
    ..category = ListBuilder()
    ..order = 0
    ..popular = false
    ..cashback = 0
    ..img = ListBuilder()
    ..synonims = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('services');

  static Stream<ServicesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ServicesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static ServicesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ServicesRecord(
        (c) => c
          ..title = snapshot.data['title']
          ..category = safeGet(() => ListBuilder(snapshot.data['category']))
          ..order = snapshot.data['order']?.round()
          ..popular = snapshot.data['popular']
          ..cashback = snapshot.data['cashback']?.round()
          ..img = safeGet(() => ListBuilder(
              snapshot.data['img'].map((data) => createRowyImgStruct(
                    lastModifiedTS:
                        (data as Map<String, dynamic>)['lastModifiedTS']
                            ?.round(),
                    downloadURL: (data as Map<String, dynamic>)['downloadURL'],
                    name: (data as Map<String, dynamic>)['name'],
                    ref: (data as Map<String, dynamic>)['ref'],
                    type: (data as Map<String, dynamic>)['type'],
                    create: true,
                    clearUnsetFields: false,
                  ).toBuilder())))
          ..synonims = safeGet(() => ListBuilder(snapshot.data['synonims']))
          ..ffRef = ServicesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ServicesRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'services',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ServicesRecord._();
  factory ServicesRecord([void Function(ServicesRecordBuilder) updates]) =
      _$ServicesRecord;

  static ServicesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createServicesRecordData({
  String? title,
  int? order,
  bool? popular,
  int? cashback,
}) {
  final firestoreData = serializers.toFirestore(
    ServicesRecord.serializer,
    ServicesRecord(
      (s) => s
        ..title = title
        ..category = null
        ..order = order
        ..popular = popular
        ..cashback = cashback
        ..img = null
        ..synonims = null,
    ),
  );

  return firestoreData;
}
