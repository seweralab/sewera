import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicesRecord extends FirestoreRecord {
  ServicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "category" field.
  List<String>? _category;
  List<String> get category => _category ?? const [];
  bool hasCategory() => _category != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "popular" field.
  bool? _popular;
  bool get popular => _popular ?? false;
  bool hasPopular() => _popular != null;

  // "cashback" field.
  int? _cashback;
  int get cashback => _cashback ?? 0;
  bool hasCashback() => _cashback != null;

  // "img" field.
  List<RowyImgStruct>? _img;
  List<RowyImgStruct> get img => _img ?? const [];
  bool hasImg() => _img != null;

  // "synonims" field.
  List<String>? _synonims;
  List<String> get synonims => _synonims ?? const [];
  bool hasSynonims() => _synonims != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _category = getDataList(snapshotData['category']);
    _order = snapshotData['order'] as int?;
    _popular = snapshotData['popular'] as bool?;
    _cashback = snapshotData['cashback'] as int?;
    _img = getStructList(
      snapshotData['img'],
      RowyImgStruct.fromMap,
    );
    _synonims = getDataList(snapshotData['synonims']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('services');

  static Stream<ServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicesRecord.fromSnapshot(s));

  static Future<ServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicesRecord.fromSnapshot(s));

  static ServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicesRecord._(reference, mapFromFirestore(data));

  static ServicesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ServicesRecord.getDocumentFromData(
        {
          'title': snapshot.data['title'],
          'category': safeGet(
            () => snapshot.data['category'].toList(),
          ),
          'order': snapshot.data['order']?.round(),
          'popular': snapshot.data['popular'],
          'cashback': snapshot.data['cashback']?.round(),
          'img': safeGet(
            () => (snapshot.data['img'] as Iterable)
                .map(
                  (data) => createRowyImgStruct(
                    lastModifiedTS:
                        (data as Map<String, dynamic>)['lastModifiedTS']
                            ?.round(),
                    downloadURL: (data as Map<String, dynamic>)['downloadURL'],
                    name: (data as Map<String, dynamic>)['name'],
                    ref: (data as Map<String, dynamic>)['ref'],
                    type: (data as Map<String, dynamic>)['type'],
                    create: true,
                    clearUnsetFields: false,
                  ).toMap(),
                )
                .toList(),
          ),
          'synonims': safeGet(
            () => snapshot.data['synonims'].toList(),
          ),
        },
        ServicesRecord.collection.doc(snapshot.objectID),
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

  @override
  String toString() =>
      'ServicesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createServicesRecordData({
  String? title,
  int? order,
  bool? popular,
  int? cashback,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'order': order,
      'popular': popular,
      'cashback': cashback,
    }.withoutNulls,
  );

  return firestoreData;
}
