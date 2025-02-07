import 'package:flutter/material.dart';

class MyLoading extends StatelessWidget {
  const MyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Center(
        child: Container(
          width: 80.0,
          height: 80.0,
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
