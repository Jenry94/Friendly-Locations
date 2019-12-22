import 'package:fireoze/LoginController.dart';
import 'package:fireoze/MyHomePage.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

import 'Constants.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLogin = true;
  String userName, email, password, passwordConfirm;
  GlobalKey<FormState> formLoginKey = new GlobalKey<FormState>();
  GlobalKey<FormState> formRegisterKey = new GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var loginController = new LoginController();
  var passwordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          header(),
          isLogin ? bodyLogin() : bodyRegister(),
        ]
      ) 
    );
  }


  Widget header() {
    return Container(
      child: new Padding(
        padding: EdgeInsets.all(20),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(height: 80),
              logo(),
              label()
            ],
          )
        )
      ),
      decoration: new BoxDecoration(
        color: PRIMARY_COLOR,
        borderRadius:new BorderRadius.only(bottomLeft: new Radius.circular(65))
      ),
    );
  }
  
  Widget logo(){
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: new CircleAvatar(
        child: new Image.asset("assets/logo_app.png", scale: 15),
        radius: 60,
        backgroundColor: Colors.white,
      )
    );
  }

  Widget label(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.only(right: 5),
          child: new Text("Friendly",
            style: new TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white)
          )
        ),
        new Padding(
          padding: EdgeInsets.only(right: 5),
          child: new Text("Location",
            style:new TextStyle(fontSize: 20, color: Colors.white)
          )
        )
      ]
    );
  }

  Widget bodyLogin() {
    return Expanded(
      child: new Container(
        width: MediaQuery.of(context).size.width,
        child: new Form(
          key: formLoginKey,
          child: new ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              emailInput(),
              passwordInput(),
              accesArea(),
              googleButton(),
              facebookButton()
            ]
          ),
        ),
      )
    );
  }

  Widget bodyRegister() {
    return Expanded(
      child: new Container(
        width: MediaQuery.of(context).size.width,
        child: new Form(
          key: formRegisterKey,
          child: new ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              userNameInput(),
              emailInput(),
              passwordInput(),
              passwordConfirmInput(),
              accesArea(),
            ]
          ),
        ),
      )
    );
  }

  Widget userNameInput(){
    return Visibility(
      visible: !isLogin,
      child: new Padding(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
        child: new Container(
          padding: EdgeInsets.only(left:20),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              new BoxShadow(
                color: Colors.black12,
                blurRadius: 5
              )
            ],
            color: Colors.white,
          ),
          child: new TextFormField(
            cursorColor: PRIMARY_COLOR,
            decoration: new InputDecoration(
              border: InputBorder.none,
              icon: new Icon(Icons.person),
              hintText: HINT_USERNAME
            ),
            validator: (value) {
              return loginController.validateUserName(value);
            },
            onSaved: (value){
              userName = value;
            },
          )
        )
      )
    );
  }

  Widget emailInput(){
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: new Container(
          padding: EdgeInsets.only(left:20),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              new BoxShadow(
                color: Colors.black12,
                blurRadius: 5
              )
            ],
            color: Colors.white,
          ),
          child: new TextFormField(
            cursorColor: PRIMARY_COLOR,
            decoration: new InputDecoration(
              border: InputBorder.none,
              icon: new Icon(Icons.email),
              hintText: HINT_EMAIL
            ),
            validator: (value) {
              return loginController.validateEmail(value);
            },
            onSaved: (value){
              email = value;
            },
          ),
        ),
    
    );
  }

  Widget passwordInput(){
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: new Container(
          padding: EdgeInsets.only(left:20),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              new BoxShadow(
                color: Colors.black12,
                blurRadius: 5
              )
            ],
            color: Colors.white,
          ),
          child: new TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: new InputDecoration(
              border: InputBorder.none,
              icon: new Icon(Icons.vpn_key),
              hintText: HINT_PASSWORD
            ),
            validator: (value) {
              return loginController.validatePassword(value);
            },
            onSaved: (value){
              password = value;
            },
          ),
        ),
    
    );
  }

  Widget passwordConfirmInput(){
    return Visibility(
      visible: !isLogin,
      child: new Padding(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: new Container(
          padding: EdgeInsets.only(left:20),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              new BoxShadow(
                color: Colors.black12,
                blurRadius: 5
              )
            ],
            color: Colors.white,
          ),
          child: new TextFormField(
            obscureText: true,
            decoration: new InputDecoration(
              border: InputBorder.none,
              icon: new Icon(Icons.vpn_key),
              hintText: HINT_CONFIRM_PASSWORD
            ),
            validator: (value) {
              return loginController.validatePasswordConfirm(value, passwordController.text);
            }
          )
        )
      )
    );
  }

  Widget submitBtn(){
    return FloatingActionButton.extended(
      elevation: 2,
      heroTag: null,
      backgroundColor: PRIMARY_COLOR,
      foregroundColor: Colors.white,
      label: isLogin ? new Text("Ingresar") : new Text("Registrarse"),
      onPressed: (){
        isLogin ? signInEmail() : registerEmail();
      }
    );
  }

  Widget accesArea(){
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 30),
      child: new SizedBox(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new GestureDetector(
              child: isLogin? new Text("Registrarse", style: new TextStyle(color: PRIMARY_COLOR)) : new Text("Ingresar", style: new TextStyle(color: PRIMARY_COLOR)),
              onTap: (){
                setState(() {
                  if (isLogin) {
                    isLogin = false;
                    passwordController.clear();
                  }
                  else{
                    isLogin = true;
                    passwordController.clear();
                  }
                });
              },
            ),
            submitBtn()
          ],
        )
      )
    );
  }


  Widget googleButton(){
    return Padding(
      padding:EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: new FloatingActionButton.extended(
        elevation: 2,
        heroTag: null,
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        icon: new Image.network("http://assets.stickpng.com/thumbs/5847f9cbcef1014c0b5e48c8.png", scale: 20),
        label: new Text("Ingresar con Google"),
        onPressed: (){
          signInGoogle();
        }
      )
    );
  }

 
  Widget facebookButton(){
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: new FloatingActionButton.extended(
        elevation: 2,
        heroTag: null,
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        icon: new Image.network("https://en.facebookbrand.com/wp-content/uploads/2019/04/f_logo_RGB-Hex-Blue_512.png", scale: 20),
        label: new Text("Ingresar con Facebook"),
        onPressed: (){
          signInFacebook();
        }
      )
    );
  }

  Widget dangerSnackBar(String message){ 
    return SnackBar(
      content: new Text(message,style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
    backgroundColor: Colors.red,
    );
  }

  void registerEmail()async{
    if(formRegisterKey.currentState.validate()){
      formRegisterKey.currentState.save();
      var user = await loginController.registerEmail(userName, email, password);
      if (user != null) {
        if(!user.isEmailVerified){
          showEmailVerificationMessage();
          setState(() {
            isLogin = true;
            passwordController.clear();
          });
        }    
      }
      else{
        scaffoldKey.currentState.showSnackBar(dangerSnackBar(ERROR_ALREADY_IN_USE_EMAIL));
      }
    }
  }

  void signInEmail()async{
    if(formLoginKey.currentState.validate()){
      formLoginKey.currentState.save();
      var user = await loginController.signInEmail(email, password);
      if (user != null) {
        if(!user.isEmailVerified){
          showEmailVerificationMessage();
        }
        else{
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => new MyHomePage(user)));
        }
      }
      else{
        scaffoldKey.currentState.showSnackBar(dangerSnackBar(ERROR_INALID_EMAIL_OR_PASSWORD));
      }
    }
  }

  void signInGoogle()async{
    var user = await loginController.signInGoole();
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => new MyHomePage(user)));
  }

  void signInFacebook()async{
    var user = await loginController.signInFacebook();
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => new MyHomePage(user)));
  }


  void showEmailVerificationMessage(){
    showDialog(
      context: context,
      builder: (_) => NetworkGiffyDialog(
        image: FlareActor("assets/flare_anim/email.flr",animation: "play"),
        title: new Text("Atención", style: TextStyle(fontWeight: FontWeight.w600)),
        description: new Text(EMAIL_VERIFICATION_MESSAGE,  textAlign: TextAlign.justify),
        buttonOkText: new Text("Verificar"),
        buttonOkColor: PRIMARY_COLOR,
        onOkButtonPressed: () {
          Navigator.of(context).pop();
          loginController.redirectMailApp();
        },

       
      )
    );
  }

  
  
}
