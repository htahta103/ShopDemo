import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:direct_select_flutter/direct_select_item.dart';

class CustomDropdown extends StatefulWidget {
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  void initState() { 
    super.initState();
     var _checkData = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];
   var check =DirectSelectList<String>(
        values: _checkData,
        defaultItemIndex: 3,
        itemBuilder: (String value) => getDropDownMenuItem(value),
        focusedItemDecoration: _getDslDecoration(),
        onItemSelectedListener: (item, index, context) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(item)));
        });
  }

     _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.black12),
        top: BorderSide(width: 1, color: Colors.black12),
      ),
    );
  }
    DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value);
        });
  }
 
  Widget build(BuildContext context) {
    return Container(child: check);
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