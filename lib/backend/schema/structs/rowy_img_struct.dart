// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RowyImgStruct extends FFFirebaseStruct {
  RowyImgStruct({
    int? lastModifiedTS,
    String? downloadURL,
    String? name,
    String? ref,
    String? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lastModifiedTS = lastModifiedTS,
        _downloadURL = downloadURL,
        _name = name,
        _ref = ref,
        _type = type,
        super(firestoreUtilData);

  // "lastModifiedTS" field.
  int? _lastModifiedTS;
  int get lastModifiedTS => _lastModifiedTS ?? 0;
  set lastModifiedTS(int? val) => _lastModifiedTS = val;
  void incrementLastModifiedTS(int amount) =>
      _lastModifiedTS = lastModifiedTS + amount;
  bool hasLastModifiedTS() => _lastModifiedTS != null;

  // "downloadURL" field.
  String? _downloadURL;
  String get downloadURL => _downloadURL ?? '';
  set downloadURL(String? val) => _downloadURL = val;
  bool hasDownloadURL() => _downloadURL != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "ref" field.
  String? _ref;
  String get ref => _ref ?? '';
  set ref(String? val) => _ref = val;
  bool hasRef() => _ref != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  static RowyImgStruct fromMap(Map<String, dynamic> data) => RowyImgStruct(
        lastModifiedTS: castToType<int>(data['lastModifiedTS']),
        downloadURL: data['downloadURL'] as String?,
        name: data['name'] as String?,
        ref: data['ref'] as String?,
        type: data['type'] as String?,
      );

  static RowyImgStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? RowyImgStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'lastModifiedTS': _lastModifiedTS,
        'downloadURL': _downloadURL,
        'name': _name,
        'ref': _ref,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lastModifiedTS': serializeParam(
          _lastModifiedTS,
          ParamType.int,
        ),
        'downloadURL': serializeParam(
          _downloadURL,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'ref': serializeParam(
          _ref,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static RowyImgStruct fromSerializableMap(Map<String, dynamic> data) =>
      RowyImgStruct(
        lastModifiedTS: deserializeParam(
          data['lastModifiedTS'],
          ParamType.int,
          false,
        ),
        downloadURL: deserializeParam(
          data['downloadURL'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        ref: deserializeParam(
          data['ref'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RowyImgStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RowyImgStruct &&
        lastModifiedTS == other.lastModifiedTS &&
        downloadURL == other.downloadURL &&
        name == other.name &&
        ref == other.ref &&
        type == other.type;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([lastModifiedTS, downloadURL, name, ref, type]);
}

RowyImgStruct createRowyImgStruct({
  int? lastModifiedTS,
  String? downloadURL,
  String? name,
  String? ref,
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RowyImgStruct(
      lastModifiedTS: lastModifiedTS,
      downloadURL: downloadURL,
      name: name,
      ref: ref,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RowyImgStruct? updateRowyImgStruct(
  RowyImgStruct? rowyImg, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    rowyImg
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRowyImgStructData(
  Map<String, dynamic> firestoreData,
  RowyImgStruct? rowyImg,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (rowyImg == null) {
    return;
  }
  if (rowyImg.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && rowyImg.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final rowyImgData = getRowyImgFirestoreData(rowyImg, forFieldValue);
  final nestedData = rowyImgData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = rowyImg.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRowyImgFirestoreData(
  RowyImgStruct? rowyImg, [
  bool forFieldValue = false,
]) {
  if (rowyImg == null) {
    return {};
  }
  final firestoreData = mapToFirestore(rowyImg.toMap());

  // Add any Firestore field values
  rowyImg.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRowyImgListFirestoreData(
  List<RowyImgStruct>? rowyImgs,
) =>
    rowyImgs?.map((e) => getRowyImgFirestoreData(e, true)).toList() ?? [];
