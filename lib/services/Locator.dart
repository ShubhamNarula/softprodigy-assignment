import 'package:soft_prodigy_assignment/services/NavigationService.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => NavigationService());
}