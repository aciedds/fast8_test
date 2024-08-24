import 'package:dio/dio.dart';
import 'package:fast8_test/data/model/post_model/post_model.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PostRemoteSource {
  final Dio _dio;

  PostRemoteSource(this._dio);

  Future<DataState<List<PostModel>>> getListPost() async {
    try {
      final response = await _dio.get('/posts');
      if (response.data is List && (response.data as List).isNotEmpty) {
        return DataState.success(
          data: (response.data as List)
              .map((e) => PostModel.fromJson(e))
              .toList(),
        );
      } else {
        return const DataState.error(message: "No data found");
      }
    } catch (e) {
      return DataState.error(message: "Error: $e");
    }
  }

  Future<DataState<PostModel>> getPostById(int id) async {
    try {
      final response = await _dio.get('/posts/$id');
      if (response.data is Map && (response.data as Map).isNotEmpty) {
        return DataState.success(
          data: PostModel.fromJson(response.data),
        );
      } else {
        return const DataState.error(message: "No data found");
      }
    } catch (e) {
      return DataState.error(message: "Error: $e");
    }
  }
}
