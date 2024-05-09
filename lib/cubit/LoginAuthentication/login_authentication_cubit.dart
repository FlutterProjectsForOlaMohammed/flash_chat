import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/contants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'login_authentication_state.dart';

class LoginAuthenticationCubit extends Cubit<AuthenticationState> {
  LoginAuthenticationCubit() : super(AuthenticationLoginInitial());

  login({required String email, required String password}) async {
    try {
      emit(AuthenticationLoginLoading());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(AuthenticationLoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        await toastMessage(msg: "User Not Founde");
      } else if (e.code == 'wrong-password') {
        await toastMessage(msg: "Wrong Password");
      }
    } catch (e) {
      await toastMessage(msg: e.toString());
    }
  }

  Future<UserCredential> loginWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}