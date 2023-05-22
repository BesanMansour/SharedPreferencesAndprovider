import 'package:flutter/material.dart';
import 'package:provider_test/Home.dart';
import 'package:provider_test/SharedPreController.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool b = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("User Name",
                style:
                TextStyle(color: Colors.black, fontSize: 14)),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: "Besan Mansour",
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                  ),
                  hintTextDirection: TextDirection.ltr,
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                          style: BorderStyle.solid)),
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid))),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 20,),
            Text("Email",
                style:
                TextStyle(color: Colors.black, fontSize: 14)),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: "besan@gmail.com",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  hintTextDirection: TextDirection.ltr,
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                          style: BorderStyle.solid)),
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid))),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                Checkbox(
                    value: b,
                    onChanged: (value){
                  setState(() {
                    b = value!;
                  });
                }),
                SizedBox(width: 10,),
                Text("Remember me?"),
              ],
            ),
            SizedBox(height: 20,),
            Align(
              alignment: AlignmentDirectional.center,
              child: ElevatedButton(onPressed: () async {
                if(b){
                 SharedPreController c = SharedPreController();
                 await c.getInit();
                 c.setData(key: "login",value: b);
                 Navigator.of(context)
                     .push(MaterialPageRoute(builder: (context) {
                   return Home();
                 }));
                }
                else{
                  SharedPreController c = SharedPreController();
                  await c.getInit();
                  c.setData(key: "login",value: b);
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return Home();
                  // })
                  // );
                }
              }, child: Text("Login")),
            )
          ],),
        ),
      ),
    );
  }
}
