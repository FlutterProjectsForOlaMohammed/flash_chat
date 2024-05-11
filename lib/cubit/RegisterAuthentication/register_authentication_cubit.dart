import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/contants.dart';
import 'package:flash_chat/models/user_data.dart';
import 'package:meta/meta.dart';

part 'register_authentication_state.dart';

class RegisterAuthenticationCubit extends Cubit<RegisterAuthenticationState> {
  RegisterAuthenticationCubit() : super(AuthenticationRegisterInitial());

  register({required UserData user, required String password}) async {
    try {
      emit(AuthenticationRegisterLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      await FirebaseFirestore.instance.collection("Users").add({
        'first name': user.firstName,
        'last name': user.lastName,
        'email': user.email,
      });
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
