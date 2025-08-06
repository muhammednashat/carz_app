import 'package:flutter/material.dart';
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed, 
        child: Text(text
        
        ,
        
        style: Theme.of(context).textTheme.titleMedium),




        

        
        ),
    );
  }
}
