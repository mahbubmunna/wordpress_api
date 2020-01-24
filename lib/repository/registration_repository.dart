

import 'package:wordpress_api/providers/registration_provider.dart';


class RegistrationRepository{

  static Future<dynamic> postRegistrationInfo(Map registrationInfo) {
    return RegistrationProvider.postRegistrationInfo(registrationInfo);
  }
}