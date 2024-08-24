import 'package:fast8_test/data/source/post_remote_source.dart';
import 'package:fast8_test/domain/entity/post/post_data.dart';
import 'package:fast8_test/domain/mapper/post_mapper.dart';
import 'package:fast8_test/domain/repository/post_repository.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final PostRemoteSource _postRemoteSource;
  final PostMapper _postMapper;

  PostRepositoryImpl(this._postRemoteSource, this._postMapper);

  @override
  Future<DataState<List<PostData>>> getListPost() async {
    final result = await _postRemoteSource.getListPost();
    return result.when(
      success: (data) => DataState.success(
        data: data.map((model) => _postMapper.mapModelToEntity(model)).toList(),
      ),
      error: (message, data, exception, stackTrace, statusCode) =>
          DataState.error(message: message),
    );
  }

  @override
  Future<DataState<PostData>> getPostById(int id) async {
    final result = await _postRemoteSource.getPostById(id);
    return result.when(
      success: (data) => DataState.success(
        data: _postMapper.mapModelToEntity(data),
      ),
      error: (message, data, exception, stackTrace, statusCode) =>
          DataState.error(message: message),
    );
  }
}
