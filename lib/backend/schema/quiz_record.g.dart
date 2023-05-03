// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuizRecord> _$quizRecordSerializer = new _$QuizRecordSerializer();

class _$QuizRecordSerializer implements StructuredSerializer<QuizRecord> {
  @override
  final Iterable<Type> types = const [QuizRecord, _$QuizRecord];
  @override
  final String wireName = 'QuizRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, QuizRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.alternative;
    if (value != null) {
      result
        ..add('alternative')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.order;
    if (value != null) {
      result
        ..add('order')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.input;
    if (value != null) {
      result
        ..add('input')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.options;
    if (value != null) {
      result
        ..add('options')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  QuizRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuizRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'alternative':
          result.alternative = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'order':
          result.order = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'input':
          result.input = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'options':
          result.options = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$QuizRecord extends QuizRecord {
  @override
  final String? title;
  @override
  final String? type;
  @override
  final bool? alternative;
  @override
  final int? order;
  @override
  final String? input;
  @override
  final String? options;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$QuizRecord([void Function(QuizRecordBuilder)? updates]) =>
      (new QuizRecordBuilder()..update(updates))._build();

  _$QuizRecord._(
      {this.title,
      this.type,
      this.alternative,
      this.order,
      this.input,
      this.options,
      this.ffRef})
      : super._();

  @override
  QuizRecord rebuild(void Function(QuizRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuizRecordBuilder toBuilder() => new QuizRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuizRecord &&
        title == other.title &&
        type == other.type &&
        alternative == other.alternative &&
        order == other.order &&
        input == other.input &&
        options == other.options &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, alternative.hashCode);
    _$hash = $jc(_$hash, order.hashCode);
    _$hash = $jc(_$hash, input.hashCode);
    _$hash = $jc(_$hash, options.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QuizRecord')
          ..add('title', title)
          ..add('type', type)
          ..add('alternative', alternative)
          ..add('order', order)
          ..add('input', input)
          ..add('options', options)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class QuizRecordBuilder implements Builder<QuizRecord, QuizRecordBuilder> {
  _$QuizRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  bool? _alternative;
  bool? get alternative => _$this._alternative;
  set alternative(bool? alternative) => _$this._alternative = alternative;

  int? _order;
  int? get order => _$this._order;
  set order(int? order) => _$this._order = order;

  String? _input;
  String? get input => _$this._input;
  set input(String? input) => _$this._input = input;

  String? _options;
  String? get options => _$this._options;
  set options(String? options) => _$this._options = options;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  QuizRecordBuilder() {
    QuizRecord._initializeBuilder(this);
  }

  QuizRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _type = $v.type;
      _alternative = $v.alternative;
      _order = $v.order;
      _input = $v.input;
      _options = $v.options;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuizRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuizRecord;
  }

  @override
  void update(void Function(QuizRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QuizRecord build() => _build();

  _$QuizRecord _build() {
    final _$result = _$v ??
        new _$QuizRecord._(
            title: title,
            type: type,
            alternative: alternative,
            order: order,
            input: input,
            options: options,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
