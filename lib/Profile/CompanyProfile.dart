import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../MainComponents/InputFieldTest.dart';
import '../shared/styles/colors.dart';
import 'package:flutter/foundation.dart';

class ProfileScreen extends StatelessWidget {


  var formKey = GlobalKey<FormState>();
  var CnameController = TextEditingController(text: "Elgammal-Tech");
  var PnameController = TextEditingController(text: "Walid Mohamed");
  var phoneController = TextEditingController(text: "01061090690");
  var EmailController = TextEditingController(text: "example@gmail.com");
  var companyAddressController = TextEditingController(text: "Egypt");
  var companySizeController = TextEditingController(text: "Large");
  var companyIndustryController = TextEditingController(text: "Yes");



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
                          "Profile",
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

                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Column(
                    children: [
                      inputFieldTestRead(CnameController, "Company Name",TextInputType.name,null),
                      SizedBox(height: screenHeight * 0.015),
                      inputFieldTestRead(PnameController, "Person Name",TextInputType.name,null),
                      SizedBox(height: screenHeight * 0.015),
                      inputFieldTestRead(phoneController, "Phone",TextInputType.phone,null),
                      SizedBox(height: screenHeight * 0.015),
                      inputFieldTestRead(EmailController, "Email Address",TextInputType.emailAddress,null),
                      SizedBox(height: screenHeight * 0.015),
                      inputFieldTestRead(companyAddressController, "Company Address",TextInputType.streetAddress,null),
                      SizedBox(height: screenHeight * 0.02),
                      inputFieldTestRead(companySizeController, "Company Size",TextInputType.name,null),
                      SizedBox(height: screenHeight * 0.02),
                      inputFieldTestRead(companyIndustryController, "Company Industry",TextInputType.none,null),
                      SizedBox(height: screenHeight * 0.02),

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


