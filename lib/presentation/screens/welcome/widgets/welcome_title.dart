import 'package:flutter/material.dart';
import 'package:nekonapp/presentation/theme/theme.dart';

class WelcomeTitle
 extends StatelessWidget {
  const WelcomeTitle
  ({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final double containerWidth = MediaQuery.of(context).size.width * 0.8;
    TextStyle textStyle = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: theme.secondaryHeaderColor
    );

    return FractionallySizedBox(
      // widthFactor: 0.8,
      child: Container(
        width:containerWidth , 
        child: RichText(
          text: TextSpan( 
            
            children: <TextSpan> [
              TextSpan(text: "Welcome \nto", style: textStyle),
              TextSpan(text: " NekoAPP", style: textStyle)
    
            ]
          ),
        ),
      ),
    );
  }
}