import 'package:dio/dio.dart';
import 'package:surf_practice_magic_ball/eightball_api/src/models/fortune_reading_rm.dart';
import 'package:surf_practice_magic_ball/eightball_api/src/url_builder.dart';

class EightballApi {
  EightballApi()
      : _dio = Dio(),
        _urlBuilder = UrlBuilder();

  final Dio _dio;
  final UrlBuilder _urlBuilder;

  Future<FortuneReadingRM> getFortuneReading() async {
    final url = _urlBuilder.buildGetFortuneReadingUrl();
    final response = await _dio.get(url);
    final jsonObject = response.data;
    final fortuneReading = FortuneReadingRM.fromJson(jsonObject);

    return fortuneReading;
  }
}
