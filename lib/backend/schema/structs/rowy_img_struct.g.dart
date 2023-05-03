// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rowy_img_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RowyImgStruct> _$rowyImgStructSerializer =
    new _$RowyImgStructSerializer();

class _$RowyImgStructSerializer implements StructuredSerializer<RowyImgStruct> {
  @override
  final Iterable<Type> types = const [RowyImgStruct, _$RowyImgStruct];
  @override
  final String wireName = 'RowyImgStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, RowyImgStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.lastModifiedTS;
    if (value != null) {
      result
        ..add('lastModifiedTS')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.downloadURL;
    if (value != null) {
      result
        ..add('downloadURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ref;
    if (value != null) {
      result
        ..add('ref')
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
    return result;
  }

  @override
  RowyImgStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RowyImgStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'lastModifiedTS':
          result.lastModifiedTS = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'downloadURL':
          result.downloadURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ref':
          result.ref = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
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

class _$RowyImgStruct extends RowyImgStruct {
  @override
  final int? lastModifiedTS;
  @override
  final String? downloadURL;
  @override
  final String? name;
  @override
  final String? ref;
  @override
  final String? type;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$RowyImgStruct([void Function(RowyImgStructBuilder)? updates]) =>
      (new RowyImgStructBuilder()..update(updates))._build();

  _$RowyImgStruct._(
      {this.lastModifiedTS,
      this.downloadURL,
      this.name,
      this.ref,
      this.type,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'RowyImgStruct', 'firestoreUtilData');
  }

  @override
  RowyImgStruct rebuild(void Function(RowyImgStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RowyImgStructBuilder toBuilder() => new RowyImgStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RowyImgStruct &&
        lastModifiedTS == other.lastModifiedTS &&
        downloadURL == other.downloadURL &&
        name == other.name &&
        ref == other.ref &&
        type == other.type &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, lastModifiedTS.hashCode);
    _$hash = $jc(_$hash, downloadURL.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RowyImgStruct')
          ..add('lastModifiedTS', lastModifiedTS)
          ..add('downloadURL', downloadURL)
          ..add('name', name)
          ..add('ref', ref)
          ..add('type', type)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class RowyImgStructBuilder
    implements Builder<RowyImgStruct, RowyImgStructBuilder> {
  _$RowyImgStruct? _$v;

  int? _lastModifiedTS;
  int? get lastModifiedTS => _$this._lastModifiedTS;
  set lastModifiedTS(int? lastModifiedTS) =>
      _$this._lastModifiedTS = lastModifiedTS;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  RowyImgStructBuilder() {
    RowyImgStruct._initializeBuilder(this);
  }

  RowyImgStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lastModifiedTS = $v.lastModifiedTS;
      _downloadURL = $v.downloadURL;
      _name = $v.name;
      _ref = $v.ref;
      _type = $v.type;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RowyImgStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RowyImgStruct;
  }

  @override
  void update(void Function(RowyImgStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RowyImgStruct build() => _build();

  _$RowyImgStruct _build() {
    final _$result = _$v ??
        new _$RowyImgStruct._(
            lastModifiedTS: lastModifiedTS,
            downloadURL: downloadURL,
            name: name,
            ref: ref,
            type: type,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'RowyImgStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
