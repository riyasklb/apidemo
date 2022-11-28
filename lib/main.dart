import 'package:flutter/material.dart';
import 'package:httpp/aps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: myhome(),
    );
  }
}

class myhome extends StatefulWidget {
  myhome({super.key});

  @override
  State<myhome> createState() => _myhomeState();
}

class _myhomeState extends State<myhome> {
  final _numberinputcontroler = TextEditingController();

  String _resulttext = 'type number and press get result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _numberinputcontroler,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Type something'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final _number = _numberinputcontroler.text;
                  final _result = await getnumber(num: _number);
                  setState(() {
                    _resulttext = _result.text ?? 'no text';
                  });
                },
                child: Text('get result'),
              ),
              Text(_resulttext)
            ],
          ),
        ),
      ),
    );
  }
}
