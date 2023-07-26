import 'package:flutter/material.dart';

class WelcomeTitle
 extends StatelessWidget {
  const WelcomeTitle
  ({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final double containerWidth = MediaQuery.of(context).size.width * 0.8;

    const TextStyle textStyle = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold
    );
   final TextStyle secondary = textStyle.copyWith(color: theme.secondaryHeaderColor);

    return FractionallySizedBox(
      // widthFactor: 0.8,
      child: Container(
        width:containerWidth , 
        child: RichText(
          text: TextSpan( 
            
            children: <TextSpan> [
              const TextSpan(text: "Welcome \nto", style: textStyle),
              TextSpan(text: " NekoAPP", style: secondary)
    
            ]
          ),
        ),
      ),
    );
  }
}