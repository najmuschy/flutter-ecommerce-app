import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

part 'network_response.dart';

class NetworkClient{

  final VoidCallback onUnAuthorize;
  final Map<String, String> Function() commonHeaders;
  final Logger logger = Logger();
  final String _defaultErrorMessage = 'Something went wrong';
  NetworkClient({required this.onUnAuthorize, required this.commonHeaders});

  Future<NetworkResponse> getRequest (String url,) async{

    Uri uri = Uri.parse(url);

    requestLogger(url, headers: commonHeaders());
    Response response = await get(uri, headers: commonHeaders());
    if(response.statusCode == 200 || response.statusCode == 201){
      final responseBody = json.decode(response.body);
      responseLogger(response) ;
      return NetworkResponse(statusCode: response.statusCode, data: responseBody, isSuccess: true);
    }
    else if(response.statusCode == 401){
      responseLogger(response) ;
      return NetworkResponse(statusCode: response.statusCode, errorMessage: 'Unauthorized', isSuccess: false);
    }

    else{
      final responseBody = json.decode(response.body);
      responseLogger(response);
      return NetworkResponse(statusCode: response.statusCode, errorMessage: responseBody['message'], isSuccess: false);
    }

}

  Future<NetworkResponse> postRequest (String url, Map<String,dynamic> body) async{

    Uri uri = Uri.parse(url);

    requestLogger(url, headers: commonHeaders(), body: body);
    Response response = await post(uri, headers: commonHeaders(), body: jsonEncode(body));
    if(response.statusCode == 200 || response.statusCode == 201){
      final responseBody = json.decode(response.body);
      responseLogger(response) ;
      return NetworkResponse(statusCode: response.statusCode, data: responseBody, isSuccess: true);
    }
    else if(response.statusCode == 401){
      onUnAuthorize();
      responseLogger(response) ;
      return NetworkResponse(statusCode: response.statusCode, errorMessage: 'Unauthorized', isSuccess: false);
    }
    else{
      responseLogger(response);
      final responseBody = jsonDecode(response.body) ;
      return NetworkResponse(statusCode: response.statusCode, errorMessage: responseBody['msg']??_defaultErrorMessage, isSuccess: false);
    }

  }

  Future<NetworkResponse> putRequest (String url, Map<String,dynamic> body) async{

    Uri uri = Uri.parse(url);

    requestLogger(url, headers: commonHeaders(), body: body);
    Response response = await put(uri, headers: commonHeaders(), body: jsonEncode(body));
    if(response.statusCode == 200 || response.statusCode == 201){
      final responseBody = json.decode(response.body);
      responseLogger(response) ;
      return NetworkResponse(statusCode: response.statusCode, data: responseBody, isSuccess: true);
    }
    else if(response.statusCode == 401){
      onUnAuthorize();
      responseLogger(response) ;
      return NetworkResponse(statusCode: response.statusCode, errorMessage: 'Unauthorized', isSuccess: false);
    }
    else{
      responseLogger(response);
      final responseBody = jsonDecode(response.body) ;
      return NetworkResponse(statusCode: response.statusCode, errorMessage: responseBody['msg']??_defaultErrorMessage, isSuccess: false);
    }

  }

  Future<NetworkResponse> patchRequest (String url, Map<String,dynamic> body) async{

    Uri uri = Uri.parse(url);

    requestLogger(url, headers: commonHeaders(), body: body);
    Response response = await patch(uri, headers: commonHeaders(), body: jsonEncode(body));
    if(response.statusCode == 200 || response.statusCode == 201){
      final responseBody = json.decode(response.body);
      responseLogger(response) ;
      return NetworkResponse(statusCode: response.statusCode, data: responseBody, isSuccess: true);
    }
    else if(response.statusCode == 401){
      onUnAuthorize();
      responseLogger(response) ;
      return NetworkResponse(statusCode: response.statusCode, errorMessage: 'Unauthorized', isSuccess: false);
    }
    else{
      responseLogger(response);
      final responseBody = jsonDecode(response.body) ;
      return NetworkResponse(statusCode: response.statusCode, errorMessage: responseBody['msg']??_defaultErrorMessage, isSuccess: false);
    }

  }

  Future<NetworkResponse> deleteRequest (String url) async{

    Uri uri = Uri.parse(url);

    requestLogger(url, headers: commonHeaders());
    Response response = await delete(uri, headers: commonHeaders());
    if(response.statusCode == 200 || response.statusCode == 201){
      final responseBody = json.decode(response.body);
      responseLogger(response) ;
      return NetworkResponse(statusCode: response.statusCode, data: responseBody, isSuccess: true);
    }
    else if(response.statusCode == 401){
      onUnAuthorize();
      responseLogger(response) ;
      return NetworkResponse(statusCode: response.statusCode, errorMessage: 'Unauthorized', isSuccess: false);
    }
    else{
      responseLogger(response);
      final responseBody = jsonDecode(response.body) ;
      return NetworkResponse(statusCode: response.statusCode, errorMessage: responseBody['msg']??_defaultErrorMessage, isSuccess: false);
    }

  }

  





  void requestLogger(url, {Map<String, String>? headers, Map<String, dynamic>? body}){
    logger.i('''
      url : $url,
      headers : $headers,
      body : $body
    ''');
  }
  void responseLogger(response){
    logger.i('''
      url : ${response.request?.url}
      statusCode : ${response.statusCode},
      headers : ${response.headers},
      body : ${response.body}
    ''');

  }
}