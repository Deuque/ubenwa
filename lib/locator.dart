import 'package:get_it/get_it.dart';
import 'package:ubenwa_test/controllers/auth_controller.dart';
import 'package:ubenwa_test/controllers/verify_controller.dart';

final locator = GetIt.instance;

void initLocator(){
  locator.registerLazySingleton<AuthController>(() => AuthController());
  locator.registerLazySingleton<VerifyController>(() => VerifyController());
}