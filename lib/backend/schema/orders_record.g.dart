// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrdersRecord> _$ordersRecordSerializer =
    new _$OrdersRecordSerializer();

class _$OrdersRecordSerializer implements StructuredSerializer<OrdersRecord> {
  @override
  final Iterable<Type> types = const [OrdersRecord, _$OrdersRecord];
  @override
  final String wireName = 'OrdersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, OrdersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cost;
    if (value != null) {
      result
        ..add('cost')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.details;
    if (value != null) {
      result
        ..add('details')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.client;
    if (value != null) {
      result
        ..add('client')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.dateUntil;
    if (value != null) {
      result
        ..add('date_until')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.payment;
    if (value != null) {
      result
        ..add('payment')
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
    value = object.photos;
    if (value != null) {
      result
        ..add('photos')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.quiz;
    if (value != null) {
      result
        ..add('quiz')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.servicename;
    if (value != null) {
      result
        ..add('servicename')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cashback;
    if (value != null) {
      result
        ..add('cashback')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.discount;
    if (value != null) {
      result
        ..add('discount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.orderDate;
    if (value != null) {
      result
        ..add('order_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deadline;
    if (value != null) {
      result
        ..add('deadline')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.whyCancel;
    if (value != null) {
      result
        ..add('why_cancel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.service;
    if (value != null) {
      result
        ..add('service')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.cachbackSelect;
    if (value != null) {
      result
        ..add('cachback_select')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cachbackUsed;
    if (value != null) {
      result
        ..add('cachback_used')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.changedFields;
    if (value != null) {
      result
        ..add('changed_fields')
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
  OrdersRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrdersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cost':
          result.cost = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'details':
          result.details.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'client':
          result.client = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'date_until':
          result.dateUntil = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'payment':
          result.payment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'addr':
          result.addr = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photos':
          result.photos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'quiz':
          result.quiz = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'servicename':
          result.servicename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cashback':
          result.cashback = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'discount':
          result.discount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'order_date':
          result.orderDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'deadline':
          result.deadline = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'why_cancel':
          result.whyCancel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'service':
          result.service = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'cachback_select':
          result.cachbackSelect = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cachback_used':
          result.cachbackUsed = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'changed_fields':
          result.changedFields.replace(serializers.deserialize(value,
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

class _$OrdersRecord extends OrdersRecord {
  @override
  final String? status;
  @override
  final int? cost;
  @override
  final String? comment;
  @override
  final BuiltList<String>? details;
  @override
  final DocumentReference<Object?>? client;
  @override
  final bool? dateUntil;
  @override
  final String? payment;
  @override
  final String? addr;
  @override
  final BuiltList<String>? photos;
  @override
  final String? quiz;
  @override
  final String? date;
  @override
  final String? servicename;
  @override
  final int? cashback;
  @override
  final int? discount;
  @override
  final DateTime? orderDate;
  @override
  final String? description;
  @override
  final String? deadline;
  @override
  final String? whyCancel;
  @override
  final DocumentReference<Object?>? service;
  @override
  final String? cachbackSelect;
  @override
  final int? cachbackUsed;
  @override
  final BuiltList<String>? changedFields;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrdersRecord([void Function(OrdersRecordBuilder)? updates]) =>
      (new OrdersRecordBuilder()..update(updates))._build();

  _$OrdersRecord._(
      {this.status,
      this.cost,
      this.comment,
      this.details,
      this.client,
      this.dateUntil,
      this.payment,
      this.addr,
      this.photos,
      this.quiz,
      this.date,
      this.servicename,
      this.cashback,
      this.discount,
      this.orderDate,
      this.description,
      this.deadline,
      this.whyCancel,
      this.service,
      this.cachbackSelect,
      this.cachbackUsed,
      this.changedFields,
      this.ffRef})
      : super._();

  @override
  OrdersRecord rebuild(void Function(OrdersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrdersRecordBuilder toBuilder() => new OrdersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrdersRecord &&
        status == other.status &&
        cost == other.cost &&
        comment == other.comment &&
        details == other.details &&
        client == other.client &&
        dateUntil == other.dateUntil &&
        payment == other.payment &&
        addr == other.addr &&
        photos == other.photos &&
        quiz == other.quiz &&
        date == other.date &&
        servicename == other.servicename &&
        cashback == other.cashback &&
        discount == other.discount &&
        orderDate == other.orderDate &&
        description == other.description &&
        deadline == other.deadline &&
        whyCancel == other.whyCancel &&
        service == other.service &&
        cachbackSelect == other.cachbackSelect &&
        cachbackUsed == other.cachbackUsed &&
        changedFields == other.changedFields &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, cost.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jc(_$hash, client.hashCode);
    _$hash = $jc(_$hash, dateUntil.hashCode);
    _$hash = $jc(_$hash, payment.hashCode);
    _$hash = $jc(_$hash, addr.hashCode);
    _$hash = $jc(_$hash, photos.hashCode);
    _$hash = $jc(_$hash, quiz.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, servicename.hashCode);
    _$hash = $jc(_$hash, cashback.hashCode);
    _$hash = $jc(_$hash, discount.hashCode);
    _$hash = $jc(_$hash, orderDate.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, deadline.hashCode);
    _$hash = $jc(_$hash, whyCancel.hashCode);
    _$hash = $jc(_$hash, service.hashCode);
    _$hash = $jc(_$hash, cachbackSelect.hashCode);
    _$hash = $jc(_$hash, cachbackUsed.hashCode);
    _$hash = $jc(_$hash, changedFields.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrdersRecord')
          ..add('status', status)
          ..add('cost', cost)
          ..add('comment', comment)
          ..add('details', details)
          ..add('client', client)
          ..add('dateUntil', dateUntil)
          ..add('payment', payment)
          ..add('addr', addr)
          ..add('photos', photos)
          ..add('quiz', quiz)
          ..add('date', date)
          ..add('servicename', servicename)
          ..add('cashback', cashback)
          ..add('discount', discount)
          ..add('orderDate', orderDate)
          ..add('description', description)
          ..add('deadline', deadline)
          ..add('whyCancel', whyCancel)
          ..add('service', service)
          ..add('cachbackSelect', cachbackSelect)
          ..add('cachbackUsed', cachbackUsed)
          ..add('changedFields', changedFields)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrdersRecordBuilder
    implements Builder<OrdersRecord, OrdersRecordBuilder> {
  _$OrdersRecord? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _cost;
  int? get cost => _$this._cost;
  set cost(int? cost) => _$this._cost = cost;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  ListBuilder<String>? _details;
  ListBuilder<String> get details =>
      _$this._details ??= new ListBuilder<String>();
  set details(ListBuilder<String>? details) => _$this._details = details;

  DocumentReference<Object?>? _client;
  DocumentReference<Object?>? get client => _$this._client;
  set client(DocumentReference<Object?>? client) => _$this._client = client;

  bool? _dateUntil;
  bool? get dateUntil => _$this._dateUntil;
  set dateUntil(bool? dateUntil) => _$this._dateUntil = dateUntil;

  String? _payment;
  String? get payment => _$this._payment;
  set payment(String? payment) => _$this._payment = payment;

  String? _addr;
  String? get addr => _$this._addr;
  set addr(String? addr) => _$this._addr = addr;

  ListBuilder<String>? _photos;
  ListBuilder<String> get photos =>
      _$this._photos ??= new ListBuilder<String>();
  set photos(ListBuilder<String>? photos) => _$this._photos = photos;

  String? _quiz;
  String? get quiz => _$this._quiz;
  set quiz(String? quiz) => _$this._quiz = quiz;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _servicename;
  String? get servicename => _$this._servicename;
  set servicename(String? servicename) => _$this._servicename = servicename;

  int? _cashback;
  int? get cashback => _$this._cashback;
  set cashback(int? cashback) => _$this._cashback = cashback;

  int? _discount;
  int? get discount => _$this._discount;
  set discount(int? discount) => _$this._discount = discount;

  DateTime? _orderDate;
  DateTime? get orderDate => _$this._orderDate;
  set orderDate(DateTime? orderDate) => _$this._orderDate = orderDate;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _deadline;
  String? get deadline => _$this._deadline;
  set deadline(String? deadline) => _$this._deadline = deadline;

  String? _whyCancel;
  String? get whyCancel => _$this._whyCancel;
  set whyCancel(String? whyCancel) => _$this._whyCancel = whyCancel;

  DocumentReference<Object?>? _service;
  DocumentReference<Object?>? get service => _$this._service;
  set service(DocumentReference<Object?>? service) => _$this._service = service;

  String? _cachbackSelect;
  String? get cachbackSelect => _$this._cachbackSelect;
  set cachbackSelect(String? cachbackSelect) =>
      _$this._cachbackSelect = cachbackSelect;

  int? _cachbackUsed;
  int? get cachbackUsed => _$this._cachbackUsed;
  set cachbackUsed(int? cachbackUsed) => _$this._cachbackUsed = cachbackUsed;

  ListBuilder<String>? _changedFields;
  ListBuilder<String> get changedFields =>
      _$this._changedFields ??= new ListBuilder<String>();
  set changedFields(ListBuilder<String>? changedFields) =>
      _$this._changedFields = changedFields;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrdersRecordBuilder() {
    OrdersRecord._initializeBuilder(this);
  }

  OrdersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _cost = $v.cost;
      _comment = $v.comment;
      _details = $v.details?.toBuilder();
      _client = $v.client;
      _dateUntil = $v.dateUntil;
      _payment = $v.payment;
      _addr = $v.addr;
      _photos = $v.photos?.toBuilder();
      _quiz = $v.quiz;
      _date = $v.date;
      _servicename = $v.servicename;
      _cashback = $v.cashback;
      _discount = $v.discount;
      _orderDate = $v.orderDate;
      _description = $v.description;
      _deadline = $v.deadline;
      _whyCancel = $v.whyCancel;
      _service = $v.service;
      _cachbackSelect = $v.cachbackSelect;
      _cachbackUsed = $v.cachbackUsed;
      _changedFields = $v.changedFields?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrdersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrdersRecord;
  }

  @override
  void update(void Function(OrdersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrdersRecord build() => _build();

  _$OrdersRecord _build() {
    _$OrdersRecord _$result;
    try {
      _$result = _$v ??
          new _$OrdersRecord._(
              status: status,
              cost: cost,
              comment: comment,
              details: _details?.build(),
              client: client,
              dateUntil: dateUntil,
              payment: payment,
              addr: addr,
              photos: _photos?.build(),
              quiz: quiz,
              date: date,
              servicename: servicename,
              cashback: cashback,
              discount: discount,
              orderDate: orderDate,
              description: description,
              deadline: deadline,
              whyCancel: whyCancel,
              service: service,
              cachbackSelect: cachbackSelect,
              cachbackUsed: cachbackUsed,
              changedFields: _changedFields?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'details';
        _details?.build();

        _$failedField = 'photos';
        _photos?.build();

        _$failedField = 'changedFields';
        _changedFields?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OrdersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
