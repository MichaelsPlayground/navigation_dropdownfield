import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// based on https://flutter.de/artikel/flutter-formulare.html
// https://github.com/coodoo-io/flutter-samples
// edited to null safety
// access to form data

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFormPage(title: 'AES Verschlüsselung'),
    );
  }
}

class MyFormPage extends StatefulWidget {
  MyFormPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Bitte wählen Sie einen Algorithmus';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Diese App demonstriert die symmetrische Verschlüsselung auf Basis des AES Algorithmus.',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Bitte wählen Sie einen Algorithmus aus der Liste aus:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 30),
                  DropdownButtonFormField<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    decoration: InputDecoration(
                      labelText: 'wählen Sie einen Algorithmus',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                      if (dropdownValue == 'AES-256 CBC PBKDF2 encryption') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const Aes256CbcPbkdf2EncryptionRoute()),
                        );
                      }
                      if (dropdownValue == 'AES-256 CBC PBKDF2 decryption') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const Aes256CbcPbkdf2DecryptionRoute()),
                        );
                      }
                    },
                    items: <String>[
                      'Bitte wählen Sie einen Algorithmus',
                      'AES-256 CBC PBKDF2 encryption',
                      'AES-256 CBC PBKDF2 decryption',
                      'AES-256 GCM PBKDF2 encryption',
                      'AES-256 GCM PBKDF2 decryption'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            textStyle: TextStyle(color: Colors.white)),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                Text('bereitgestellt von FlutterCrypto')),
                          );
                        },
                        child: Text('Programmierung'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class Aes256CbcPbkdf2EncryptionRoute extends StatelessWidget {
  const Aes256CbcPbkdf2EncryptionRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AES-256 CBC encryption"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class Aes256CbcPbkdf2DecryptionRoute extends StatelessWidget {
  const Aes256CbcPbkdf2DecryptionRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AES-256 CBC decryption"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
