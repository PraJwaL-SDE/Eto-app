import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CompleteDetailCubit extends Cubit<CompleteDetailState> {
  // Controllers for input fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  CompleteDetailCubit() : super(InitialState());

  // Emits loading state
  void showLoading() {
    emit(LoadingState());
  }

  // Emits completed state with user data
  void hideLoading(dynamic user) {
    emit(CompleteState(user: user));
  }

  @override
  Future<void> close() {
    // Dispose controllers when the cubit is closed
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    return super.close();
  }
}

// Abstract state class
abstract class CompleteDetailState {
  const CompleteDetailState();

  @override
  List<Object> get props => [];
}

// Initial state of the cubit
class InitialState extends CompleteDetailState {}

// Loading state of the cubit
class LoadingState extends CompleteDetailState {}

// Completed state with user information
class CompleteState extends CompleteDetailState {
  final dynamic user;

  const CompleteState({this.user});

  @override
  List<Object> get props => [user];
}
