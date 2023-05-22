// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPreController {
//   late SharedPreferences? prefs;
//   static SharedPreController? inctance;
//
//   SharedPreController._init();
//
//   factory SharedPreController() {
//     // if (inctance == null) {
//     //   inctance = SharedPreController._init();
//     // }
//     // return inctance!;
//     return inctance??= SharedPreController._init();
//   }
//
//   getInit() async {
//     prefs = await SharedPreferences.getInstance();
//   }
//
//   setData({key, value}) {
//     if (value is int) {
//       prefs?.setInt(key, value);
//     } else if (value is String) {
//       prefs?.setString(key, value);
//     } else if (value is bool) {
//       prefs?.setBool(key, value);
//     } else if (value is double) {
//       prefs?.setDouble(key, value);
//     }
//   }
//
//   // T getData<T>(key) {
//   //   return prefs!.get(key) as T;
//   // }
//
//   T? getData<T>(String key) {
//     if (T == int) {
//       return prefs?.getInt(key) as T?;
//     } else if (T == String) {
//       return prefs?.getString(key) as T?;
//     } else if (T == bool) {
//       return prefs?.getBool(key) as T?;
//     } else if (T == double) {
//       return prefs?.getDouble(key) as T?;
//     } else {
//       throw Exception('Invalid data type');
//     }
//   }
//
// }
//
//
//
//

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreController{

  late SharedPreferences prefs;
  static SharedPreController? inctance;

  SharedPreController._init();

  factory SharedPreController(){
    // if(inctance == null){
    //   inctance = SharedPreController._init();
    // }else{
    //   return inctance!;
    // }
    return inctance ??= SharedPreController._init();
  }

  getInit() async {
    prefs = await SharedPreferences.getInstance();
    // if(!prefs.containsKey("login"))
    //   prefs.setBool("login", false);
  }

  setData({key, value}){
    if(value is int){
      prefs.setInt(key, value);
    }else if(value is String){
      prefs.setString(key, value);

    }else if(value is bool){
      prefs.setBool(key, value);

    }else if(value is double){
      prefs.setDouble(key, value);
    }
  }

  G getData<G>(key){
    return prefs.get(key) as G;
  }
}
