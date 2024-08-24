import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_data.freezed.dart';

@freezed
class PostData with _$PostData {
  const factory PostData({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _PostData;
}
