// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ServicesRecord> _$servicesRecordSerializer =
    new _$ServicesRecordSerializer();

class _$ServicesRecordSerializer
    implements StructuredSerializer<ServicesRecord> {
  @override
  final Iterable<Type> types = const [ServicesRecord, _$ServicesRecord];
  @override
  final String wireName = 'ServicesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ServicesRecord object,
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
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.order;
    if (value != null) {
      result
        ..add('order')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.popular;
    if (value != null) {
      result
        ..add('popular')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.cashback;
    if (value != null) {
      result
        ..add('cashback')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.img;
    if (value != null) {
      result
        ..add('img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(RowyImgStruct)])));
    }
    value = object.synonims;
    if (value != null) {
      result
        ..add('synonims')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  ServicesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServicesRecordBuilder();

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
        case 'category':
          result.category.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'order':
          result.order = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'popular':
          result.popular = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'cashback':
          result.cashback = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'img':
          result.img.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(RowyImgStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'synonims':
          result.synonims.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
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

class _$ServicesRecord extends ServicesRecord {
  @override
  final String? title;
  @override
  final BuiltList<String>? category;
  @override
  final int? order;
  @override
  final bool? popular;
  @override
  final int? cashback;
  @override
  final BuiltList<RowyImgStruct>? img;
  @override
  final BuiltList<String>? synonims;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ServicesRecord([void Function(ServicesRecordBuilder)? updates]) =>
      (new ServicesRecordBuilder()..update(updates))._build();

  _$ServicesRecord._(
      {this.title,
      this.category,
      this.order,
      this.popular,
      this.cashback,
      this.img,
      this.synonims,
      this.ffRef})
      : super._();

  @override
  ServicesRecord rebuild(void Function(ServicesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServicesRecordBuilder toBuilder() =>
      new ServicesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServicesRecord &&
        title == other.title &&
        category == other.category &&
        order == other.order &&
        popular == other.popular &&
        cashback == other.cashback &&
        img == other.img &&
        synonims == other.synonims &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, order.hashCode);
    _$hash = $jc(_$hash, popular.hashCode);
    _$hash = $jc(_$hash, cashback.hashCode);
    _$hash = $jc(_$hash, img.hashCode);
    _$hash = $jc(_$hash, synonims.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServicesRecord')
          ..add('title', title)
          ..add('category', category)
          ..add('order', order)
          ..add('popular', popular)
          ..add('cashback', cashback)
          ..add('img', img)
          ..add('synonims', synonims)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ServicesRecordBuilder
    implements Builder<ServicesRecord, ServicesRecordBuilder> {
  _$ServicesRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<String>? _category;
  ListBuilder<String> get category =>
      _$this._category ??= new ListBuilder<String>();
  set category(ListBuilder<String>? category) => _$this._category = category;

  int? _order;
  int? get order => _$this._order;
  set order(int? order) => _$this._order = order;

  bool? _popular;
  bool? get popular => _$this._popular;
  set popular(bool? popular) => _$this._popular = popular;

  int? _cashback;
  int? get cashback => _$this._cashback;
  set cashback(int? cashback) => _$this._cashback = cashback;

  ListBuilder<RowyImgStruct>? _img;
  ListBuilder<RowyImgStruct> get img =>
      _$this._img ??= new ListBuilder<RowyImgStruct>();
  set img(ListBuilder<RowyImgStruct>? img) => _$this._img = img;

  ListBuilder<String>? _synonims;
  ListBuilder<String> get synonims =>
      _$this._synonims ??= new ListBuilder<String>();
  set synonims(ListBuilder<String>? synonims) => _$this._synonims = synonims;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ServicesRecordBuilder() {
    ServicesRecord._initializeBuilder(this);
  }

  ServicesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _category = $v.category?.toBuilder();
      _order = $v.order;
      _popular = $v.popular;
      _cashback = $v.cashback;
      _img = $v.img?.toBuilder();
      _synonims = $v.synonims?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServicesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServicesRecord;
  }

  @override
  void update(void Function(ServicesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServicesRecord build() => _build();

  _$ServicesRecord _build() {
    _$ServicesRecord _$result;
    try {
      _$result = _$v ??
          new _$ServicesRecord._(
              title: title,
              category: _category?.build(),
              order: order,
              popular: popular,
              cashback: cashback,
              img: _img?.build(),
              synonims: _synonims?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'category';
        _category?.build();

        _$failedField = 'img';
        _img?.build();
        _$failedField = 'synonims';
        _synonims?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServicesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
