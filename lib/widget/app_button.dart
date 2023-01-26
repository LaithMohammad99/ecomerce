import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String title;
  final Function() onTap;

  const AppButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            onPressed: widget.onTap,
            child: Text(
              widget.title,

              style: Theme.of(context).textTheme.button,
            )));
  }
}