import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Hoom());
}
class Hoom extends StatelessWidget {
  const Hoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyApp(),title: "phlan",);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 static const NAME_KEY = "name";
 SharedPreferences? pref;
 var nameController = TextEditingController();
 _MyAppState()
 {
   getSharePref();
 }
  Future<void> getSharePref() async
  {
    pref= await SharedPreferences.getInstance();
  }

 Future<void> setName(String x) async
 {
   try {
     await pref?.setString('name', x);
     print ("succefully saved $x");
   }
   catch(error)
   {
     print("Error ${error.toString()}");
   }
 }
 void getName()
 {
   String? name = pref?.getString('name');
   nameController.text = name ?? "Tomato";
   setState(() {

   });
 }
 @override
 void initState()
 {
   getName();
   super.initState();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("name"),
              ),
              controller: nameController,
              textInputAction: TextInputAction.go,
              onFieldSubmitted: (name) => setName(name),
            ),
          ],
        ),
      ),
    );
  }
}
