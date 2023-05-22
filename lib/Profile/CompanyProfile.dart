import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../MainComponents/InputFieldTest.dart';
import '../ServicesPage/Cubit/BusinessServiceStates.dart';
import '../ServicesPage/Cubit/BussinessServiceCubit.dart';
import '../ServicesPage/model/CompanyProfileForServiceModel.dart';
import '../shared/components/toast.dart';
import '../shared/styles/colors.dart';
import 'package:flutter/foundation.dart';
//inputFieldTestRead
class CompanyScreen extends StatefulWidget {
  const CompanyScreen({required this.id,Key? key}) : super(key: key);
  final int id;
  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}
class _CompanyScreenState extends State<CompanyScreen> {

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var CnameController = TextEditingController(text: "");
    var PnameController = TextEditingController(text: "");
    var phoneController = TextEditingController(text: "");
    var EmailController = TextEditingController(text: "");
    var companyAddressController = TextEditingController(text:"");
    var companySizeController = TextEditingController(text: "");
    var companyIndustryController = TextEditingController(text: "");
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    String?imagepath="/data/user/0/com.example.mobileproject/cache/f87346ef-4e50-4ee0-810c-e9acf8c57726/IMG-20230522-WA0120.jpg";

    bool isKeyboardOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return BlocProvider(
      create: (BuildContext context) => BusinessServiceCubit()..getCompanyProfileForService(id: widget.id),
      child: BlocConsumer<BusinessServiceCubit,BusinessServiceStates>(
        listener: (context, state) {
          if(state is CompanyProfileForServiceSuccessState){
            CnameController = TextEditingController(text: BusinessServiceCubit.get(context).companyProfileForServiceModel?.companyProfile?.name);
            PnameController = TextEditingController(text: BusinessServiceCubit.get(context).companyProfileForServiceModel?.companyProfile?.contactPersonName);
            phoneController = TextEditingController(text: BusinessServiceCubit.get(context).companyProfileForServiceModel?.companyProfile?.contactPersonPhoneNumber);
            EmailController = TextEditingController(text: BusinessServiceCubit.get(context).companyProfileForServiceModel?.companyProfile?.email);
            companyAddressController = TextEditingController(text:BusinessServiceCubit.get(context).companyProfileForServiceModel?.companyProfile?.companyAddress);
            companySizeController = TextEditingController(text: BusinessServiceCubit.get(context).companyProfileForServiceModel?.companyProfile?.companySize);
            companyIndustryController = TextEditingController(text: BusinessServiceCubit.get(context).companyProfileForServiceModel?.companyProfile?.companyIndustry);
          }
          if (state is GetAllServiceSuccessState){
          }
          if(state is AddServiceToFavoriteSuccessState){
            showToast(state.addServiceToFavoriteModel.message,Colors.green,Colors.white);
          }
          if (state is GetAllServiceErrorState){
            showToast(state.error,Colors.red,Colors.white);
          }
        },
        builder: (context, state) {
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
        },
      ),
    );
  }
}




