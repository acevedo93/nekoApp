import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
        fontSize: 38, fontWeight: FontWeight.bold, color: Colors.white);

    return SafeArea(
      child: Positioned(
          top: 20,
          bottom: 20,
          left: 30,
          right: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  context.go('/');
                },
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
              ),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Registration',
                  style: titleStyle,
                ),
              ),

              //FORM
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormField(),
                          TextFormField(),
                          TextFormField(),
                          CheckboxListTile(
                            value: true,
                            onChanged: (value) {},
                            title: Text("I agree with the rules"),
                            controlAffinity: ListTileControlAffinity.leading, 
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
