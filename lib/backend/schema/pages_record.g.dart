// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pages_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PagesRecord> _$pagesRecordSerializer = new _$PagesRecordSerializer();

class _$PagesRecordSerializer implements StructuredSerializer<PagesRecord> {
  @override
  final Iterable<Type> types = const [PagesRecord, _$PagesRecord];
  @override
  final String wireName = 'PagesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PagesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.content;
    if (value != null) {
      result
        ..add('content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.page;
    if (value != null) {
      result
        ..add('Page')
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
  PagesRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Page':
          result.page = serializers.deserialize(value,
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

class _$PagesRecord extends PagesRecord {
  @override
  final String? content;
  @override
  final String? page;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PagesRecord([void Function(PagesRecordBuilder)? updates]) =>
      (new PagesRecordBuilder()..update(updates))._build();

  _$PagesRecord._({this.content, this.page, this.ffRef}) : super._();

  @override
  PagesRecord rebuild(void Function(PagesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PagesRecordBuilder toBuilder() => new PagesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PagesRecord &&
        content == other.content &&
        page == other.page &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PagesRecord')
          ..add('content', content)
          ..add('page', page)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PagesRecordBuilder implements Builder<PagesRecord, PagesRecordBuilder> {
  _$PagesRecord? _$v;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  String? _page;
  String? get page => _$this._page;
  set page(String? page) => _$this._page = page;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PagesRecordBuilder() {
    PagesRecord._initializeBuilder(this);
  }

  PagesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _content = $v.content;
      _page = $v.page;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PagesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PagesRecord;
  }

  @override
  void update(void Function(PagesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PagesRecord build() => _build();

  _$PagesRecord _build() {
    final _$result =
        _$v ?? new _$PagesRecord._(content: content, page: page, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
