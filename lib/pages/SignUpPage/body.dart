import 'package:app/widgets/signupform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "Register Account",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              Text(
                "Complete your details or countinue \nwith social media",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF4caf50)),
              ),
              SignUpForm()
            ],
          ),
        ),
      ),
    );
  }
}
