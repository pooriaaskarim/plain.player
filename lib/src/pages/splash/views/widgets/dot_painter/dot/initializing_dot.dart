import 'dot.dart';

class InitializingDot extends Dot {
  const InitializingDot({
    required super.dotAnimationController,
    required super.logoSize,
    required super.color,
    required super.errorColor,
  });

  @override
  Future<void> get animate => dotAnimationController.forward();
}
