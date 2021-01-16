import 'package:aquarium/sign_in_flow/screens/register_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _email, _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _showError(FirebaseAuthException error) {
    String message;
    switch (error.code) {
      case "wrong-password":
        message = 'Wrong email password combination';
        break;
      case "weak-password":
        message = "The password is too weak (6 characters at least)";
        break;
      case "invalid-email":
        message = "The email is invalid";
        break;
      case "too-many-requests":
        message = "Too many login attempts. Try again later.";
        break;
      default:
        message = "AUTH ERROR: '${error.code}'";
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
    } on FirebaseAuthException catch (e) {
      _showError(e);
    } catch (e) {
      print("OTHER ERROR: $e");
    }
  }

  void _createUserWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      _showError(e);
    } catch (e) {
      print("OTHER ERROR: $e");
    }
  }

  Widget _buildErrorPage(String error) {
    return Center(
      child: Text(
        error,
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSignIn(QuerySnapshot snapshot) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 28,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                  ),
                ),
              ),
              SizedBox(height: 32),
              FlatButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: _signInWithEmailAndPassword,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Need an account?'),
                  SizedBox(width: 10),
                  FlatButton(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(
                        MaterialPageRoute(
                          builder: (_) => RegisterScreen(),
                        ),
                      )
                          .then((result) {
                        _createUserWithEmailAndPassword(
                          result.email,
                          result.password,
                        );
                        FirebaseFirestore.instance
                            .collection('Aquariums')
                            .doc('${result.email}')
                            .set({
                          'DesiredVariables': {
                            'Amoniaco': 0,
                            'Calcio': 0,
                            'Carbonatos': 0,
                            'Fosfatos': 0,
                            'Magnesio': 0,
                            'Nitratos': 0,
                            'Nitritos': 0,
                            'Potasio': 0,
                            'Salinidad': 0,
                            'Silicatos': 0
                          },
                          'User': result.email,
                        });
                        FirebaseFirestore.instance
                            .collection('Aquariums')
                            .doc('${result.email}')
                            .collection('Variables')
                            .add({
                          'Amoniaco': 0,
                          'Calcio': 0,
                          'Carbonatos': 0,
                          'Fosfatos': 0,
                          'Magnesio': 0,
                          'Nitratos': 0,
                          'Nitritos': 0,
                          'Potasio': 0,
                          'Salinidad': 0,
                          'Silicatos': 0,
                          'Fecha': DateTime.now(),
                        });
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final aquariums = FirebaseFirestore.instance.collection('Aquariums');
    return StreamBuilder(
      stream: aquariums.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return _buildErrorPage(snapshot.error.toString());
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return _buildLoading();
          case ConnectionState.active:
            return _buildSignIn(snapshot.data);
          default: // ConnectionState.none  // ConnectionState.done
            return _buildErrorPage("Unreachable!!!");
        }
      },
    );
  }
}
