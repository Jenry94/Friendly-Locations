import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Constants.dart';


class LoginController{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FacebookLogin facebookLogin = new FacebookLogin();


  Future<FirebaseUser> registerEmail(String userName,String email, String password) async {
    UserUpdateInfo userInfo = new UserUpdateInfo();
    FirebaseUser user;
    try {
      AuthResult result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      user = result.user;
      userInfo.displayName = userName;
      user.updateProfile(userInfo);
      user.sendEmailVerification();
      return user;
    } 
    catch (e) {
      print(e);
      return null;
    }
  }

  Future<FirebaseUser> signInEmail(String email, String password) async {
    try {
      AuthResult result = await auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } 
    catch (e) {
      print(e);
      return null;
    }
  }

  Future<FirebaseUser> signInGoole()async{
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    FirebaseUser firebaseUser = (await auth.signInWithCredential(credential)).user;
    return firebaseUser;
  }


  Future<dynamic> signInFacebook() async {
    final facebookLoginResult = await facebookLogin.logIn(['email', 'public_profile']);
    FacebookAccessToken myToken = facebookLoginResult.accessToken;
    AuthCredential credential= FacebookAuthProvider.getCredential(accessToken: myToken.token);
    FirebaseUser firebaseUser = (await auth.signInWithCredential(credential)).user;
    return firebaseUser;
  }

  String validateUserName(String value){
    String errorMessage;
    if(value.isEmpty){
      errorMessage = ERROR_EMPTY_USER_NAME; 
    }
    return errorMessage;
  }

  String validateEmail(String value){
    RegExp regex = new RegExp(REGEX_EMAIL);
    String errorMessage;
    if(value.isEmpty){
      errorMessage = ERROR_EMPTY_EMAIL; 
    }
    else if(!regex.hasMatch(value)){
      errorMessage = ERROR_VALID_EMAIL;
    }
    return errorMessage;
  }

  String validatePassword(String value){
    String errorMessage;
    if(value.isEmpty){
      errorMessage = ERROR_EMPTY_PASSWORD; 
    }
    else if(value.length<6){
      errorMessage = ERROR_VALID_PASSWORD;
    }
    return errorMessage;
  }

  String validatePasswordConfirm(String value, String originalValue){
    String errorMessage;
    if(value.isEmpty){
      errorMessage = ERROR_EMPTY_PASSWORD_MATCH; 
    }
    else if(originalValue != value){
      errorMessage = ERROR_PASSWORD_MATCH;
    }
    return errorMessage;
  }

  void redirectMailApp()async{

    const url = 'https://gmail.com';
    if (await canLaunch(url)) {
      await launch(url);
    } 
    else {
      throw 'Could not launch $url';
    }
  }
}