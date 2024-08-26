import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_data.freezed.dart';

@freezed
class CompanyData with _$CompanyData {
  const factory CompanyData({
    required String companyName,
    required String companyAddress,
    required String position,
    required String lengthOfService,
    required String incomeSource,
    required String grossYearlyIncome,
    required String bankName,
    required String bankAccountNumber,
    required String bankAccountName,
  }) = _CompanyData;
}
