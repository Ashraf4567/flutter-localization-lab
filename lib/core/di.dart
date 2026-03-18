import 'package:get_it/get_it.dart';
import 'package:localization_lab/core/data/local_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> setupDependencyInjection() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  serviceLocator
  .registerSingleton<SharedPreferences>(sharedPreferences);

  serviceLocator
  .registerSingleton<LocalRepo>(
    LocalRepo(sharedPreferences: serviceLocator<SharedPreferences>())
    );
}