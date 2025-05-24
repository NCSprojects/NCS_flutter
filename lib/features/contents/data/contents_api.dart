// contents_api.dart
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:ncs/features/contents/data/contents_model.dart';

import '../../../core/utils/host.dart';

part 'contents_api.g.dart';

@RestApi(baseUrl: "$host:3400/contents")
abstract class ContentsApi {
  factory ContentsApi(Dio dio, {String baseUrl}) = _ContentsApi;

  @GET("/{floor}")
  Future<Contents> getContentsByFloor(@Path("floor") int floor);
}