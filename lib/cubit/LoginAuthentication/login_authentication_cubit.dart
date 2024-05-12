import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/contants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'login_authentication_state.dart';

class LoginAuthenticationCubit extends Cubit<AuthenticationState> {
  LoginAuthenticationCubit() : super(AuthenticationLoginInitial());

  login({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthenticationLoginLoading());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(AuthenticationLoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(
          AuthenticationLoginFailure(message: "User Not Found"),
        );
        await toastMessage(msg: "User Not Found");
      } else if (e.code == 'wrong-password') {
        emit(
          AuthenticationLoginFailure(
            message: "Wrong Password",
          ),
        );
        await toastMessage(msg: "Wrong Password");
      } else {
        emit(
          AuthenticationLoginFailure(
            message: e.toString(),
          ),
        );
        await toastMessage(msg: e.toString());
      }
    } catch (e) {
      emit(
        AuthenticationLoginFailure(
          message: e.toString(),
        ),
      );
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

  Future<UserCredential> loginWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: [
        'email',
        'public_profile',
        'user_birthday',
      ],
    );
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
