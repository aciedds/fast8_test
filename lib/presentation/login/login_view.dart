import 'package:fast8_test/presentation/login/login_controller.dart';
import 'package:fast8_test/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.offNamed(Routes.HOME),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              SvgPicture.asset(
                'assets/svg/onboarding1.svg',
                height: 300.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              const Text(
                'Selamat Datang!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ALAMAT EMAIL',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: controller.emailTEC,
                focusNode: controller.emailFN,
                decoration: InputDecoration(
                  hintText: 'ketik email kamu di sini...',
                  focusColor: Colors.deepOrangeAccent,
                  hoverColor: Colors.deepOrangeAccent,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Obx(
                () {
                  if (controller.passwordFieldVisible.value == 1) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'PASSWORD',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: controller.passwordTEC,
                          focusNode: controller.passwordFN,
                          obscureText: controller.isPasswordVisible.value,
                          decoration: InputDecoration(
                            hintText: 'ketik password kamu di sini...',
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
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                controller.isPasswordVisible.value =
                                    !controller.isPasswordVisible.value;
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (controller.passwordFieldVisible.value == 2) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'PASSWORD',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Obx(() {
                          return TextField(
                            controller: controller.passwordTEC,
                            focusNode: controller.passwordFN,
                            obscureText: controller.isPasswordVisible.value,
                            decoration: InputDecoration(
                              hintText: 'ketik password kamu di sini...',
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
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isPasswordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  controller.isPasswordVisible.value =
                                      !controller.isPasswordVisible.value;
                                },
                              ),
                            ),
                          );
                        }),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'CONFIRM PASSWORD',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: controller.confirmPasswordTEC,
                          focusNode: controller.confirmPasswordFN,
                          obscureText:
                              controller.isConfirmPasswordVisible.value,
                          decoration: InputDecoration(
                            hintText: 'konfirmasi password kamu di sini...',
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
                            suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isConfirmPasswordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  controller.isConfirmPasswordVisible.value =
                                      !controller
                                          .isConfirmPasswordVisible.value;
                                }),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => controller.proceedToLoginOrRegister(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Obx(() {
                  return Text(
                    controller.passwordFieldVisible.value == 1
                        ? 'Masuk'
                        : controller.passwordFieldVisible.value == 2
                            ? 'Register'
                            : 'Lanjutkan',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'atau',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => controller.loginWithGoogle(context),
                icon: const Icon(
                  Icons.g_mobiledata,
                  color: Colors.red,
                ),
                label: const Text(
                  'Lanjutkan dengan Google',
                  style: TextStyle(color: Colors.red),
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
