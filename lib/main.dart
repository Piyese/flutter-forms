import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const FormScreen(),
    );
  }
}

class Person {
  late String name;
  late String email;
  late String password;
  late String telNo;
  late String calories;
  Person({
    required this.name,
    required this.email,
    required this.password,
    required this.telNo,
    required this.calories,
  });

  @override
  String toString() {
    return 'Person(name: $name, email: $email, tel: $telNo)';
  }
}

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late String _name;
  late String _email;
  late String _password;
  late String _telNo;
  late String _calories;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Name',
          hintText: 'Makmende Aloice',
          prefixIcon: Icon(Icons.portrait)),
      validator: (String? value) {
        if (value!.isEmpty) {
          return "NAME  IS REQUIRED";
        }
        return null;
      },
      onSaved: (String? value) {
        _name = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Email',
          hintText: 'name@example.com',
          prefixIcon: Icon(Icons.mail)),
      validator: (String? value) {
        if (value!.isEmpty) {
          return "email required";
        }
        if (!RegExp(
                r'([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$')
            .hasMatch(value)) {
          return 'invalid email address';
        }
        return null;
      },
      onSaved: (String? value) {
        _email = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock),
      ),
      obscureText: true,
      // obscuringCharacter: '?',
      validator: (String? value) {
        if (value!.isEmpty) {
          return "password required";
        }

        return null;
      },
      onSaved: (String? value) {
        _password = value!;
      },
    );
  }

  Widget _buildTelNo() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Telephone No.',
        prefixText: '+254 ',
        prefixIcon: Icon(Icons.numbers),
      ),
      maxLength: 9,
      validator: (String? value) {
        if (value!.isEmpty) {
          return "telephone required";
        }

        return null;
      },
      onSaved: (String? value) {
        _telNo = value!;
      },
    );
  }

  Widget _buildCalories() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Calories',
      ),
      validator: (String? value) {
        int calories = int.tryParse(value!) as int;
        if (calories == null || calories <= 0) {
          return 'calories must be greater than 0';
        }
        return null;
      },
      onSaved: (String? value) {
        _calories = value!;
      },
    );
  }

  Widget _buildURL() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'URL',
        prefixIcon: Icon(Icons.unfold_less_rounded),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return "URL required";
        }

        return null;
      },
      onSaved: (String? value) {
        _password = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Demo"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(60, 135, 220, 232),
        ),
        width: 300,
        height: 600,
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildName(),
                  _buildEmail(),
                  _buildPassword(),
                  _buildURL(),
                  _buildTelNo(),
                  _buildCalories(),
                  const SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () {
                      // if form is invalid
                      if (!_formKey.currentState!.validate()) {
                        print('errors my boy');
                        return;
                      }
                      // else
                      _formKey.currentState!.save();
                      Person p = Person(
                          name: _name,
                          email: _email,
                          password: _password,
                          telNo: _telNo,
                          calories: _calories);
                      print(p);

                      _password = '';
                    },
                    child: Text("Submit",
                        style: TextStyle(color: Colors.lightBlue[50])),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
