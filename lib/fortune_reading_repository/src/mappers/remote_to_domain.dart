import 'package:surf_practice_magic_ball/domain_models/domain_models.dart';
import 'package:surf_practice_magic_ball/eightball_api/eightball_api.dart';

extension FortuneReadingToDomain on FortuneReadingRM {
  FortuneReading toDomainModel() {
    return FortuneReading(
      text: text,
    );
  }
}
