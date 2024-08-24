import 'package:fast8_test/presentation/register/register_controller.dart';
import 'package:fast8_test/presentation/routes.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("1 Langkah lagi..."),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              // Full Name
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
                onChanged: controller.updateFullName,
              ),
              SizedBox(height: 16.0),

              // Date of Birth
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: Obx(
                    () => TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Tanggal Lahir',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      controller: TextEditingController(
                        text: controller.formattedDate,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // Gender Dropdown
              Obx(
                () => DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Jenis Kelamin',
                    border: OutlineInputBorder(),
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
                  onChanged: (value) => controller.updateGender,
                ),
              ),
              SizedBox(height: 16.0),

              // Phone Number
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'No. HP',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                onChanged: controller.updatePhoneNumber,
              ),
              SizedBox(height: 16.0),

              // Agree to Terms
              Obx(
                () => Row(
                  children: [
                    Checkbox(
                      value: controller.agreedToTerms.value,
                      onChanged: controller.toggleAgreement,
                    ),
                    Expanded(
                      child: Text(
                          "Saya telah membaca dan menyetujui Syarat & Ketentuan"),
                    ),
                  ],
                ),
              ),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  // if (controller.validateForm()) {
                  //   // Handle form submission
                  //   Get.snackbar("Success", "Form is valid and submitted!");
                  // } else {
                  //   Get.snackbar("Error", "Please fill all required fields!");
                  // }

                  Get.offAllNamed(Routes.HOME);
                },
                child: Text('Buat akun'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
