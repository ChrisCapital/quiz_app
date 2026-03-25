import 'package:flutter/material.dart';


class RestartButton extends StatelessWidget{
  const RestartButton(
    {
    required this.onTap,
    super.key
  }
);
  final void Function() onTap;

  @override
  Widget build(context){
    return
    ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        backgroundColor: const Color.fromARGB(255, 19, 0, 55),
        foregroundColor: Colors.white
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.restart_alt_outlined),
          const Text('Restart Quiz'),
          const SizedBox(width: 8),
          
        ],
      ),
    );
  }
}