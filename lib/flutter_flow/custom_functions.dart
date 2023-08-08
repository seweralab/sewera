import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String defineAllServicesText() {
  return 'Все услуги';
}

List<String> quizGetRadioDates() {
  final monthes = [
    '',
    'января',
    'февраля',
    'марта',
    'апреля',
    'мая',
    'июня',
    'июля',
    'августа',
    'сентября',
    'октября',
    'ноября',
    'декабря'
  ];
  final today = DateTime.now();
  final today_day = today.day;
  final today_month = today.month;
  final tomorrow = today.add(Duration(days: 1));
  final tomorrow_day = tomorrow.day;
  final tomorrow_month = tomorrow.month;
  final week = today.add(Duration(days: 7));
  final week_day = week.day;
  final week_month = week.month;
  return [
    'В течение недели, до $week_day ${monthes[week_month]}',
    'Сегодня, $today_day ${monthes[today_month]}',
    'Завтра, $tomorrow_day ${monthes[tomorrow_month]}',
    'Выберу день в календаре',
  ];
}

dynamic updateQuizFormValues(
  int index,
  String value,
  dynamic form,
) {
  return form;
}

int totaldecr(int total) {
  int returnval = total - 1;
  return returnval;
}

bool isFillData(
  String? data,
  String type,
  List<String>? selects,
  String? input,
) {
  print(input);
  if (type == 'multiselect') {
    if (selects != null &&
        selects.contains('input') &&
        input != null &&
        input == '') {
      print('is fill data return false;');
      print('data');
      print(data);
      return false;
    }
  }
  if (data != 'Пусто' && data != '') {
    return true;
  } else {
    return false;
  }
}

bool log(List<String>? state) {
  print('state');
  print(state);
  return true;
}

String combineCheckboxes(
  List<String> checkboxes,
  String tf,
) {
  if (tf != '') {
    checkboxes.add(tf);
  }
  return checkboxes.join(',');
}

List<String> propImagesList(List<String> listimg) {
  List<String> clearList = [];
  for (var img in listimg) {
    if (img.isNotEmpty) {
      clearList.add(img);
    }
  }
  if (clearList.length < 6) {
    clearList.add('');
  }
  return clearList;
}

List<String> isActiveStatuses() {
  var list = ['Активный'];
  return list;
}

String orderStatusColorText(String status) {
  String color = '#000000';
  return color;
}

List<String>? delImageByIndex(
  List<String> photos,
  int index,
) {
  photos.removeAt(index);
  return photos;
}

bool clearListImgCount(List<String> images) {
  List<String> clearList = [];
  for (var img in images) {
    if (img.isNotEmpty) {
      clearList.add(img);
    }
  }
  // clearList.add('');
  // print()
  return clearList.length > 0;
}

List<String> propImagesListClear(List<String> images) {
  List<String> clearList = [];
  for (var img in images) {
    if (img.isNotEmpty) {
      clearList.add(img);
    }
  }
  return clearList;
}

dynamic orderQuizUpdate(
  dynamic quizJSON,
  String currentQuizName,
  String value,
  DocumentReference currentQuizRef,
) {
  // parse json from quizJSON update it if currentQuizName exist and add if not exist

  print(quizJSON);
  // Map<String, dynamic> jsonMap = jsonDecode(quizJSON);
  // List<dynamic> quizList = jsonMap['quiz'];
  quizJSON[currentQuizName] = '{"value": $value, "ref": $currentQuizRef}';
  // bool quizExist = false;
  // for (int i = 0; i < quizList.length; i++) {
  //   if (quizList[i]['name'] == currentQuizName) {
  //     quizList[i]['value'] = value;
  //     quizExist = true;
  //   }
  // }
  // if (!quizExist) {
  //   Map<String, dynamic> newQuiz = {
  //     'name': currentQuizName,
  //     'value': value,
  //   };
  //   quizList.add(newQuiz);
  // }
  // jsonMap['quiz'] = quizList;
  print(quizJSON);
  return jsonEncode(quizJSON);
}

List<String> addSelectsCustomInput(List<String> selects) {
  selects.add('input');
  return selects;
}

String newCustomFunction(
  String selectVal,
  String inputVal,
) {
  if (selectVal == 'input') {
    selectVal = inputVal;
  }
  return selectVal;
}

String defineInput() {
  return 'input';
}

String updateLocalValbyInputAndCheckboxes(
  List<String> selects,
  String input,
) {
  // loop selects and revome item with val inputs
  String localVal = '';
  if (selects != null && selects.isNotEmpty) {
    selects.forEach((element) {
      if (element != 'input') {
        if (localVal != '') {
          localVal = localVal + ',' + element;
        } else {
          localVal = element;
        }
      } else {
        if (input != '') {
          if (localVal != '') {
            localVal = localVal + ',' + input;
          } else {
            localVal = input;
          }
        }
      }
    });
  }
  return localVal;
}

List<dynamic> listQuizItems(String quizJSON) {
  // List<dynamic> listQuizItems = [];
  // Map<String, dynamic> listQuizItemsJSON = jsonDecode(quizJSON);
  // for (var element in listQuizItemsJSON) {
  //   print(element);
  // }
  // return listQuizItems;
  List<dynamic> listQuizItems = [];
  Map<String, dynamic> jsonObject = json.decode(quizJSON);
  for (final key in jsonObject.keys) {
    final value = json.decode(jsonObject[key]);
    value['name'] = key;
    // // print('Key: $key, Value: $value');
    // String title = value['title'];
    listQuizItems.add(json.encode(value));
    // listQuizItems.add('{"name": "{$key}", "value": "{$title}"}');
  }

  return listQuizItems;
  // listQuizItems.add(jsonEncode('{"title": "one", "value": "two"}'));
  // listQuizItems.add(jsonEncode('{"title": "one", "value": "two"}'));
  // Map<String, dynamic> listQuizItemsjson = jsonDecode(currentQuizItemsjson);
  // listQuizItemsjson.forEach((index, element) {
  //   listQuizItems.add('$index:$element');
  // });
}

bool inverseBool(bool boolVal) {
  return !boolVal;
}

String jsonMDecode(
  dynamic jsonval,
  String field,
) {
  print(jsonval);
  if (jsonval != null && jsonval != '') {
    var jsoned = json.decode(jsonval);
    return jsoned[field].replaceAll(',', ', ');
  } else {
    return '';
  }
}

List<String> orderCachbackOptions(
  int orderprice,
  int? ordercashback,
  int userbonuses,
) {
  List<String> items = [];
  if (orderprice > 0) {
    if (ordercashback == null || ordercashback == 0) {
      ordercashback = 3;
    }
    double mult = ordercashback / 100;
    double cachbackval = orderprice * mult;
    int intcashbackval = cachbackval.round();
    items.add('Получить $intcashbackval баллов');
  }
  if (userbonuses > 0) {
    items.add('Списать $userbonuses баллов');
  }
  return items;
}

Color colorNotification(String type) {
  // return custom colors
  switch (type) {
    case 'Успех':
      return Color.fromRGBO(208, 255, 161, 1.0);
    case 'Предупреждение':
      return Color.fromRGBO(255, 238, 131, 1.0);
    case 'Акция':
      return Color.fromRGBO(255, 187, 232, 1.0);
    default:
      return Color.fromRGBO(208, 255, 161, 1.0);
  }
}

String unformOrderStatus() {
  return 'Не оформлен';
}

Color borderErrorColor(bool error) {
  if (error) {
    return Color.fromRGBO(255, 179, 6, 1.0);
  } else {
    return Color.fromRGBO(255, 255, 255, 0.0);
  }
}

bool isSelectsInputErr(
  String selects,
  String input,
) {
  print(selects);
  bool boolval = false;
  if (input != '' || selects != 'input') {
    boolval = true;
  }
  return boolval;
}

bool isMultiselectsInputErr(
  List<String> selects,
  String input,
) {
  print(selects);
  bool boolval = false;
  if (input != '' || !selects.contains('input')) {
    boolval = true;
  }
  print(boolval);
  return boolval;
}

String inputFromUserFields(
  String inputname,
  String mdseptic,
  String mdarea,
  String mdtype,
  String quizJSON,
  String quizName,
) {
  print('inputFromUserFields');
  if (quizJSON != null && quizJSON != '') {
    print('inputFromUserFields quizJSON != null');
    print(quizJSON);
    print(quizName);
    Map<String, dynamic> jsonMap = json.decode(quizJSON);
    if (jsonMap[quizName] != null && jsonMap[quizName] != '') {
      print('inputFromUserFields jsonMap[quizName] != null');
      var vals = json.decode(jsonMap[quizName]);
      print(vals);
      if (vals['title'] != null) {
        print(vals['title']);
        return vals['title'];
      }
    }
  }
  var output = '';
  if (inputname != '') {
    switch (inputname) {
      case 'Септик':
        output = mdseptic;
        break;
      case 'Тип':
        output = mdtype;
        break;
      case 'Площадь':
        output = mdarea;
        break;
    }
  }
  return output;
}

String newCustomFunction2(
  String type,
  String inputval,
  String? localval,
) {
  if (type == 'input' &&
      inputval != '' &&
      (localval == null || localval == '')) {
    return inputval;
  } else {
    return localval ?? '';
  }
}

String calendar(DateTimeRange calendardate) {
  print(calendardate);
  return 'calendar';
}

String splitQuizDetails(
  String item,
  int index,
) {
  final splitted = item.split(':');
  var one = splitted[0];
  splitted.removeAt(0);
  var two = splitted.join(':');
  if (index == 0) {
    return one;
  } else {
    return two;
  }
  // return splitted[index];
}

List<String> cancelOrderCheckboxes() {
  var items = ['Дорого', 'Долго', 'Не устроила цена', 'Не хочу отвечать'];
  return items;
}

bool isCheckboxHaveInput(List<String>? items) {
  if (items != null && items.contains('input')) {
    return true;
  } else {
    return false;
  }
}

String combineCancelCheckboxes(
  List<String> checkboxes,
  String? input,
) {
  if (input != null && input != '' && checkboxes.contains('input')) {
    checkboxes.removeLast();
    checkboxes.add(input);
  }
  return checkboxes.join(',');
}

List<String> isFinishStatuses() {
  return ['Отменен', 'Выполнен'];
}

DocumentReference? jsonDecodeQuizRef(dynamic jsonval) {
  print(jsonval);
  if (jsonval != null && jsonval != '') {
    var jsoned = json.decode(jsonval);
    return jsoned['ref'];
  } else {
    return null;
  }
}

List<String>? setInitialCheckbox(
  String quizJSON,
  String quizName,
) {
  if (quizJSON == null || quizJSON == '') {
    return [];
  }
  Map<String, dynamic> jsonMap = json.decode(quizJSON);
  if (jsonMap[quizName] != null && jsonMap[quizName] != '') {
    var vals = json.decode(jsonMap[quizName]);
    if (vals['input'] != null && vals['input'] != 'false') {
      List<String> output = vals['title'].split(',');
      output.add('input');
      return output;
    } else {
      return vals['title'].split(',');
    }
  }
  return [];
}

String? setInitialRadioInput(
  String quizJSON,
  String quizName,
) {
  if (quizJSON == null || quizJSON == '') {
    return '';
  }
  Map<String, dynamic> jsonMap = json.decode(quizJSON);
  if (jsonMap[quizName] != null && jsonMap[quizName] != '') {
    var vals = json.decode(jsonMap[quizName]);
    if (vals['input'] != null && vals['input'] != 'false') {
      return vals['title'];
    } else {
      return '';
    }
  }
  return '';
}

String? setInitialCheckboxInput(
  String quizJSON,
  String quizName,
) {
  if (quizJSON == null || quizJSON == '') {
    return '';
  }
  Map<String, dynamic> jsonMap = json.decode(quizJSON);
  if (jsonMap[quizName] != null && jsonMap[quizName] != '') {
    var vals = json.decode(jsonMap[quizName]);
    print(vals);
    if (vals['input'] != null &&
        vals['input'] != 'false' &&
        vals['inputval'] != null &&
        vals['inputval'] != '') {
      return vals['inputval'];
    } else {
      return '';
    }
  }
  return '';
}

dynamic jsonEncodeQuiz(String item) {
  return jsonEncode(item);
}

String quizPage2updateLocalValRadio(
  String radio,
  String quizname,
  DocumentReference quizref,
  String? quizJSON,
  String? input,
) {
  print(quizJSON);
  if (quizJSON == null || quizJSON == '') {
    quizJSON = '{}';
    print('quiz is empty');
  }
  bool isInput = false;
  String val = '';
  if (radio == 'input' && input != null && input != '') {
    print('input');
    print(input);
    isInput = true;
    val = input;
  } else {
    print('radio');
    print(radio);
    val = radio;
  }
  Map<String, dynamic> jsonMap = json.decode(quizJSON);
  jsonMap[quizname] = '{"title":"$val","ref":"$quizref","input":"$isInput"}';
  print(jsonMap);
  print(quizJSON);
  return jsonEncode(jsonMap);
}

String quizPage2updateLocalValCheckbox(
  String quizJSON,
  String? input,
  List<String> checkbox,
  DocumentReference quizref,
  String quizname,
) {
  print(quizJSON);
  if (quizJSON == null || quizJSON == '') {
    quizJSON = '{}';
  }
  bool isInput = false;
  String val = '';
  Set<String> uniquecheckboxes = checkbox.toSet();
  if (uniquecheckboxes.contains('input') && input != null && input != '') {
    isInput = true;
    uniquecheckboxes.remove('input');
    uniquecheckboxes.add(input);
    val = uniquecheckboxes.join(',');
  } else {
    val = uniquecheckboxes.join(',');
  }
  Map<String, dynamic> jsonMap = json.decode(quizJSON);
  jsonMap[quizname] =
      '{"title":"$val","ref":"$quizref","input":"$isInput","inputval":"$input"}';
  return jsonEncode(jsonMap);
}

String quizPage2updateLocalValInput(
  String? quizJSON,
  String input,
  String quizname,
  DocumentReference quizref,
) {
  if (quizJSON == null || quizJSON == '') {
    quizJSON = '{}';
    print('quiz is empty');
  }
  Map<String, dynamic> jsonMap = json.decode(quizJSON);
  jsonMap[quizname] = '{"title":"$input","ref":"$quizref"}';
  return jsonEncode(jsonMap);
}

String? setInitialRadio(
  String quizJSON,
  String quizName,
) {
  if (quizJSON == null || quizJSON == '') {
    return '';
  }
  Map<String, dynamic> jsonMap = json.decode(quizJSON);
  if (jsonMap[quizName] != null && jsonMap[quizName] != '') {
    var vals = json.decode(jsonMap[quizName]);
    if (vals['input'] != null && vals['input'] != 'false') {
      print(vals);
      print(vals['input']);
      print('radio input');
      return 'input';
    } else {
      print('radio title');
      print(vals['title']);
      return vals['title'];
    }
  }
  return '';
}

int updateOldPrice(
  String cashbackradio,
  int? cachback,
  int? price,
) {
  double cashbackval;
  if (price != null) {
    if (cashbackradio.contains('Списать')) {
      if (cachback != null && cachback > 0) {
        int olprice = price - cachback;
        return olprice;
      } else {
        return 0;
      }
    } else {
      return 0;
    }
  } else {
    return 0;
  }
}

int cashBackUsed(
  String radio,
  int usercashback,
) {
  if (radio.contains('Списать')) {
    return usercashback;
  } else {
    return 0;
  }
}

int cashbackUserUser(
  String radio,
  int cashback,
  int addcashback,
) {
  if (radio.contains('Списать')) {
    return 0;
  } else {
    return cashback + addcashback;
  }
}

String calcOrderPrice(
  int cost,
  int cashback,
) {
  int orderprice = cost - cashback;
  return NumberFormat('# ###').format(orderprice);
}

Color? orderChangedColor(
  String field,
  List<String>? changedFields,
) {
  if (changedFields != null && changedFields.length > 0) {
    if (changedFields.contains(field)) {
      return Color.fromRGBO(255, 248, 205, 1.0);
    }
  }
}

bool isOrderQuizFieldChanged(
  List<String>? changedFields,
  String field,
) {
  if (changedFields != null && changedFields.length > 0) {
    if (changedFields.contains(field)) {
      return true;
    }
  }
  return false;
}

bool isRadioContainsValue(
  String item,
  String value,
) {
  if (item.contains(value)) {
    return true;
  } else {
    return false;
  }
}

int addcashback(
  int price,
  int? servicecashback,
) {
  if (servicecashback != null && servicecashback > 0) {
    return 2000;
  }
  return 300;
}

String? currentQuizRadioToAppState(
  String? quizJSON,
  String? quizName,
) {
  // print('currentQuizRadioToAppState');
  // print(quizJSON);
  // print(quizName);
  // return '';

  if (quizJSON == null || quizJSON == '') {
    return '';
  }
  Map<String, dynamic> jsonMap = json.decode(quizJSON);
  if (jsonMap[quizName] != null && jsonMap[quizName] != '') {
    var vals = json.decode(jsonMap[quizName]);
    if (vals['input'] != null && vals['input'] != 'false') {
      print(vals);
      print(vals['input']);
      print('radio input');
      return 'input';
    } else {
      print('radio title');
      print(vals['title']);
      return vals['title'];
    }
  }
  return '';
}

List<String> splitBy(
  String? options,
  String delimetr,
) {
  if (options != null) {
    return options.split(delimetr);
  } else {
    return [];
  }
}

Color? pincodeBorderErr(bool isErr) {
  if (isErr) {
    return Color.fromRGBO(235, 87, 87, 1);
  }
}

Color pincodeTextErrColor(bool isErr) {
  if (isErr) {
    return Color.fromRGBO(235, 87, 87, 1);
  } else {
    return Color.fromRGBO(64, 84, 96, 1);
  }
}

String? testCombineCheckboxes(List<String>? list) {
  if (list == null) {
    return null;
  }
  return list.join(',');
}
