import 'package:flutter/material.dart';

class GoogleButtonSignIn extends StatelessWidget {
  const GoogleButtonSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(elevation: 0, padding: EdgeInsets.symmetric(horizontal: 40)),
      onPressed: (){
        print("sign in with flutter");
      },
      icon: Image.network('http://pngimg.com/uploads/google/google_PNG19635.png', width: 36, height: 36,),
      label: Text("Continue with google", style: TextStyle(color: theme.primaryColor) ,));


  }
}
