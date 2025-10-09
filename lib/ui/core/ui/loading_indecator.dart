import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Container(
          color: Colors.white70,
          child: Center(child: CircularProgressIndicator()),
        )
    );
  }
}