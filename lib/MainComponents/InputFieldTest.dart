import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';


Widget inputFieldTest(TextEditingController fieldController,String fieldName,TextInputType type,validationFunction){
  return Padding(
    padding:
    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextFormField(
      controller: fieldController,
      cursorColor: kPrimaryColor,
      keyboardType: type,
      decoration:  InputDecoration(
        labelText: "$fieldName  \n",
        labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
      ),
      validator: validationFunction,
    ),
  );
}
Widget inputFieldTestreset(TextEditingController fieldController,String fieldName,TextInputType type,validationFunction){
  return Padding(
    padding:
    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextFormField(
      controller: fieldController,
      obscureText: true,
      cursorColor: kPrimaryColor,
      keyboardType: type,
      decoration:  InputDecoration(
        labelText: "$fieldName  \n",
        labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
      ),
      validator: validationFunction,
    ),
  );
}
Widget inputFieldTestRead(TextEditingController fieldController,String fieldName,TextInputType type,validationFunction){
  return Padding(
    padding:
    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextFormField(
      readOnly: true,
      controller: fieldController,
      keyboardType: type,
      cursorColor: kPrimaryColor,
      decoration:  InputDecoration(
        labelText: "$fieldName  \n",
        labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
      ),
      validator: validationFunction,
    ),
  );
}
Widget dateInputFieldTest(TextEditingController date,BuildContext context,){
  return Padding(
    padding:
    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextField(
        readOnly: true,
        controller: date,
        decoration: const InputDecoration(
          hintText: "Date",
          hintStyle: TextStyle(fontSize: 18, color: Colors.black),
          prefixIcon: Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Icon(Icons.timelapse),
          ),
        ),
        onTap:() async {
          DateTime? selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1940, 8),
              lastDate: DateTime.now());
          if (selectedDate != null) {
            date.text =
                DateFormat('yyyy-MM-dd').format(selectedDate);
          }
        }),
  );
}
Widget dropDownInputFieldTest(String fieldName, String dropdownValue,List<String> listOfValues){
  return Padding(
    padding:
    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: DropdownButtonFormField(
      decoration:  InputDecoration(
        labelText: "$fieldName  \n",
        labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        filled: true,
      ),
      dropdownColor: Colors.white,
      value: listOfValues[0],
      onChanged: (String? newValue2) {
        dropdownValue = newValue2!;
      },
      items:listOfValues.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        );
      }).toList(),
    ),
  );
}
Widget timeInputFieldTest(TextEditingController time,BuildContext context,){
  TimeOfDay time2 = TimeOfDay.now();
  return Padding(
    padding:
    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextField(
        controller: time,
        decoration: const InputDecoration(
          hintText: "time",
          hintStyle: TextStyle(fontSize: 18, color: Colors.black),
          prefixIcon: Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Icon(Icons.timelapse),
          ),
        ),
        onTap:() async {
          TimeOfDay? newTime = await showTimePicker(
            context: context,
            initialTime: time2,
          );
          if (newTime != null) {
            time2 = newTime;
            time.text = newTime.format(context);
          }
        }
    ),
  );

}