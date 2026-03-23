// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
// import 'package:logger/logger.dart';
// import 'package:troodking_app/shared/helpers/global_helper.dart';
// import 'package:troodking_app/shared/models/general_response.dart';

// import 'package:troodking_app/shared/providers/functional_provider.dart';

// class InterceptorHttp {
//   static final InterceptorHttp _instance = InterceptorHttp._internal();
//   factory InterceptorHttp() => _instance;

//   final timeInit = DateTime.now();

//   InterceptorHttp._internal();

//   int activeRequests = 0;

//   bool _isRefreshing = false;
//   Completer<void>? _refreshCompleter;

//   Future<GeneralResponse> request(
//     BuildContext? context,
//     String method,
//     String urlEndPoint,
//     dynamic body, {
//     bool showLoading = true,
//     bool isWithoutToken = false,
//     int timeOut = 90,
//     Map<String, dynamic>? queryParameters,
//     List<http.MultipartFile>? multipartFiles,
//     Map<String, String>? multipartFields,
//     String requestType = "JSON",
    
//     Function(int sentBytes, int totalBytes)? onProgressLoad,
//   }) async {
//     var logger = Logger(printer: PrettyPrinter(methodCount: 0, printEmojis: false));
//     final urlService = Environment().config?.serviceUrl ?? "no url";

//     FunctionalProvider? fp;

//     String url = '';

//     queryParameters != null ? 
//       url = "$urlService$urlEndPoint?${Uri(queryParameters: queryParameters).query}" :  
//       url = "$urlService$urlEndPoint";

//     logger.t('URL: $url');
//     body != null
//         ? logger.log(Level.warning, 'body: ${json.encode(body)}')
//         : null;

//     GeneralResponse generalResponse =
//         GeneralResponse(data: null, message: "", error: true);

//     if (context != null) fp = Provider.of<FunctionalProvider>(context, listen: false);

//     final keyLoading = GlobalHelper.genKey();
//     final keyError = GlobalHelper.genKey();

//     String? messageButton;
//     void Function()? onPress;
//     String responseBody = "";


//     try {

//       // if (!await CheckConnectionService().hasInternetConnectionFast()){
//       //   fp!.modeOffline = true;
//       //   log('Mode offline');
//       // } else{
//       //   log('Mode online');
//       // }

//       if (context != null) activeRequests++;

//       http.Response response;
//       Uri uri = Uri.parse(url);

//       if (showLoading) {
//         if (context != null) {
//           //debugPrint("KeyLoading del interceptor: $keyLoading");
//           fp!.showAlert(key: keyLoading, content: const AlertLoading());
//           // fp.alertLoading = [const SizedBox()];
//           // await Future.delayed(const Duration(milliseconds: 600));
//         }
//       }

//       //? Envio de TOKEN
//       LoginResponse? userData = await SecurityStorage().getUserData();

//       String tokenSesion = "";

//       if (userData != null) {
//         tokenSesion = userData.token!;
//       }

//       Map<String, String> headers = {
//         "Content-Type": "application/json",
//         "Authorization": (requestType == 'JSON') ? 'Bearer $tokenSesion' : 'Bearer $tokenSesion',
//         "Srv-App-V" : Environment.versionApp
//       };

//       Map<String, String> headersWithoutToken = {
//         "Content-Type": "application/json",
//         "Srv-App-V" : Environment.versionApp
//       };

//       int responseStatusCode = 0;

//       switch (requestType) {
//         case "JSON":
//           switch (method) {
//             case "POST":
//               response = await http.post(uri,
//                   headers: isWithoutToken ? headersWithoutToken : headers,
//                   body: body != null ? json.encode(body) : null).timeout(Duration(seconds: timeOut));
//               log(jsonEncode(' $headers'));
//               break;
//             case "GET":
//               response = await http.get(uri, headers: headers).timeout(Duration(seconds: timeOut));
//               log(jsonEncode(headers));
//               break;
//             case "PUT":
//               response = await http.put(uri,
//                   headers: headers,
//                   body: body != null ? json.encode(body) : null);
//               break;
//             case "PATCH":
//               response = await http.patch(uri,
//                   headers: headers,
//                   body: body != null ? json.encode(body) : null);
//               break;

//             default:
//               response = await http.post(uri, body: jsonEncode(body));
//               break;
//           }
//           // responseStatusCode = _response.statusCode;
//           responseBody = response.body;
//           responseStatusCode = json.decode(responseBody)["code"] ?? json.decode(responseBody)["status"];

//           //log(json.encode(responseBody.toString()));
//           //logger.f(responseBody);
//           //Logger(printer: SimplePrinter(colors: true), level: Level.trace).w(json.decode(responseBody));
//           logger.log(Level.trace, json.decode(responseBody));

//           break;
//         case "FORM":
//           final httpClient = getHttpClient();
//           final request = await httpClient.postUrl(Uri.parse(url));

//           int byteCount = 0;
//           var requestMultipart = http.MultipartRequest(method, Uri.parse(url));
//           // print("requesMult");
//           if (multipartFiles != null) {
//             requestMultipart.files.addAll(multipartFiles);
//           }
//           if (multipartFields != null) {
//             requestMultipart.fields.addAll(multipartFields);
//           }

//           headers.forEach((key, value) {
//             request.headers.set("token", tokenSesion);
//           });

//           var msStream = requestMultipart.finalize();

//           var totalByteLength = requestMultipart.contentLength;

//           request.contentLength = totalByteLength;

//           request.headers.set(HttpHeaders.contentTypeHeader,
//               requestMultipart.headers[HttpHeaders.contentTypeHeader]!);

//           Stream<List<int>> streamUpload = msStream.transform(
//             StreamTransformer.fromHandlers(
//               handleData: (data, sink) {
//                 sink.add(data);

//                 byteCount += data.length;

//                 if (onProgressLoad != null) {
//                   onProgressLoad(byteCount, totalByteLength);
//                 }
//               },
//               handleError: (error, stack, sink) {
//                 generalResponse.error = true;
//                 throw error;
//               },
//               handleDone: (sink) {
//                 sink.close();
//                 // UPLOAD DONE;
//               },
//             ),
//           );

//           await request.addStream(streamUpload);

//           final httpResponse = await request.close();
//           var statusCode = httpResponse.statusCode;

//           responseStatusCode = statusCode;
//           if (statusCode ~/ 100 != 2) {
//             throw Exception(
//                 'Error uploading file, Status code: ${httpResponse.statusCode}');
//           } else {
//             await for (var data in httpResponse.transform(utf8.decoder)) {
//               responseBody = data;
//             }
//           }
//           break;
//       }

//       //logger.t('statusCode: ${responseStatusCode.toString()}');

//       switch (responseStatusCode) {
//         case 200:
//           var responseDecoded = json.decode(responseBody);
//           generalResponse.data = responseDecoded["data"];
//           //final keySesion = GlobalHelper.genKey();
//           generalResponse.error = false;
//           generalResponse.message = responseDecoded["message"];
//           // if (context != null) {

//           //     fp!.clearAllAlert();
//           // }
//           break;
//         case 307:
//           var responseDecoded = json.decode(responseBody);
//           generalResponse.error = true;
//           generalResponse.message = "Ocurrió un error al consultar con los servicios. Intente con una red que le permita el acceso";
//           generalResponse.devMessage = responseDecoded["devMessage"];
//           if (context != null) {
//             loadingDismiss(fp!, keyLoading, timeInit);
//           }
//           break;
//         case 400:
//           var responseDecoded = json.decode(responseBody);
//           generalResponse.error = true;
//           generalResponse.message = responseDecoded["message"];
//           generalResponse.devMessage = responseDecoded["devMessage"];
//           if (context != null) {
//             fp!.clearAllAlert();
//             loadingDismiss(fp, keyLoading, timeInit);
//           }
//           break;
//         case 401:
//           // generalResponse.message ='Su sesión ha caducado, vuelva a iniciar sesión.';
//           // generalResponse.error = true;
//           // messageButton = 'Volver a ingresar';
//           // onPress = () async {
//           //   fp.clearAllAlert();
//           //   Navigator.pushAndRemoveUntil(context, GlobalHelper.navigationFadeIn(context, const LoginPage()), (route) => false);
//           //   //Navigator.pushReplacement(context, GlobalHelper.navigationFadeIn(context, const LoginPage()));
//           //   await UserDataStorage().removeUserData();
//           //   await UserDataStorage().removeUserCredentials();
//           //   AlertProfileWidget.patientDataResponse = null;
//           //   //fp.dismissAlert(key: LayoutHomeWidget.keyModalProfile);
//           // };
//           //  fp.dismissAlertLoading(key: keyLoading);
//           break;
//         case 403:
//           if (!_isRefreshing) {
//             _isRefreshing = true;
//             _refreshCompleter = Completer<void>();

//             try {
//                               log('hola 1');

//               RefreshTokenRequest refreshTokenRequest = RefreshTokenRequest();
//               refreshTokenRequest.refreshToken = userData!.refreshToken ?? '';

//               final result = await RefreshTokenService().refreshToken(context, refreshTokenRequest);

//               if (result.data != null) {
//                 _refreshCompleter!.complete();
//               } else {
//                 _refreshCompleter!.completeError("Refresh token inválido");
//                 return generalResponse;
//               }
//             } catch (e) {
//               _refreshCompleter!.completeError(e);
//               return generalResponse;
//             } finally {
//               _isRefreshing = false;
//             }
//           } else {
//             try { 
//               if (context != null) {
//                 await fp!.clearAllAlert();
//                 fp.showAlert(
//                 key: keyError,
//                 content: AlertGeneric(
//                     content: WarningAlert(
//                       keyToClose: keyError,
//                       title: 'Advertencia',
//                       message: 'Error al refrescar el token, vuelva a iniciar sesión',
//                       onPressed: () async {
//                         await fp!.clearAllAlert();
//                         Navigator.pushAndRemoveUntil(
//                             context,
//                             GlobalHelper.navigationFadeIn(
//                                 context, const LoginPage()),
//                             (route) => false);
//                         await SecurityStorage().removeUserData();
//                         await GlobalHelper.deleteAllOfflineData();
//                       },
//                       isWithoutButton: false,
//                     ),
//                   ),
//                 );
//                await _refreshCompleter!.future;
//               }
              

//             } catch (e) {
//               log("Refresh token falló: $e");
//               return generalResponse;
//             }
//           }

//           generalResponse.error = false;
//           if (context != null) loadingDismiss(fp!, keyLoading, timeInit);
//           return request(context, method, urlEndPoint, body, queryParameters: queryParameters);
//         case 404:
//           var responseDecoded = json.decode(responseBody);
//           generalResponse.error = true;
//           generalResponse.message = responseDecoded["message"];
//           generalResponse.devMessage = responseDecoded["devMessage"];
//           if (context != null) loadingDismiss(fp!, keyLoading, timeInit);
//           break;
//         case 426:        
//           var responseDecoded = json.decode(responseBody);
//           generalResponse.error = true;
//           generalResponse.message = responseDecoded["message"];
//               fp!.showAlert(
//                 key: keyError,
//                 content: AlertGeneric(
//                   content: WarningAlert(
//                     keyToClose: keyError,
//                     title: 'Advertencia',
//                     message: generalResponse.message,
//                     onPressed: onPress,
//                     isWithoutButton: true,
//                   ),
//                 ),
//               );
            
//           break;
//         case 503: 
//           var responseDecoded = json.decode(responseBody);
//           generalResponse.error = true;
//           generalResponse.message = responseDecoded["message"];
//           generalResponse.devMessage = responseDecoded["devMessage"];
//           if (context != null) loadingDismiss(fp!, keyLoading, timeInit);
//           break;

//         default:
//           generalResponse.error = true;
//           generalResponse.message = json.decode(responseBody)["message"];
//           if (context != null) loadingDismiss(fp!, keyLoading, timeInit);
//           break;
//       }
//     } on TimeoutException catch (e) {
//       debugPrint('$e');
//       generalResponse.error = true;
//       generalResponse.message = 'Tiempo de conexión excedido.';
//       if (context != null) loadingDismiss(fp!, keyLoading, timeInit);
//     } on FormatException catch (ex) {
//       generalResponse.error = true;
//       generalResponse.message = "Ocurrió un error al consultar el servicio. Contáctese con el administrador";

//       debugPrint(ex.toString());
//       if (context != null) loadingDismiss(fp!, keyLoading, timeInit);
//     } on SocketException catch (exSock) {
//       logger.e("Error por conexion: $exSock");

//       if (context != null) {
//         loadingDismiss(fp!, keyLoading, timeInit);
//         generalResponse.error = true;
//         generalResponse.message =
//             "Verifique su conexión a internet y vuelva a intentar.";
//         onPress = () {
//           fp!.clearAllAlert();
//           fp.dismissLastPage();
//         };
//       }
//     } on Exception catch (e, stacktrace) {
//       var responseDecoded = json.decode(responseBody);
//       logger.e("Error en request: $stacktrace");
//       //debugPrint("Error en request -> ${stacktrace.toString()}");
//       generalResponse.error = true;
//       generalResponse.message = "Ocurrio un error, vuelva a intentarlo.";
//       generalResponse.devMessage = responseDecoded["devMessage"];

//       if (context != null) loadingDismiss(fp!, keyLoading, timeInit);
//     } finally {
//       if (context != null) --activeRequests;
//       if (showLoading && activeRequests == 0 && context != null) {
//          fp!.clearAllAlert();
//       }
//     }

//     if (!generalResponse.error) {
//       if (showLoading && activeRequests == 1) {
//         if (context != null) {
//           loadingDismiss(fp!, keyLoading, timeInit);
//         }
//       }
//     } else {
//       if (context != null) {
//         if (!fp!.modeOffline) {
//           fp.showAlert(
//             key: keyError,
//             content: AlertGeneric(
//               content: ErrorGeneric(
//                 keyToClose: keyError,
//                 message: generalResponse.message,
//                 messageButton: messageButton,
//                 onPress: onPress,
//               ),
//             ),
//           );
//         }
//       }
//     }
//     return generalResponse;
//   }

//   HttpClient getHttpClient() {
//     bool trustSelfSigned = true;
//     HttpClient httpClient = HttpClient()
//       ..connectionTimeout = const Duration(seconds: 10)
//       ..badCertificateCallback =
//           ((X509Certificate cert, String host, int port) => trustSelfSigned);

//     return httpClient;
//   }

//   Future<String> readResponseAsString(HttpClientResponse response) {
//     var completer = Completer<String>();
//     var contents = StringBuffer();
//     response.transform(utf8.decoder).listen((String data) {
//       contents.write(data);
//       // print(data);
//     }, onDone: () => completer.complete(contents.toString()));
//     return completer.future;
//   }

//   Future<void> loadingDismiss(FunctionalProvider fp,
//       GlobalKey<State<StatefulWidget>> keyLoading, DateTime timeInit) async {
//     if (DateTime.now().add(const Duration(milliseconds: -400)).compareTo(timeInit) <
//         0) {
//       await Future.delayed(const Duration(milliseconds: 600));
//     }
//     fp.dismissAlert(key: keyLoading);
//   }
// }
