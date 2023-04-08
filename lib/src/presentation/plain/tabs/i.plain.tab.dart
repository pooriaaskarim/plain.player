import 'package:flutter/material.dart';

abstract class PlainTab extends Widget {
  const PlainTab({super.key});
  Widget? floatingActionButton(final BuildContext context);
}
