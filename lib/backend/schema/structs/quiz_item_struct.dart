// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizItemStruct extends FFFirebaseStruct {
  QuizItemStruct({
    String? name,
    String? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _value = value,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;
  bool hasValue() => _value != null;

  static QuizItemStruct fromMap(Map<String, dynamic> data) => QuizItemStruct(
        name: data['name'] as String?,
        value: data['value'] as String?,
      );

  static QuizItemStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? QuizItemStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuizItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuizItemStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuizItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuizItemStruct &&
        name == other.name &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([name, value]);
}

QuizItemStruct createQuizItemStruct({
  String? name,
  String? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuizItemStruct(
      name: name,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuizItemStruct? updateQuizItemStruct(
  QuizItemStruct? quizItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    quizItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuizItemStructData(
  Map<String, dynamic> firestoreData,
  QuizItemStruct? quizItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (quizItem == null) {
    return;
  }
  if (quizItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && quizItem.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final quizItemData = getQuizItemFirestoreData(quizItem, forFieldValue);
  final nestedData = quizItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = quizItem.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuizItemFirestoreData(
  QuizItemStruct? quizItem, [
  bool forFieldValue = false,
]) {
  if (quizItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(quizItem.toMap());

  // Add any Firestore field values
  quizItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuizItemListFirestoreData(
  List<QuizItemStruct>? quizItems,
) =>
    quizItems?.map((e) => getQuizItemFirestoreData(e, true)).toList() ?? [];
