import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'rowy_img_struct.g.dart';

abstract class RowyImgStruct
    implements Built<RowyImgStruct, RowyImgStructBuilder> {
  static Serializer<RowyImgStruct> get serializer => _$rowyImgStructSerializer;

  int? get lastModifiedTS;

  String? get downloadURL;

  String? get name;

  String? get ref;

  String? get type;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(RowyImgStructBuilder builder) => builder
    ..lastModifiedTS = 0
    ..downloadURL = ''
    ..name = ''
    ..ref = ''
    ..type = ''
    ..firestoreUtilData = FirestoreUtilData();

  RowyImgStruct._();
  factory RowyImgStruct([void Function(RowyImgStructBuilder) updates]) =
      _$RowyImgStruct;
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
      (r) => r
        ..lastModifiedTS = lastModifiedTS
        ..downloadURL = downloadURL
        ..name = name
        ..ref = ref
        ..type = type
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

RowyImgStruct? updateRowyImgStruct(
  RowyImgStruct? rowyImg, {
  bool clearUnsetFields = true,
}) =>
    rowyImg != null
        ? (rowyImg.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

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

  return;
}

Map<String, dynamic> getRowyImgFirestoreData(
  RowyImgStruct? rowyImg, [
  bool forFieldValue = false,
]) {
  if (rowyImg == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(RowyImgStruct.serializer, rowyImg);

  // Add any Firestore field values
  rowyImg.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRowyImgListFirestoreData(
  List<RowyImgStruct>? rowyImgs,
) =>
    rowyImgs?.map((r) => getRowyImgFirestoreData(r, true)).toList() ?? [];
