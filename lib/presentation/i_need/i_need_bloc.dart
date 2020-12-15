import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum INeedState { howToPost, createPost }

class INeedBLoC extends ChangeNotifier {
  ValueNotifier<INeedState> _state;
  ValueNotifier<File> _file;
  ValueNotifier<bool> _isCompleted;
  ValueNotifier<bool> _isLoading;
  ImagePicker _imagePicker;
  TextEditingController _controllerNeed;
  TextEditingController _controllerDescription;
  ValueNotifier<INeedState> get state => _state;
  ValueNotifier<File> get file => _file;
  ValueNotifier<bool> get isCompleted => _isCompleted;
  ValueNotifier<bool> get isLoading => _isLoading;
  TextEditingController get controllerNeed => _controllerNeed;
  TextEditingController get controllerDescription => _controllerDescription;

  INeedBLoC() {
    _init();
  }

  void _init() {
    _state = ValueNotifier<INeedState>(INeedState.howToPost);
    _file = ValueNotifier<File>(null);
    _isCompleted = ValueNotifier<bool>(false);
    _isLoading = ValueNotifier<bool>(false);
    _imagePicker = ImagePicker();
    _controllerNeed = TextEditingController();
    _controllerDescription = TextEditingController();
    _controllerNeed?.addListener(_listenerNeed);
    _controllerDescription?.addListener(_listenerDescription);
  }

  void _listenerNeed() => _hasCompleted();

  void _listenerDescription() => _hasCompleted();

  void _hasCompleted() {
    if (_controllerNeed.text.length > 5 &&
        _controllerDescription.text.length > 15 &&
        _file.value != null &&
        !_isCompleted.value) {
      _isCompleted.value = true;
    } else if (_isCompleted.value) {
      _isCompleted.value = false;
    }
  }

  Future<void> selectPhoto() async {
    await _getImage(ImageSource.gallery);
  }

  Future<void> takePhoto() async {
    await _getImage(ImageSource.camera);
  }

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = (await _imagePicker.getImage(source: source));
    if (pickedFile.path != null) {
      _file.value = File(pickedFile.path);
    }
    _hasCompleted();
  }

  void setNewState(INeedState state) => _state.value = state;

  Future<void> nextPage() async {
    _isLoading.value = true;
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _controllerNeed?.removeListener(_listenerNeed);
    _controllerDescription?.removeListener(_listenerDescription);
    _controllerDescription?.dispose();
    _controllerNeed?.dispose();
    super.dispose();
  }
}
