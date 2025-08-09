import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'app/app.dart';
import 'package:firebase_core/firebase_core.dart' ;
import 'firebase_options.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart' ;
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Firebase.initializeApp();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(const CraftyBay());
}

// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
// import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
// import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
// import 'package:flutter_sslcommerz/sslcommerz.dart';
//
// void main(){
//   return runApp(MyApp()) ;
//
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       theme: ThemeData(
//         primaryColor: Colors.blue,
//
//         scaffoldBackgroundColor: Colors.white
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter SSLCommerz', style: TextStyle(color: Colors.black),),
//         ),
//         body: Column(
//           children: [
//             TextButton(onPressed: payNow, child: Text('Pay Now', style: TextStyle(color: Colors.black)),)
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> payNow() async {
//     Sslcommerz sslcommerz = Sslcommerz(
//         initializer: SSLCommerzInitialization(
//           //   ipn_url: "www.ipnurl.com",
//             multi_card_name: "visa,master,bkash",
//             currency: SSLCurrencyType.BDT,
//             product_category: "Any",
//             sdkType: SSLCSdkType.TESTBOX,
//             store_id: "cratf6895ba7cef528",
//             store_passwd: "cratf6895ba7cef528@ssl",
//             total_amount: 100.0,
//             tran_id: Random().hashCode.toString()));
//
//     final response = await sslcommerz.payNow() ;
//     if(response.status== 'VALID'){
//       print('valid');
//     }
//     else if(response.status=='FAILED'){
//       print('failed');
//     }
//     else{
//       print('something went wrong');
//     }
//   }
// }
