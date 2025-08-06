
import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/material.dart';

class SocialAccountButton extends StatelessWidget {
  const SocialAccountButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.imageName,
  });

  final VoidCallback onPressed;
  final String text;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 45.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(getIconPath(imageName), width: 25.0, height: 25.0),
              SizedBox(width: 8.0),
              Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
