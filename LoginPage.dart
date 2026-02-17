import 'package:flutter/material.dart';
import 'signUp.dart';
import 'pageAccueil.dart';

/// loginEkran
class LoginEkran extends StatefulWidget {
  const LoginEkran({super.key});

  @override
  State<LoginEkran> createState() => _LoginEkranState();
}
//lis pou kenbe email ak mot de passe
  final  users = <String, String>{
    "bervelie@gmail.com": "12345678"};

class _LoginEkranState extends State<LoginEkran> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailField = TextEditingController();
  final TextEditingController passField = TextEditingController();

  void antre() {
    if (_formKey.currentState!.validate()) {
      String email = emailField.text;
      String password = passField.text;
// kondisyon pou verifye si se login itilizate a chwazi si mail ak pass li okay si yo nn lis nou an
      if (users.containsKey(email) &&
          users[email] == password) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MyHomePage(title: 'MovieFinder App')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email oubyn password ou rantre a pa bon")),
        );}} }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CONNEXION")),
      body:SafeArea(child: Padding(
        padding: const EdgeInsets.all(20),
      child : Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailField,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ce champ est obligatoire";
                     }
                     if (!RegExp(r'^[a-zA-Z0-9._%-]+@gmail\.com$').hasMatch(value)) {
                    return "Email ou pa bon retape l";
                  }if (!RegExp(r'^[a-zA-Z0-9._%-]+@gmail\.com$').hasMatch(value)) {
                    return "Email ou pa bon retape l";
                  }
                  return null;
                }, ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passField,
                 obscureText: true,
                decoration: InputDecoration(
                  labelText: "Mot de Passe",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ce champ est obligatoire";
                  }
                  return null;
                }, ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: antre,
                child: const Text("Connecter"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (cont) => const Enregistrement()),
                  );},
                child: const Text("Pas de compte/Inscrire"),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}



