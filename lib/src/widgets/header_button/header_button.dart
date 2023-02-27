import 'package:flutter/material.dart';

class HeaderButton extends StatefulWidget {
  final String label;
  const HeaderButton({required this.label, super.key});
  @override
  HeaderButtonState createState() => HeaderButtonState();
}

class HeaderButtonState extends State<HeaderButton> {
  @override
  Widget build(BuildContext context) => Text(
        widget.label,
        style: Theme.of(context).textTheme.bodyLarge,
      );
}
