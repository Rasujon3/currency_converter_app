import 'package:flutter/material.dart';

Future<Null> onRefresh() async {
  await Future.delayed(Duration(seconds: 3));
}

Widget customDropDown(List<String> items, String value, void onChange(val)) {
  return RefreshIndicator(
    onRefresh: onRefresh,
    backgroundColor: Colors.green,
    color: Colors.white,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButton<String>(
        value: value,
        onChanged: (String val) {
          onChange(val);
        },
        items: items?.map<DropdownMenuItem<String>>((String val) {
          return DropdownMenuItem(
            child: Text(val),
            value: val,
          );
        })?.toList() ?? [],
      ),
    ),
    );
}





