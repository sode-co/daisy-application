// import 'package:daisy_application/core_services/common/response_handler.dart';
// import 'package:daisy_application/core_services/models/authentication/authentication_model.dart';
// import 'package:daisy_application/service_locator/locator.dart';
// import 'package:dio/dio.dart';

// import '../persistent/authentication_persistent.dart';

// class Sandbox {
//   static AuthenticationModel? _auth = null;

//   static AuthenticationModel get auth {
//     if (_auth == null) {
//       AuthenticationPersistent authService = locator.get();
//       _auth = authService.getCurrentAuth();
//     }

//     return _auth!;
//   }

//   static Future<Result<T>> inside<T extends dynamic>(Future<Result<T>> Function(Sandbox) command) async {
//     FAILURE_TYPE type = FAILURE_TYPE.NONE;
//     try {
//       final result = await command(Sandbox());

//       return result;
//     } catch (Exception e) {
//     }

//   }

//   void _handleRefreshTokenExpired() {

//   }

//   void _handleAccessTokenExpired () {

//   }

//   T getClient<T extends Object>() {
//     Map<String, dynamic> headers =  {
//       'Authorization': 'Bearer ${_auth!.accessToken}'
//     };

//     Dio dio = locator.get(param1: headers);
//     return locator.get<T>(param1: dio);
//   }
// }
