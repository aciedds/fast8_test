import 'package:fast8_test/presentation/company_information/company_information_controller.dart';
import 'package:fast8_test/presentation/routes.dart';
import 'package:fast8_test/presentation/widget/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyInformationView extends GetView<CompanyInformationController> {
  const CompanyInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informasi Pribadi"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.offNamed(Routes.ADDRESS_INFORMATION),
          icon: const Icon(
            Icons.chevron_left,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomStepper(
            currentStep: 2,
            stepDescriptions: [
              'Biodata Diri',
              'Alamat Pribadi',
              'Informasi Perusahaan',
            ],
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildTextField(
                  label: 'Perusahaan',
                  controller: controller.companyNameTEC,
                  focusNode: controller.companyNameFN,
                  hintText: 'Masukkan Perusahaan Anda..',
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: 'Alamat Perusahaan',
                  controller: controller.companyAddressTEC,
                  focusNode: controller.companyAddressFN,
                  hintText: 'Masukkan Alamat Perusahaan Anda..',
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: 'Posisi',
                  controller: controller.positionTEC,
                  focusNode: controller.positionFN,
                  hintText: 'Masukkan Posisi Anda..',
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: 'Lama Bekerja',
                  controller: controller.lengthOfServiceTEC,
                  focusNode: controller.lengthOfServiceFN,
                  hintText: 'Masukkan Lama Bekerja Anda..',
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: 'Sumber Pendapatan',
                  controller: controller.incomeSourceTEC,
                  focusNode: controller.incomeSourceFN,
                  hintText: 'Masukkan Sumber Pendapatan Anda..',
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: 'Pendapatan Kotor Pertahun',
                  controller: controller.grossYearlyIncomeTEC,
                  focusNode: controller.grossYearlyIncomeFN,
                  hintText: 'Masukkan pendapatan kotor per tahun Anda..',
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: 'Bank',
                  controller: controller.bankNameTEC,
                  focusNode: controller.bankNameFN,
                  hintText: 'Masukkan Bank Anda..',
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: 'Nomor Rekening',
                  controller: controller.bankAccountNumberTEC,
                  focusNode: controller.bankAccountNumberFN,
                  hintText: 'Masukkan Nomor Rekening Anda..',
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  label: 'Atas Nama Rekening',
                  controller: controller.bankAccountNameTEC,
                  focusNode: controller.bankAccountNameFN,
                  hintText: 'Masukkan Atas Nama Rekening Anda..',
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
                            Get.offNamed(Routes.ADDRESS_INFORMATION),
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
                        onPressed: controller.completePersonalInformation,
                        child: const Text(
                          'Selesai',
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
