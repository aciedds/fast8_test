import 'package:fast8_test/domain/entity/post/post_data.dart';
import 'package:fast8_test/domain/repository/post_repository.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPostUc {
  final PostRepository _postRepository;

  GetPostUc(this._postRepository);

  Future<DataState<PostData>> call(int id) async =>
      await _postRepository.getPostById(id);
}
