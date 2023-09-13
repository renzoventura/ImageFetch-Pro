import 'package:get_it/get_it.dart';
import 'package:pixabay/service/api/pixabay_api_service.dart';

GetIt getIt = GetIt.instance;

Future<void> setUpDependencies() async {
  getIt.registerSingleton(PixabayApiService());
}
