import 'package:ShopDemo/global/const.dart';
import 'package:ShopDemo/ui/common_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class CustomDropdown extends StatefulWidget {
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  void initState() {
    super.initState();
  }

  DateTime? _date;
  @override
  Widget build(BuildContext context) {
    var currentDate = _date != null ? DateFormat('yyyy-MM-dd').format(_date!) : 'dd/mm/YYYY';
    var check = currentDate.compareTo('dd/mm/YYYY');


    return CustomButton(
      option: CustomButtonOption(
        borderRadius: 5,
        color: Colors.white,
        borderColor: Color.fromRGBO(157, 158, 163, 1),
        isCenterContent: false,
        suffixIcon: Icons.keyboard_arrow_down,
        content: Container(
          child: Text(
            currentDate,
            style: TextStyle(
              fontFamily: defaultFont,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: check != 0
                  ? Color.fromRGBO(100, 100, 100, 1)
                  : Color.fromRGBO(201, 201, 201, 1),
            ),
          ),
        ),
        onTap: () {
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(1900, 1, 1),
              maxTime: DateTime(2020, 1, 1), onChanged: (date) {
            //TODO
            _date = date;
            print('change $date');
            setState(() {});
          }, onConfirm: (date) {
            _date = date;
            //Todo
            print('confirm $date');
            setState(() {});
          }, currentTime: DateTime.now(), locale: LocaleType.vi);
        },
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   var _currentSelectedValue;
  //   var _currencies = [
  //   "Food",
  //   "Transport",
  //   "Personal",
  //   "Shopping",
  //   "Medical",
  //   "Rent",
  //   "Movie",
  //   "Salary"
  // ];
  //   return FormField<String>(
  //         builder: (FormFieldState<String> state) {
  //           return InputDecorator(
  //             decoration: InputDecoration(
  //                 // labelStyle: textStyle,
  //                 errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
  //                 hintText: 'Please select expense',
  //                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
  //             isEmpty: _currentSelectedValue == '',
  //             child: DropdownButtonHideUnderline(
  //               child: DropdownButton<String>(
  //                 value: _currentSelectedValue,
  //                 isDense: true,
  //                 onChanged: (String newValue) {
  //                   setState(() {
  //                     _currentSelectedValue = newValue;
  //                     state.didChange(newValue);
  //                   });
  //                 },
  //                 items: _currencies.map((String value) {
  //                   return DropdownMenuItem<String>(
  //                     value: value,
  //                     child: Text(value),
  //                   );
  //                 }).toList(),
  //               ),
  //             ),
  //           );
  //         },
  //       );
  // }
}
