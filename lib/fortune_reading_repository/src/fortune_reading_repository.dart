import 'package:surf_practice_magic_ball/domain_models/domain_models.dart';
import 'package:surf_practice_magic_ball/eightball_api/eightball_api.dart';
import 'package:surf_practice_magic_ball/fortune_reading_repository/src/mappers/remote_to_domain.dart';

class FortuneReadingRepository {
  FortuneReadingRepository({
    required this.eightballApi,
  });

  final EightballApi eightballApi;

  Future<FortuneReading> getFortuneReadingFromNetwork() async {
    try {
      final apiFortuneReading = await eightballApi.getFortuneReading();
      final domainFortuneReading = apiFortuneReading.toDomainModel();

      return domainFortuneReading;
    } catch (_) {
      throw Exception();
    }
  }
}
