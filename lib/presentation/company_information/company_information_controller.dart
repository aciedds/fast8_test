import 'package:fast8_test/di/injection.dart';
import 'package:fast8_test/domain/entity/company/company_data.dart';
import 'package:fast8_test/domain/usecase/add_company_uc.dart';
import 'package:fast8_test/domain/usecase/get_company_uc.dart';
import 'package:fast8_test/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyInformationController extends GetxController {
  final GetCompanyUc _getCompanyUc = inject<GetCompanyUc>();
  final AddCompanyUc _addCompanyUc = inject<AddCompanyUc>();

  late TextEditingController companyNameTEC;
  late FocusNode companyNameFN;

  late TextEditingController companyAddressTEC;
  late FocusNode companyAddressFN;

  late TextEditingController positionTEC;
  late FocusNode positionFN;

  late TextEditingController lengthOfServiceTEC;
  late FocusNode lengthOfServiceFN;

  late TextEditingController incomeSourceTEC;
  late FocusNode incomeSourceFN;

  late TextEditingController grossYearlyIncomeTEC;
  late FocusNode grossYearlyIncomeFN;

  late TextEditingController bankNameTEC;
  late FocusNode bankNameFN;

  late TextEditingController bankAccountNumberTEC;
  late FocusNode bankAccountNumberFN;

  late TextEditingController bankAccountNameTEC;
  late FocusNode bankAccountNameFN;

  @override
  void onInit() {
    super.onInit();
    initializeCompanyNameTextField();
    initializeCompanyAddressTextField();
    initializePositionTextField();
    initializeLengthOfServiceTextField();
    initializeIncomeSourceTextField();
    initializeGrossYearlyIncomeTextField();
    initializeBankNameTextField();
    initializeBankAccountNumberTextField();
    initializeBankAccountNameTextField();
    getCompany();
  }

  void initializeCompanyNameTextField() {
    companyNameTEC = TextEditingController();
    companyNameFN = FocusNode();
  }

  void initializeCompanyAddressTextField() {
    companyAddressTEC = TextEditingController();
    companyAddressFN = FocusNode();
  }

  void initializePositionTextField() {
    positionTEC = TextEditingController();
    positionFN = FocusNode();
  }

  void initializeLengthOfServiceTextField() {
    lengthOfServiceTEC = TextEditingController();
    lengthOfServiceFN = FocusNode();
  }

  void initializeIncomeSourceTextField() {
    incomeSourceTEC = TextEditingController();
    incomeSourceFN = FocusNode();
  }

  void initializeGrossYearlyIncomeTextField() {
    grossYearlyIncomeTEC = TextEditingController();
    grossYearlyIncomeFN = FocusNode();
  }

  void initializeBankNameTextField() {
    bankNameTEC = TextEditingController();
    bankNameFN = FocusNode();
  }

  void initializeBankAccountNumberTextField() {
    bankAccountNumberTEC = TextEditingController();
    bankAccountNumberFN = FocusNode();
  }

  void initializeBankAccountNameTextField() {
    bankAccountNameTEC = TextEditingController();
    bankAccountNameFN = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    companyNameTEC.dispose();
    companyAddressTEC.dispose();
    positionTEC.dispose();
    lengthOfServiceTEC.dispose();
    incomeSourceTEC.dispose();
    grossYearlyIncomeTEC.dispose();
    bankNameTEC.dispose();
    bankAccountNumberTEC.dispose();
    bankAccountNameTEC.dispose();
  }

  void getCompany() {
    final result = _getCompanyUc();
    result.when(
      success: (data) {
        companyNameTEC.text = data.companyName;
        companyAddressTEC.text = data.companyAddress;
        positionTEC.text = data.position;
        lengthOfServiceTEC.text = data.lengthOfService;
        incomeSourceTEC.text = data.incomeSource;
        grossYearlyIncomeTEC.text = data.grossYearlyIncome;
        bankNameTEC.text = data.bankName;
        bankAccountNumberTEC.text = data.bankAccountNumber;
        bankAccountNameTEC.text = data.bankAccountName;
      },
      error: (message, data, exception, stackTrace, statusCode) {},
    );
  }

  void completePersonalInformation() {
    _addCompanyUc(
      data: CompanyData(
        companyName: companyNameTEC.text,
        companyAddress: companyAddressTEC.text,
        position: positionTEC.text,
        lengthOfService: lengthOfServiceTEC.text,
        incomeSource: incomeSourceTEC.text,
        grossYearlyIncome: grossYearlyIncomeTEC.text,
        bankName: bankNameTEC.text,
        bankAccountNumber: bankAccountNumberTEC.text,
        bankAccountName: bankAccountNameTEC.text,
      ),
    );
    Get.offAllNamed(Routes.HOME);
  }
}
