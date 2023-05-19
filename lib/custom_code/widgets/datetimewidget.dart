// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class Datetimewidget extends StatefulWidget {
  const Datetimewidget({
    Key? key,
    this.width,
    this.height,
    required this.textf,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String textf;
  @override
  _DatetimewidgetState createState() => _DatetimewidgetState();
}

class _DatetimewidgetState extends State<Datetimewidget> {
  final today = DateUtils.dateOnly(DateTime.now());
  var newFormat = DateFormat("dd.MM.yy");
  // List<DateTime?> _dialogCalendarPickerValue = [
  //   DateTime.now(),
  //   DateTime.now(),
  // ];
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];

  // List<DateTime?> _rangeDatePickerWithActionButtonsWithValue = [
  //   DateTime.now(),
  //   DateTime.now().add(const Duration(days: 5)),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, //remove color to make it transpatrent
        child: Center(
          child: SizedBox(
            width: 375,
            child: ListView(
              children: <Widget>[
                // _buildCalendarDialogButton(),
                _buildDefaultSingleDatePickerWithValue(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    print(values);
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    // if (datePickerType == CalendarDatePicker2Type.multi) {
    //   valueText = values.isNotEmpty
    //       ? values
    //           .map((v) => v.toString().replaceAll('00:00:00.000', ''))
    //           .join(', ')
    //       : 'null';
    // } else if (datePickerType == CalendarDatePicker2Type.range) {
    //   if (values.isNotEmpty) {
    //     final startDate = values[0].toString().replaceAll('00:00:00.000', '');
    //     final endDate = values.length > 1
    //         ? values[1].toString().replaceAll('00:00:00.000', '')
    //         : 'null';
    //     valueText = '$startDate to $endDate';
    //   } else {
    //     return 'null';
    //   }
    // }

    return valueText;
  }

  Widget _buildDefaultSingleDatePickerWithValue() {
    final decoration = BoxDecoration(color: Colors.white);
    // FFAppState().currentQuizDeadline = newFormat.format(DateTime.now());
    final config = CalendarDatePicker2Config(
      selectedDayTextStyle: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      selectedDayHighlightColor: Color.fromRGBO(37, 211, 102, 1.0),
      weekdayLabels: ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'],
      weekdayLabelTextStyle: const TextStyle(
        color: Color.fromRGBO(16, 41, 56, 0.5),
        fontWeight: FontWeight.w500,
      ),
      firstDayOfWeek: 1,
      controlsHeight: 50,
      controlsTextStyle: const TextStyle(
        color: Color.fromRGBO(16, 41, 56, 0.5),
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      centerAlignModePicker: true,
      dayTextStyle: const TextStyle(
        color: Color.fromRGBO(16, 41, 56, 1.0),
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      disabledDayTextStyle: const TextStyle(
        color: Color.fromRGBO(16, 41, 56, 0.5),
        fontSize: 18,
      ),
      dayBuilder: ({
        required date,
        textStyle,
        decoration,
        isSelected,
        isDisabled,
        isToday,
      }) {
        Widget? dayWidget;
        return dayWidget;
      },
      selectableDayPredicate: (day) => !day
          .difference(DateTime.now().subtract(const Duration(days: 1)))
          .isNegative,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // const SizedBox(height: 10),
        // const Text('Single Date Picker (With default value)'),
        CalendarDatePicker2(
            config: config,
            value: _singleDatePickerValueWithDefaultValue,
            onValueChanged: (dates) {
              setState(() => _singleDatePickerValueWithDefaultValue = dates);
              print(_getValueText(
                config.calendarType,
                dates,
              ));
              FFAppState().currentQuizDeadline = _getValueText(
                config.calendarType,
                dates,
              );
            }),
        // const SizedBox(height: 10),
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     const Text('Selection(s):  '),
        //     const SizedBox(width: 10),
        //     Text(
        //       _getValueText(
        //         config.calendarType,
        //         _singleDatePickerValueWithDefaultValue,
        //       ),
        //     ),
        //   ],
        // ),
        // const SizedBox(height: 25),
      ],
    );
  }
}
