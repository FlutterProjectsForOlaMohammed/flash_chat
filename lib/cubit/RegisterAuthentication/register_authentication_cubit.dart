import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/contants.dart';
import 'package:meta/meta.dart';

part 'register_authentication_state.dart';

class RegisterAuthenticationCubit extends Cubit<RegisterAuthenticationState> {
  RegisterAuthenticationCubit() : super(AuthenticationRegisterInitial());

  register(UserData userData) async {
    try {
      emit(AuthenticationRegisterLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userData.email,
        password: userData.password,
      );
      emit(AuthenticationRegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        await toastMessage(msg: "Weak Password !!! ");
      } else if (e.code == 'email-already-in-use') {
        await toastMessage(msg: "Email already in Use ");
      }
    } catch (e) {
      await toastMessage(msg: e.toString());
    }
  }
}

class UserData {
  final String firstName, lastName, email, password;

  UserData(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});
}
