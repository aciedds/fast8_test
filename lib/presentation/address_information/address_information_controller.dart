import 'dart:convert';
import 'dart:io';

import 'package:fast8_test/di/injection.dart';
import 'package:fast8_test/domain/entity/address/address_data.dart';
import 'package:fast8_test/domain/usecase/add_address_uc.dart';
import 'package:fast8_test/domain/usecase/get_address_uc.dart';
import 'package:fast8_test/presentation/routes.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddressInformationController extends GetxController {
  final GetAddressUc _getAddressUc = inject<GetAddressUc>();
  final AddAddressUc _addAddressUc = inject<AddAddressUc>();

  late TextEditingController nikTEC;
  late FocusNode nikFN;
  late TextEditingController addressTEC;
  late FocusNode addressFN;
  late TextEditingController provinceTEC;
  late FocusNode provinceFN;
  late TextEditingController cityTEC;
  late FocusNode cityFN;
  late TextEditingController districtTEC;
  late FocusNode districtFN;
  late TextEditingController subdistrictTEC;
  late FocusNode subdistrictFN;
  late TextEditingController postalCodeTEC;
  late FocusNode postalCodeFN;

  RxString fileName = ''.obs;
  RxString base64Image = ''.obs;
  RxBool isVerified = false.obs;

  @override
  void onInit() {
    super.onInit();
    initializeNikTextField();
    initializeAddressTextField();
    initializeProvinceTextField();
    initializeCityTextField();
    initializeDistrictTextField();
    initializeSubdistrictTextField();
    initializePostalCodeTextField();
    getAddress();
  }

  void initializeNikTextField() {
    nikTEC = TextEditingController();
    nikFN = FocusNode();
  }

  void initializeAddressTextField() {
    addressTEC = TextEditingController();
    addressFN = FocusNode();
  }

  void initializeProvinceTextField() {
    provinceTEC = TextEditingController();
    provinceFN = FocusNode();
  }

  void initializeCityTextField() {
    cityTEC = TextEditingController();
    cityFN = FocusNode();
  }

  void initializeDistrictTextField() {
    districtTEC = TextEditingController();
    districtFN = FocusNode();
  }

  void initializeSubdistrictTextField() {
    subdistrictTEC = TextEditingController();
    subdistrictFN = FocusNode();
  }

  void initializePostalCodeTextField() {
    postalCodeTEC = TextEditingController();
    postalCodeFN = FocusNode();
  }

  @override
  void dispose() {
    nikTEC.dispose();
    nikFN.dispose();
    addressTEC.dispose();
    addressFN.dispose();
    provinceTEC.dispose();
    provinceFN.dispose();
    cityTEC.dispose();
    cityFN.dispose();
    districtTEC.dispose();
    districtFN.dispose();
    subdistrictTEC.dispose();
    subdistrictFN.dispose();
    postalCodeTEC.dispose();
    postalCodeFN.dispose();
    super.dispose();
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      String format = file.path.split('.').last.toLowerCase();
      String base64Data = base64Encode(file.readAsBytesSync());
      String mimeType;
      switch (format) {
        case 'jpg':
        case 'jpeg':
          mimeType = 'image/jpeg';
          break;
        case 'png':
          mimeType = 'image/png';
          break;
        case 'gif':
          mimeType = 'image/gif';
          break;
        case 'bmp':
          mimeType = 'image/bmp';
          break;
        case 'webp':
          mimeType = 'image/webp';
          break;
        default:
          throw Exception('Unsupported file format: $format');
      }
      base64Image.value = 'data:$mimeType;base64,$base64Data';
      fileName.value = 'user-ktp.$format';
      isVerified.value = true;
    }
  }

  Future<void> captureImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      File file = File(photo.path);
      String format = file.path.split('.').last.toLowerCase();
      String base64Data = base64Encode(file.readAsBytesSync());
      String mimeType;
      switch (format) {
        case 'jpg':
        case 'jpeg':
          mimeType = 'image/jpeg';
          break;
        case 'png':
          mimeType = 'image/png';
          break;
        case 'gif':
          mimeType = 'image/gif';
          break;
        case 'bmp':
          mimeType = 'image/bmp';
          break;
        case 'webp':
          mimeType = 'image/webp';
          break;
        default:
          throw Exception('Unsupported file format: $format');
      }
      base64Image.value = 'data:$mimeType;base64,$base64Data';
      fileName.value = 'user-ktp.$format';
      isVerified.value = true;
    }
  }

  void getAddress() async {
    final result = _getAddressUc();
    result.when(
      success: (data) {
        decodeBase64Image(data.ktpPhoto);
        nikTEC.text = data.nik;
        addressTEC.text = data.ktpAddress;
        provinceTEC.text = data.province;
        cityTEC.text = data.city;
        districtTEC.text = data.district;
        subdistrictTEC.text = data.subDistrict;
        postalCodeTEC.text = data.postalCode;
      },
      error: (message, data, exception, stackTrace, statusCode) {},
    );
  }

  void decodeBase64Image(String base64ImageWithFormat) {
    try {
      final RegExp dataUriRegex = RegExp(r'data:([^;]+);base64,(.*)');
      final Match? match = dataUriRegex.firstMatch(base64ImageWithFormat);

      if (match != null && match.groupCount == 2) {
        String mimeType = match.group(1)!;
        String fileExtension = getFileExtensionFromMimeType(mimeType);
        fileName.value = 'user-ktp.$fileExtension';
        base64Image.value = base64ImageWithFormat;
        isVerified.value = true;
      } else {
        print('Invalid base64 image format: $base64ImageWithFormat');
      }
    } catch (e) {
      print('Error decoding Base64 image: $e');
    }
  }

  String getFileExtensionFromMimeType(String mimeType) {
    switch (mimeType) {
      case 'image/jpeg':
        return 'jpg';
      case 'image/png':
        return 'png';
      case 'image/gif':
        return 'gif';
      case 'image/bmp':
        return 'bmp';
      case 'image/webp':
        return 'webp';
      default:
        throw Exception('Unsupported MIME type: $mimeType');
    }
  }

  void continueToCompanyInformation() {
    _addAddressUc(
      data: AddressData(
        ktpPhoto: base64Image.value,
        nik: nikTEC.text,
        ktpAddress: addressTEC.text,
        province: provinceTEC.text,
        city: cityTEC.text,
        district: districtTEC.text,
        subDistrict: subdistrictTEC.text,
        postalCode: postalCodeTEC.text,
      ),
    );
    Get.offNamed(Routes.COMPANY_INFORMATION);
  }
}
