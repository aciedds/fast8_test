import 'package:fast8_test/data/model/post_model/post_model.dart';
import 'package:fast8_test/domain/entity/post/post_data.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PostMapper {
  PostData mapModelToEntity(PostModel model) {
    return PostData(
      userId: model.userId ?? 0,
      id: model.id ?? 0,
      title: model.title ?? '',
      body: model.body ?? '',
    );
  }

  PostModel mapEntityToModel(PostData entity) {
    return PostModel(
      userId: entity.userId,
      id: entity.id,
      title: entity.title,
      body: entity.body,
    );
  }
}
