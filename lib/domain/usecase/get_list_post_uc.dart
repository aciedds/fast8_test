import 'package:fast8_test/domain/entity/post/post_data.dart';
import 'package:fast8_test/domain/repository/post_repository.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetListPostUc {
  final PostRepository _postRepository;

  GetListPostUc(this._postRepository);

  Future<DataState<List<PostData>>> call() async =>
      await _postRepository.getListPost();
}
