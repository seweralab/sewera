import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'quiz_record.g.dart';

abstract class QuizRecord implements Built<QuizRecord, QuizRecordBuilder> {
  static Serializer<QuizRecord> get serializer => _$quizRecordSerializer;

  String? get title;

  String? get type;

  bool? get alternative;

  int? get order;

  String? get input;

  String? get options;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(QuizRecordBuilder builder) => builder
    ..title = ''
    ..type = ''
    ..alternative = false
    ..order = 0
    ..input = ''
    ..options = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('quiz')
          : FirebaseFirestore.instance.collectionGroup('quiz');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('quiz').doc();

  static Stream<QuizRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<QuizRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  QuizRecord._();
  factory QuizRecord([void Function(QuizRecordBuilder) updates]) = _$QuizRecord;

  static QuizRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createQuizRecordData({
  String? title,
  String? type,
  bool? alternative,
  int? order,
  String? input,
  String? options,
}) {
  final firestoreData = serializers.toFirestore(
    QuizRecord.serializer,
    QuizRecord(
      (q) => q
        ..title = title
        ..type = type
        ..alternative = alternative
        ..order = order
        ..input = input
        ..options = options,
    ),
  );

  return firestoreData;
}
