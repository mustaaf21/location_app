import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gmapsfinal/locationpage.dart';
import 'firebase_options.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

var lat;
var long;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Location App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void getlocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print('NEW NEW NEW NEW NEW');
    print(position);
    lat = position.latitude;
    long = position.longitude;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Center(
          child: Column(children: [
            const SizedBox(height: 250),
            ElevatedButton(
                onPressed: getlocation, child: const Text("Get Location")),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () async {
                  await addUserDetails(lat.toString());
                  await addUserDetails2(long.toString());
                },
                child: const Text('UPDATE LOCATION TO CLOUD')),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => locationFinal()),
                  );
                },
                child: const Text('owner page')),
          ]),
        ),
      ),
    );
  }
}

//This is to upload data to the cloud

Future addUserDetails(String Newadd) async {
  await FirebaseFirestore.instance.collection('users').doc("My file").set({
    'New add': Newadd,
  });
}

Future addUserDetails2(String Newadd) async {
  await FirebaseFirestore.instance.collection('user2').doc("My file2").set({
    'New add': Newadd,
  });
}
