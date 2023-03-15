import '../../application/splash/splash.state.dart';

enum SplashScreenStatus {
  initializing,
  loading,
  success,
  error,
}

extension GetStatus on SplashState {
  SplashScreenStatus get status {
    switch (runtimeType) {
      case InitialState:
        return SplashScreenStatus.initializing;
      case LoadingState:
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
