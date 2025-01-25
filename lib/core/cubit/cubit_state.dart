
import '../../shared/widgets/custom_snack_bar.dart';

abstract class CubitState {}

class CubitInitial extends CubitState {}

class CubitLoading extends CubitState {}

class CubitEmpty extends CubitState {}

class CubitError extends CubitState {
  final String errorMessage;

  CubitError(this.errorMessage) {
    CustomSnackBars.showErrorToast(title: errorMessage);
  }
}

class CubitDone extends CubitState {}
