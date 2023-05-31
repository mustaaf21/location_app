import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var classSnap;
var classSnap2;

class locationFinal extends StatefulWidget {
  const locationFinal({super.key});

  @override
  State<locationFinal> createState() => _locationFinalState();
}

class _locationFinalState extends State<locationFinal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
                  child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: () {
                getdata();
                getdata2();
              },
              child: const Text('to retrive location')),
          ElevatedButton(
              onPressed: () async {
                await _launchURL();
              },
              child: const Text('To launch maps')),
        ],
      )))),
    );
  }
}

//lOCATION VIEWER FUNCTION

Future<void> _launchURL() async {
  final uri = Uri.parse(
      "http://maps.google.com/maps?q=${classSnap.data()!['New add'].toString()},${classSnap2.data()!['New add'].toString()}");
  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw "Can not launch url";
  }
}

Future getdata() async {
  classSnap =
      await FirebaseFirestore.instance.collection('users').doc("My file").get();
}

Future getdata2() async {
  classSnap2 = await FirebaseFirestore.instance
      .collection('user2')
      .doc("My file2")
      .get();
}
