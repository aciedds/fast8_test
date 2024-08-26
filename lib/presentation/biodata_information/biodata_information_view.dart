import 'package:fast8_test/presentation/biodata_information/biodata_information_controller.dart';
import 'package:fast8_test/presentation/routes.dart';
import 'package:fast8_test/presentation/widget/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BiodataInformationView extends GetView<BiodataInformationController> {
  const BiodataInformationView({super.key});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      controller.updateDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informasi Pribadi"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.offNamed(Routes.PROFILE),
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
            currentStep: 0,
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
                const Text(
                  'NAMA LENGKAP',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: controller.nameTEC,
                  focusNode: controller.nameFN,
                  decoration: InputDecoration(
                    hintText: 'Nama Lengkap',
                    focusColor: Colors.deepOrangeAccent,
                    hoverColor: Colors.deepOrangeAccent,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepOrangeAccent,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepOrangeAccent,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'TANGGAL LAHIR',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: Obx(
                      () => TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Tanggal Lahir',
                          focusColor: Colors.deepOrangeAccent,
                          hoverColor: Colors.deepOrangeAccent,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.deepOrangeAccent,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.deepOrangeAccent,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        controller: TextEditingController(
                          text: controller.formattedDate,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'JENIS KELAMIN',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: 'Jenis Kelamin',
                      focusColor: Colors.deepOrangeAccent,
                      hoverColor: Colors.deepOrangeAccent,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepOrangeAccent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepOrangeAccent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    value: controller.gender.value.isEmpty
                        ? null
                        : controller.gender.value,
                    items: ['Laki-laki', 'Perempuan']
                        .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                        .toList(),
                    onChanged: (value) => controller.updateGender(
                      value ?? 'Laki-laki',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'ALAMAT EMAIL',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Obx(() {
                    return Text(
                      controller.email.value != '' ? controller.email.value : 'Email',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'NOMOR HANDPHONE',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: controller.phoneNumberTEC,
                  focusNode: controller.phoneNumberFN,
                  decoration: InputDecoration(
                    hintText: 'No. HP',
                    focusColor: Colors.deepOrangeAccent,
                    hoverColor: Colors.deepOrangeAccent,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrangeAccent,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrangeAccent,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'PENDIDIKAN',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: 'Pilih',
                      focusColor: Colors.deepOrangeAccent,
                      hoverColor: Colors.deepOrangeAccent,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepOrangeAccent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepOrangeAccent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    value: controller.education.value.isEmpty
                        ? null
                        : controller.education.value,
                    items:
                        ['SD', 'SMP', 'SMA', 'D1', 'D2', 'D3', 'S1', 'S2', 'S3']
                            .map((label) => DropdownMenuItem(
                                  child: Text(label),
                                  value: label,
                                ))
                            .toList(),
                    onChanged: (value) => controller.updateEducation(
                      value ?? '-',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'STATUS PERNIKAHAN',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: 'Pilih',
                      focusColor: Colors.deepOrangeAccent,
                      hoverColor: Colors.deepOrangeAccent,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepOrangeAccent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepOrangeAccent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    value: controller.maritalStatus.value.isEmpty
                        ? null
                        : controller.maritalStatus.value,
                    items: ['Belum Menikah', 'Menikah', 'Janda', 'Duda']
                        .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                        .toList(),
                    onChanged: (value) => controller.updateMaritalStatus(
                      value ?? '-',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: controller.continueToAddressInformation,
                  child: const Text(
                    'Lanjutkan',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
