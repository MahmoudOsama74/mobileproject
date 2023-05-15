import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import '../MainComponents/InputFieldTest.dart';
import '../shared/components/components.dart';
import '../shared/styles/IconBroken.dart';
import '../shared/styles/colors.dart';
import 'ResetPassword.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:http/http.dart' as http;

import 'cubit/cubit.dart';


class UpdateScreen extends StatefulWidget {
  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  var formKey = GlobalKey<FormState>();
  var CnameController = TextEditingController(text: "Elgammal-Tech");
  var PnameController = TextEditingController(text: "Walid Mohamed");
  var phoneController = TextEditingController(text: "01061090690");
  var EmailController = TextEditingController(text: "example@gmail.com");
  var companyAddressController = TextEditingController(text: "Egypt");
  String dropdownValue1 = 'Large';
  List<String> items = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5',
  ];

  List<String> selectedItems = [];
  String?imagepath;


  void pickMedia () async {
    XFile? file = await ImagePicker (). pickImage (source: ImageSource . gallery) ;
    if (file != null) {
      imagepath = file.path;
      print (imagepath);
      setState ((){} );
    }
  }

  @override

// Inside your widget's build method or wherever you want to display the profile picture

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    FilePickerResult? result;

    bool isKeyboardOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ResetPassword();
                  },
                ),
              );
            },
            label: const Text('Update Password '),
            icon: const Icon(Icons.key_rounded),
            backgroundColor: const Color(0xFF344E41),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.03),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      BackButton(),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: Text(
                          " Update Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF588157),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              backgroundColor: defaultTealAccent.withOpacity(0.6),
                              radius: screenHeight * 0.088,
                              child: ClipOval(
                                child: (imagepath != null)
                                    ? Image.file(
                                  File(imagepath!),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                )
                                    : Container(
                                  color: defaultWhite,
                                ),
                              ),

                            ),

                            CircleAvatar(
                              backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                              radius: screenHeight * 0.028,
                              child: CircleAvatar(
                                backgroundColor: defaultTealAccent,
                                radius: screenHeight * 0.025,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: (){
                                    pickMedia();
                                    print(imagepath);

                                  },
                                  icon: Icon(
                                    IconBroken.Camera,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Column(
                    children: [
                      inputFieldTest(
                        CnameController,
                        "Company Name",
                        TextInputType.name,
                            (val) {
                          if (val!.isEmpty) return 'Empty';
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      inputFieldTest(
                        PnameController,
                        "Person Name",
                        TextInputType.name,
                            (val) {
                          if (val!.isEmpty) return 'Empty';
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      inputFieldTest(
                        phoneController,
                        "Phone",
                        TextInputType.phone,
                            (val) {
                          if (val!.isEmpty) return 'Empty';
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      inputFieldTestRead(
                        EmailController,
                        "Email Address",
                        TextInputType.emailAddress,
                            (val) {
                          if (val!.isEmpty) return 'Empty';
                          if (RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                              .hasMatch(val)) {
                          } else {
                            return ("Invalid Email");
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      inputFieldTest(
                        companyAddressController,
                        "Company Address",
                        TextInputType.none,
                            (val) {
                          if (val!.isEmpty) return 'Empty';
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      dropDownInputFieldTest(
                        'Company Size',
                        dropdownValue1,
                        <String>[
                          'None',
                          'Micro',
                          'Small',
                          'Mini',
                          'Large',
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Company Industry:',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: MultiSelectDialogField(
                                buttonText: Text('Select Options'),
                                title: Text('Options'),
                                items: items.map((item) => MultiSelectItem(item, item)).toList(),
                                listType: MultiSelectListType.CHIP,
                                onConfirm: (selectedValues) {
                                  setState(() {
                                    selectedItems = selectedValues;
                                  });
                                },

                              ),

                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                print('Selected items: $selectedItems');
                                String x='';
                                for (String item in selectedItems) {
                                  x+='$item,';
                                  // Do something with x

                                }
                                // x+=item;
                                print(x);
                              },
                              child: Text('Save'),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            maximumSize: const Size(200, 50),
                            minimumSize: const Size(200, 50),
                          ),
                          onPressed: () {
                            UpdateProfileCubit.get(context).userUpdate(
                                name: CnameController.text,
                                contact_person_name: PnameController.text,
                                contact_person_phone_number: phoneController.text,
                                company_address: EmailController.text,
                                company_size: dropdownValue1
                            );
                          },
                          child: Text(
                            "Update".toUpperCase(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.06),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

