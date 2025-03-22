import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:real_estate_admin/core/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true
)
void configureDependencies() => getIt.init();

