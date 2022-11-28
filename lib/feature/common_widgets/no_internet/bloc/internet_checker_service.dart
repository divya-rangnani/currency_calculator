import 'dart:io';

class InternetConnectionCheckerService {
  //static int secDelay = 5;
  static get hasConnection async {
    const Duration _CONNECTIVITY_TIMEOUT = Duration(seconds: 1);

    try {
      final result1 = await InternetAddress.lookup('google.com')
          .timeout(_CONNECTIVITY_TIMEOUT);
      final result2 = await InternetAddress.lookup('facebook.com')
          .timeout(_CONNECTIVITY_TIMEOUT);

      if ((result1.isNotEmpty && result1.first.rawAddress.isNotEmpty) ||
          (result2.isNotEmpty && result2.first.rawAddress.isNotEmpty)) {
        // secDelay = 5;
        return true;
      }
    } catch (e) {
      // secDelay = 5;

      print(e);
    }
    return false;
  }

  static Stream<bool> get onStatusChange =>
      Stream.periodic(const Duration(seconds: 1)).asyncMap<bool>((c) async {
        return await hasConnection;
      }).distinct();
}
