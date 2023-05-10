import 'dart:convert';

class MedicalInformationModel
{
  late bool status;
  late String message;

  MedicalInformationModel({required this.status,required this.message});
  factory MedicalInformationModel.fromJson(Map<String, dynamic> jsonn)
  {
    MedicalInformationModel L= MedicalInformationModel(
        status: jsonn['status'] as bool,
        message: jsonn['message'] as String,
    );

    return L;
  }
}