part of 'form_cubit.dart';

@immutable
class FormCubitState {}

final class FormInitial extends FormCubitState {}

final class FormLoading extends FormCubitState {}

final class FormLoaded extends FormCubitState {
  final ContentModel content;
  FormLoaded({required this.content});
}

final class FormError extends FormCubitState {
  final String message;
  FormError({required this.message});
}

final class FormSubmit extends FormCubitState {}
