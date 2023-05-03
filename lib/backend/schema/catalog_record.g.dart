// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CatalogRecord> _$catalogRecordSerializer =
    new _$CatalogRecordSerializer();

class _$CatalogRecordSerializer implements StructuredSerializer<CatalogRecord> {
  @override
  final Iterable<Type> types = const [CatalogRecord, _$CatalogRecord];
  @override
  final String wireName = 'CatalogRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CatalogRecord object,
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
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(RowyImgStruct)])));
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
  CatalogRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CatalogRecordBuilder();

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
        case 'icon':
          result.icon.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(RowyImgStruct)]))!
              as BuiltList<Object?>);
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

class _$CatalogRecord extends CatalogRecord {
  @override
  final String? title;
  @override
  final BuiltList<RowyImgStruct>? icon;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CatalogRecord([void Function(CatalogRecordBuilder)? updates]) =>
      (new CatalogRecordBuilder()..update(updates))._build();

  _$CatalogRecord._({this.title, this.icon, this.ffRef}) : super._();

  @override
  CatalogRecord rebuild(void Function(CatalogRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CatalogRecordBuilder toBuilder() => new CatalogRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CatalogRecord &&
        title == other.title &&
        icon == other.icon &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CatalogRecord')
          ..add('title', title)
          ..add('icon', icon)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CatalogRecordBuilder
    implements Builder<CatalogRecord, CatalogRecordBuilder> {
  _$CatalogRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<RowyImgStruct>? _icon;
  ListBuilder<RowyImgStruct> get icon =>
      _$this._icon ??= new ListBuilder<RowyImgStruct>();
  set icon(ListBuilder<RowyImgStruct>? icon) => _$this._icon = icon;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CatalogRecordBuilder() {
    CatalogRecord._initializeBuilder(this);
  }

  CatalogRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _icon = $v.icon?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CatalogRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CatalogRecord;
  }

  @override
  void update(void Function(CatalogRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CatalogRecord build() => _build();

  _$CatalogRecord _build() {
    _$CatalogRecord _$result;
    try {
      _$result = _$v ??
          new _$CatalogRecord._(
              title: title, icon: _icon?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'icon';
        _icon?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CatalogRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
