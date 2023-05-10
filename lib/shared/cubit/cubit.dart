
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobileproject/shared/cubit/state.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(Empty());

  static AppBloc get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void bottomChanged(int index) {
    currentIndex = index;

    emit(BottomChanged());
  }

  File? postImage;

  var picker = ImagePicker();

  void pickPostImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      debugPrint(pickedFile.path);
      emit(PostImagePickedSuccess());
    } else {
      debugPrint('No image selected.');
      emit(PostImagePickedError());
    }
  }

  void deletePostImage() async {
    postImage = null;
    emit(PostImagePickedError());
  }

  void getPosts() {}

  void getUsers() {}

  void updatePostLikes() {}
}
