import 'package:fast8_test/presentation/address_information/address_information_controller.dart';
import 'package:fast8_test/presentation/routes.dart';
import 'package:fast8_test/presentation/widget/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressInformationView extends GetView<AddressInformationController> {
  const AddressInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informasi Pribadi"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.offNamed(Routes.BIODATA_INFORMATION),
          icon: const Icon(
            Icons.chevron_left,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomStepper(
            currentStep: 1,
            stepDescriptions: [
              'Biodata Diri',
              'Alamat Pribadi',
              'Informasi Perusahaan',
            ],
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildUploadKTPButton(context),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: 'NIK',
                  controller: controller.nikTEC,
                  focusNode: controller.nikFN,
                  hintText: 'Masukkan NIK Anda..',
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: 'Alamat',
                  controller: controller.addressTEC,
                  focusNode: controller.addressFN,
                  hintText: 'Masukkan Alamat Anda..',
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: 'Provinsi',
                  controller: controller.provinceTEC,
                  focusNode: controller.provinceFN,
                  hintText: 'Masukkan Provinsi Anda..',
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: 'Kota/Kabupaten',
                  controller: controller.cityTEC,
                  focusNode: controller.cityFN,
                  hintText: 'Masukkan Kota/Kabupaten Anda..',
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: 'Kecamatan',
                  controller: controller.districtTEC,
                  focusNode: controller.districtFN,
                  hintText: 'Masukkan Kecamatan Anda..',
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: 'Kelurahan',
                  controller: controller.subdistrictTEC,
                  focusNode: controller.subdistrictFN,
                  hintText: 'Masukkan Kelurahan Anda..',
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: 'Kode Pos',
                  controller: controller.postalCodeTEC,
                  focusNode: controller.postalCodeFN,
                  hintText: 'Masukkan Kode Pos Anda..',
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(50),
                          // Full-width button
                          side: const BorderSide(color: Colors.red),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () =>
                            Get.offNamed(Routes.BIODATA_INFORMATION),
                        child: const Text(
                          'Kembali',
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrangeAccent,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: controller.continueToCompanyInformation,
                        child: const Text(
                          'Lanjutkan',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadKTPButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () async {
            bool? choice = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Upload KTP'),
                content: const Text('Choose a method to upload KTP.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Camera'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('Gallery'),
                  ),
                ],
              ),
            );
            if (choice != null) {
              if (choice) {
                await controller.captureImage();
              } else {
                await controller.pickFile();
              }
            }
          },
          child: Row(
            children: [
              Expanded(
                  child: const Text('Upload KTP',
                      style: TextStyle(color: Colors.deepOrangeAccent))),
              SizedBox(width: 10),
              Obx(() => Icon(
                    controller.isVerified.value
                        ? Icons.verified
                        : Icons.perm_identity,
                    color: controller.isVerified.value
                        ? Colors.green
                        : Colors.white,
                  )),
            ],
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize: const Size.fromHeight(50), // Full-width button
            side: const BorderSide(color: Colors.red),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        Obx(() {
          if (controller.fileName.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                controller.fileName.value,
                style: const TextStyle(color: Colors.grey),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        }),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: hintText,
            focusColor: Colors.deepOrangeAccent,
            hoverColor: Colors.deepOrangeAccent,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.deepOrangeAccent),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.deepOrangeAccent),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
