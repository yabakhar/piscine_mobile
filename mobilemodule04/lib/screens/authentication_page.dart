import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modelView/auth_model_view.dart';
import 'home/home_page.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Authentication page"),
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.5),
        centerTitle: true,
      ),
      body: Consumer<AuthModelView>(
        builder: (context, model, _) {
          return Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    await model.signinWithGoogle();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Text('Sign in with Google'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await model.signinWithGitHub(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Text('Sign in with Github'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
