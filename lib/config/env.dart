import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(obfuscate: true)
abstract class ENV {
  @EnviedField()
  static final String ENDPOINT = _ENV.ENDPOINT;

  @EnviedField()
  static final String DEPARTMENT_SERVICE = _ENV.DEPARTMENT_SERVICE;
}
