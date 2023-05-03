// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orders;
    if (value != null) {
      result
        ..add('orders')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.cashback;
    if (value != null) {
      result
        ..add('cashback')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.surname;
    if (value != null) {
      result
        ..add('surname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.patronymic;
    if (value != null) {
      result
        ..add('patronymic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.birthday;
    if (value != null) {
      result
        ..add('birthday')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mdName;
    if (value != null) {
      result
        ..add('md_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mdType;
    if (value != null) {
      result
        ..add('md_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.addr;
    if (value != null) {
      result
        ..add('addr')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.coords;
    if (value != null) {
      result
        ..add('coords')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.mdSeptic;
    if (value != null) {
      result
        ..add('md_septic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mdArea;
    if (value != null) {
      result
        ..add('md_area')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mdPhotos;
    if (value != null) {
      result
        ..add('md_photos')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.photo;
    if (value != null) {
      result
        ..add('photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.push;
    if (value != null) {
      result
        ..add('push')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.sms;
    if (value != null) {
      result
        ..add('sms')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.emailNotifications;
    if (value != null) {
      result
        ..add('email_notifications')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.noOrders;
    if (value != null) {
      result
        ..add('no_orders')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.newNotification;
    if (value != null) {
      result
        ..add('new_notification')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'orders':
          result.orders = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'cashback':
          result.cashback = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'surname':
          result.surname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'patronymic':
          result.patronymic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'birthday':
          result.birthday = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'md_name':
          result.mdName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'md_type':
          result.mdType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'addr':
          result.addr = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'coords':
          result.coords = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'md_septic':
          result.mdSeptic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'md_area':
          result.mdArea = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'md_photos':
          result.mdPhotos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'photo':
          result.photo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'push':
          result.push = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'sms':
          result.sms = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'email_notifications':
          result.emailNotifications = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'no_orders':
          result.noOrders = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'new_notification':
          result.newNotification = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final DocumentReference<Object?>? orders;
  @override
  final int? cashback;
  @override
  final String? surname;
  @override
  final String? patronymic;
  @override
  final String? birthday;
  @override
  final String? mdName;
  @override
  final String? mdType;
  @override
  final String? addr;
  @override
  final LatLng? coords;
  @override
  final String? mdSeptic;
  @override
  final String? mdArea;
  @override
  final BuiltList<String>? mdPhotos;
  @override
  final String? photo;
  @override
  final bool? push;
  @override
  final bool? sms;
  @override
  final bool? emailNotifications;
  @override
  final bool? noOrders;
  @override
  final bool? newNotification;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.orders,
      this.cashback,
      this.surname,
      this.patronymic,
      this.birthday,
      this.mdName,
      this.mdType,
      this.addr,
      this.coords,
      this.mdSeptic,
      this.mdArea,
      this.mdPhotos,
      this.photo,
      this.push,
      this.sms,
      this.emailNotifications,
      this.noOrders,
      this.newNotification,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        orders == other.orders &&
        cashback == other.cashback &&
        surname == other.surname &&
        patronymic == other.patronymic &&
        birthday == other.birthday &&
        mdName == other.mdName &&
        mdType == other.mdType &&
        addr == other.addr &&
        coords == other.coords &&
        mdSeptic == other.mdSeptic &&
        mdArea == other.mdArea &&
        mdPhotos == other.mdPhotos &&
        photo == other.photo &&
        push == other.push &&
        sms == other.sms &&
        emailNotifications == other.emailNotifications &&
        noOrders == other.noOrders &&
        newNotification == other.newNotification &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, orders.hashCode);
    _$hash = $jc(_$hash, cashback.hashCode);
    _$hash = $jc(_$hash, surname.hashCode);
    _$hash = $jc(_$hash, patronymic.hashCode);
    _$hash = $jc(_$hash, birthday.hashCode);
    _$hash = $jc(_$hash, mdName.hashCode);
    _$hash = $jc(_$hash, mdType.hashCode);
    _$hash = $jc(_$hash, addr.hashCode);
    _$hash = $jc(_$hash, coords.hashCode);
    _$hash = $jc(_$hash, mdSeptic.hashCode);
    _$hash = $jc(_$hash, mdArea.hashCode);
    _$hash = $jc(_$hash, mdPhotos.hashCode);
    _$hash = $jc(_$hash, photo.hashCode);
    _$hash = $jc(_$hash, push.hashCode);
    _$hash = $jc(_$hash, sms.hashCode);
    _$hash = $jc(_$hash, emailNotifications.hashCode);
    _$hash = $jc(_$hash, noOrders.hashCode);
    _$hash = $jc(_$hash, newNotification.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('orders', orders)
          ..add('cashback', cashback)
          ..add('surname', surname)
          ..add('patronymic', patronymic)
          ..add('birthday', birthday)
          ..add('mdName', mdName)
          ..add('mdType', mdType)
          ..add('addr', addr)
          ..add('coords', coords)
          ..add('mdSeptic', mdSeptic)
          ..add('mdArea', mdArea)
          ..add('mdPhotos', mdPhotos)
          ..add('photo', photo)
          ..add('push', push)
          ..add('sms', sms)
          ..add('emailNotifications', emailNotifications)
          ..add('noOrders', noOrders)
          ..add('newNotification', newNotification)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  DocumentReference<Object?>? _orders;
  DocumentReference<Object?>? get orders => _$this._orders;
  set orders(DocumentReference<Object?>? orders) => _$this._orders = orders;

  int? _cashback;
  int? get cashback => _$this._cashback;
  set cashback(int? cashback) => _$this._cashback = cashback;

  String? _surname;
  String? get surname => _$this._surname;
  set surname(String? surname) => _$this._surname = surname;

  String? _patronymic;
  String? get patronymic => _$this._patronymic;
  set patronymic(String? patronymic) => _$this._patronymic = patronymic;

  String? _birthday;
  String? get birthday => _$this._birthday;
  set birthday(String? birthday) => _$this._birthday = birthday;

  String? _mdName;
  String? get mdName => _$this._mdName;
  set mdName(String? mdName) => _$this._mdName = mdName;

  String? _mdType;
  String? get mdType => _$this._mdType;
  set mdType(String? mdType) => _$this._mdType = mdType;

  String? _addr;
  String? get addr => _$this._addr;
  set addr(String? addr) => _$this._addr = addr;

  LatLng? _coords;
  LatLng? get coords => _$this._coords;
  set coords(LatLng? coords) => _$this._coords = coords;

  String? _mdSeptic;
  String? get mdSeptic => _$this._mdSeptic;
  set mdSeptic(String? mdSeptic) => _$this._mdSeptic = mdSeptic;

  String? _mdArea;
  String? get mdArea => _$this._mdArea;
  set mdArea(String? mdArea) => _$this._mdArea = mdArea;

  ListBuilder<String>? _mdPhotos;
  ListBuilder<String> get mdPhotos =>
      _$this._mdPhotos ??= new ListBuilder<String>();
  set mdPhotos(ListBuilder<String>? mdPhotos) => _$this._mdPhotos = mdPhotos;

  String? _photo;
  String? get photo => _$this._photo;
  set photo(String? photo) => _$this._photo = photo;

  bool? _push;
  bool? get push => _$this._push;
  set push(bool? push) => _$this._push = push;

  bool? _sms;
  bool? get sms => _$this._sms;
  set sms(bool? sms) => _$this._sms = sms;

  bool? _emailNotifications;
  bool? get emailNotifications => _$this._emailNotifications;
  set emailNotifications(bool? emailNotifications) =>
      _$this._emailNotifications = emailNotifications;

  bool? _noOrders;
  bool? get noOrders => _$this._noOrders;
  set noOrders(bool? noOrders) => _$this._noOrders = noOrders;

  bool? _newNotification;
  bool? get newNotification => _$this._newNotification;
  set newNotification(bool? newNotification) =>
      _$this._newNotification = newNotification;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _orders = $v.orders;
      _cashback = $v.cashback;
      _surname = $v.surname;
      _patronymic = $v.patronymic;
      _birthday = $v.birthday;
      _mdName = $v.mdName;
      _mdType = $v.mdType;
      _addr = $v.addr;
      _coords = $v.coords;
      _mdSeptic = $v.mdSeptic;
      _mdArea = $v.mdArea;
      _mdPhotos = $v.mdPhotos?.toBuilder();
      _photo = $v.photo;
      _push = $v.push;
      _sms = $v.sms;
      _emailNotifications = $v.emailNotifications;
      _noOrders = $v.noOrders;
      _newNotification = $v.newNotification;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              orders: orders,
              cashback: cashback,
              surname: surname,
              patronymic: patronymic,
              birthday: birthday,
              mdName: mdName,
              mdType: mdType,
              addr: addr,
              coords: coords,
              mdSeptic: mdSeptic,
              mdArea: mdArea,
              mdPhotos: _mdPhotos?.build(),
              photo: photo,
              push: push,
              sms: sms,
              emailNotifications: emailNotifications,
              noOrders: noOrders,
              newNotification: newNotification,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'mdPhotos';
        _mdPhotos?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
