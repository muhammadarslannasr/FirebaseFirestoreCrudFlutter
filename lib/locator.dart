import 'package:flutter_firebase_crud_oper/services/api.dart';
import 'package:flutter_firebase_crud_oper/viewmodels/crud_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api('products'));
  locator.registerLazySingleton(() => CRUDModel()) ;
}