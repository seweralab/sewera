import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'quiz_item_struct.g.dart';

abstract class QuizItemStruct
    implements Built<QuizItemStruct, QuizItemStructBuilder> {
  static Serializer<QuizItemStruct> get serializer =>
      _$quizItemStructSerializer;

  String? get name;

  String? get value;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(QuizItemStructBuilder builder) => builder
    ..name = ''
    ..value = ''
    ..firestoreUtilData = FirestoreUtilData();

  QuizItemStruct._();
  factory QuizItemStruct([void Function(QuizItemStructBuilder) updates]) =
      _$QuizItemStruct;
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
      (q) => q
        ..name = name
        ..value = value
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

QuizItemStruct? updateQuizItemStruct(
  QuizItemStruct? quizItem, {
  bool clearUnsetFields = true,
}) =>
    quizItem != null
        ? (quizItem.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

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

  return;
}

Map<String, dynamic> getQuizItemFirestoreData(
  QuizItemStruct? quizItem, [
  bool forFieldValue = false,
]) {
  if (quizItem == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(QuizItemStruct.serializer, quizItem);

  // Add any Firestore field values
  quizItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuizItemListFirestoreData(
  List<QuizItemStruct>? quizItems,
) =>
    quizItems?.map((q) => getQuizItemFirestoreData(q, true)).toList() ?? [];
