import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:vitabu/src/constants/routes.dart';
import 'package:vitabu/src/views/widgets/button.dart';
import 'package:vitabu/src/views/widgets/text_box.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _log = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/img/vitabu.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                children: <Widget>[
                  SizedBox(
                    height: 250,
                    child: Center(
                      child: Text(
                        "VITABU",
                        style: Theme.of(context).textTheme.headline2.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: buildTextBox(
                      "Machine serveur",
                      icon: Icon(Icons.perm_data_setting),
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    child: buildTextBox(
                      "Mot de passe",
                      icon: Icon(Icons.lock),
                      isPassword: true,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          semanticLabel: _obscureText
                              ? 'password vidible'
                              : 'password hide',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Button(
                    caption: "Connexion",
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      Routes.home,
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: Center(
                      child: Text(
                        "Conditions d'utilisation",
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          inAsyncCall: _log,
        ),
      ),
    );
  }
}
