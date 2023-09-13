import 'package:dio/dio.dart';
import 'package:pixabay/constants/constants.dart';
import 'package:pixabay/environment/env.dart';

class PixabayApiService {
  final Dio _dio = Dio();
  String ipAddress = "https://pixabay.com/api/?key=$apiKey&";

  String buildUrl(String path) => '$ipAddress$path';

  ///https://pixabay.com/api/?key=[KEY]=yellow+flowers&image_type=photo
  ///get list of images based on search query
  Future<dynamic> getHits(String searchString) {
    String path =
        'q=$searchString&image_type=photo&per_page=$pixabayApiPerPageReturnNumber';
    return _dio.get(
      buildUrl(path),
      // options: options,
    );
  }
}

Options options = Options(
  followRedirects: false,
  validateStatus: (status) {
    return status! < 500;
  },
);
