import 'package:fast8_test/presentation/register/register_controller.dart';
import 'package:fast8_test/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      controller.updateDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        if (didPop) {
          Get.offNamed(Routes.HOME);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.offNamed(Routes.LOGIN),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: ListView(
              children: [
                const SizedBox(height: 40),
                SvgPicture.asset(
                  'assets/svg/onboarding2.svg',
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Text(
                  '1 Langkah lagi...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
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

                // Agree to Terms
                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                        value: controller.agreedToTerms.value,
                        onChanged: controller.toggleAgreement,
                        activeColor: Colors.deepOrangeAccent,
                        focusColor: Colors.deepOrangeAccent,
                        hoverColor: Colors.deepOrangeAccent,
                      ),
                      const Expanded(
                        child: Text(
                            "Saya telah membaca dan menyetujui Syarat & Ketentuan"),
                      ),
                    ],
                  ),
                ),

                // Submit Button
                Obx(() {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: controller.agreedToTerms.value
                        ? () => controller.proceedToRegister(context)
                        : null,
                    child: const Text(
                      'Buat akun',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
