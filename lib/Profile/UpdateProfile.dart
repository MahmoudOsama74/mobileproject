import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../MainComponents/InputFieldTest.dart';
import '../shared/components/components.dart';
import '../shared/styles/IconBroken.dart';
import '../shared/styles/colors.dart';
import 'ResetPassword.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatelessWidget {


  var formKey = GlobalKey<FormState>();
  var CnameController = TextEditingController(text: "Elgammal-Tech");
  var PnameController = TextEditingController(text: "Walid Mohamed");
  var phoneController = TextEditingController(text: "01061090690");
  var EmailController = TextEditingController(text: "example@gmail.com");
  var companyAddressController = TextEditingController(text: "Egypt");
  String dropdownValue1= 'Large';

  UpdateScreen({super.key});




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
                  horizontal: screenWidth * 0.05, vertical: screenHeight * 0.03),
              child: Column(
                children: [


                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  const [

                      BackButton(),
                      Padding(
                        padding:EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                        child: Text(
                          " Update Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:27,
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
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              backgroundColor: defaultTealAccent.withOpacity(0.6),
                              radius: screenHeight * 0.088,
                              child: CircleAvatar(
                                backgroundColor: defaultWhite,
                                radius: screenHeight * 0.084,
                                child: CircleAvatar(
                                  radius: screenHeight * 0.081,
                                  backgroundImage: AssetImage( 'assets/images/img.png'),
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
                                  onPressed: () async{
                                    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom,
                                        allowedExtensions: ['jpg','png']);

                                    if (result != null) {
                                      PlatformFile file = result.files.first;
                                      print(file.name);
                                      print(file.extension);
                                      String path = result.files.single.path!;
                                      print('Selected file path: $path');
                                    } else {
                                      // User canceled the picker
                                    }
                                  },
                                  icon: Icon(
                                    IconBroken.Camera,
                                    color:
                                    Theme.of(context).scaffoldBackgroundColor,
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
                      inputFieldTest(CnameController, "Company Name",),
                      SizedBox(height: screenHeight * 0.015),
                      inputFieldTest(PnameController, "Person Name"),
                      SizedBox(height: screenHeight * 0.015),
                      inputFieldTest(phoneController, "Phone",),
                      SizedBox(height: screenHeight * 0.015),
                      inputFieldTest(EmailController, "Email Address"),
                      SizedBox(height: screenHeight * 0.015),
                      inputFieldTest(companyAddressController, "Company Address"),
                      SizedBox(height: screenHeight * 0.02),
                      dropDownInputFieldTest('Company Size', dropdownValue1, <String>[
                        'Micro',
                        'Small',
                        'Mini',
                        'Large',
                      ]),
                Row(
                  mainAxisAlignment : MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Company Industry',
                      style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),

                    ),
                    SizedBox(width : screenWidth * 0.2),
                    Center(
                      child: ChangeNotifierProvider(
                        create: (_) => CheckboxProvider(),
                        child: Consumer<CheckboxProvider>(
                          builder: (context, checkboxProvider, _) => Checkbox(
                            value: checkboxProvider.isChecked,
                            onChanged: (value) {
                              checkboxProvider.isChecked = value ?? true;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            maximumSize: const Size(200, 50),
                            minimumSize: const Size(200, 50),
                          ),
                          onPressed: () {},
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


class CheckboxProvider with ChangeNotifier {
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  set isChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }
}
