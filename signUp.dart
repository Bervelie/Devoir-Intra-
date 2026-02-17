import 'package:flutter/material.dart';
import 'LoginPage.dart';



//ekran pou anrejistre (Sign up)
class Enregistrement extends StatefulWidget {
  const Enregistrement({super.key});

  @override
  State<Enregistrement> createState() => _enregistrementState();
}

class _enregistrementState extends State<Enregistrement> {

  final _kleAnr = GlobalKey<FormState>();
  final TextEditingController imelTape = TextEditingController();
  final TextEditingController passTape = TextEditingController();
  final TextEditingController confPasTape = TextEditingController();

  void signup() {
    if (_kleAnr.currentState!.validate()) {
      String email = imelTape.text;
      String password = passTape.text;

      users[email] = password;
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Compte cree")),
        );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inscription")),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _kleAnr,
          child: Column(
            children: [
              TextFormField(
                controller: imelTape,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email"
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Remplis le champ email";
                  }
                  if (!RegExp(r'^[a-zA-Z0-9._%-]+@gmail\.com$').hasMatch(value)) {
                    return "Email ou pa bon retape l";
                  }
                  return null;

                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: passTape,
                 obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Remplis le champ password";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              TextFormField(
                controller: confPasTape,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirme Mot de Passe",
                ),
                validator: (value) {
                  if (value != passTape.text) {
                    return "Mot de Passe incorrect";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: signup,
                child: const Text("Creer"),
        

              ),
          ],
         ),
       ), 
     ), 
     ),
    );
  }
}