import 'package:flutter/material.dart';

abstract class PlainTab extends Widget {
  const PlainTab({super.key});
  FloatingActionButton? floatingActionButton(final BuildContext context);
}
