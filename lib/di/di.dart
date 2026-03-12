import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_flutter/di/di.config.dart';

final sl = GetIt.instance;

@InjectableInit()
void configureDependencies() => sl.init();
