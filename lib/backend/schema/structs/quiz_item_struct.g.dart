// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_item_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuizItemStruct> _$quizItemStructSerializer =
    new _$QuizItemStructSerializer();

class _$QuizItemStructSerializer
    implements StructuredSerializer<QuizItemStruct> {
  @override
  final Iterable<Type> types = const [QuizItemStruct, _$QuizItemStruct];
  @override
  final String wireName = 'QuizItemStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, QuizItemStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.value;
    if (value != null) {
      result
        ..add('value')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  QuizItemStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuizItemStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$QuizItemStruct extends QuizItemStruct {
  @override
  final String? name;
  @override
  final String? value;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$QuizItemStruct([void Function(QuizItemStructBuilder)? updates]) =>
      (new QuizItemStructBuilder()..update(updates))._build();

  _$QuizItemStruct._({this.name, this.value, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'QuizItemStruct', 'firestoreUtilData');
  }

  @override
  QuizItemStruct rebuild(void Function(QuizItemStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuizItemStructBuilder toBuilder() =>
      new QuizItemStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuizItemStruct &&
        name == other.name &&
        value == other.value &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QuizItemStruct')
          ..add('name', name)
          ..add('value', value)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class QuizItemStructBuilder
    implements Builder<QuizItemStruct, QuizItemStructBuilder> {
  _$QuizItemStruct? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  QuizItemStructBuilder() {
    QuizItemStruct._initializeBuilder(this);
  }

  QuizItemStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _value = $v.value;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuizItemStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuizItemStruct;
  }

  @override
  void update(void Function(QuizItemStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QuizItemStruct build() => _build();

  _$QuizItemStruct _build() {
    final _$result = _$v ??
        new _$QuizItemStruct._(
            name: name,
            value: value,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'QuizItemStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
