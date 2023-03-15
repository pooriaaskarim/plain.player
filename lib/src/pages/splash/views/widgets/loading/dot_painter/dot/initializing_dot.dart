import 'dot.dart';

class InitializingDot extends Dot {
  const InitializingDot({
    required super.logoColor,
    required super.loadColor,
    required super.errorColor,
    required super.logoSize,
    required super.dotAnimationController,
  });

  @override
  Future<void> get animate => dotAnimationController.forward();
}
