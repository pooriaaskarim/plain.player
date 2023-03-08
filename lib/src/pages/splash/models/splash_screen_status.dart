import '../bloc/splash_screen_state.dart';

enum SplashScreenStatus {
  initializing,
  loading,
  success,
  error,
}

extension GetStatus on SplashScreenState {
  SplashScreenStatus get status {
    switch (runtimeType) {
      case InitialState:
        return SplashScreenStatus.initializing;
      case LoadState:
        return SplashScreenStatus.loading;
      case SuccessState:
        return SplashScreenStatus.success;
      case ErrorState:
        return SplashScreenStatus.error;
      default:
        return SplashScreenStatus.initializing;
    }
  }
}
