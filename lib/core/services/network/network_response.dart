part of 'network_client.dart';

class NetworkResponse{

  final int statusCode ;
  final Map<String, dynamic>? data ;
  final String? errorMessage;
  final bool isSuccess ;

  NetworkResponse({required this.statusCode,  this.data,  this.errorMessage, required this.isSuccess});

}