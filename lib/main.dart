import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/Home.dart';
import 'package:provider_test/Login.dart';
import 'package:provider_test/SharedPreController.dart';
import './model/cart.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await SharedPreController().getInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(create: (context){
      return cart();
    },
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowMaterialGrid: false,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SharedPreController().getData("login")??false?Home():Login(),
          localizationsDelegates: const[
            AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            // GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'), // English
            Locale('ar'), // Arabic
          ],
          locale: Locale('en'),
        ));
  }
}


