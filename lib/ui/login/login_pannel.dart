import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPannel extends StatefulWidget {
  @override
  _LoginPannelState createState() => _LoginPannelState();
}

class _LoginPannelState extends State<LoginPannel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _submitButton = FocusNode();

  var _validateMode = AutovalidateMode.disabled;

  bool _keyboardVisible=false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();

    keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        _keyboardVisible = visible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 50,right: 50),
                // duration: Duration(milliseconds: 200),
                // height: _keyboardVisible ? 100 : 250,
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/cloud_of_goods.png'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: Form(
                  autovalidateMode: _validateMode,
                  key: _formKey,
                  child: AutofillGroup(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        emailFeild(context),
                        SizedBox(height: 15),
                        passwordFeild(context),
                        SizedBox(height: 50,),
                        buttonSubmit(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailFeild(ctx) {
    return TextFormField(
      autofillHints: [AutofillHints.email],
      focusNode: _emailFocus,
      textInputAction: TextInputAction.next,
      style: TextStyle(fontSize: 17),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        suffixIcon:Icon(Icons.email_rounded),
      ),
      onFieldSubmitted: (email){
        print(email.toLowerCase());
        _emailFocus.unfocus();
        FocusScope.of(ctx).requestFocus(_passwordFocus);
      },
      validator: (value){
          if(value.isEmpty){
            return "email field required";
          }else if(!EmailValidator.validate(value)){
            return "enter valid email";
          }
        return null;
      },
    );
  }

  Widget passwordFeild(ctx) {
    return TextFormField(
      autofillHints: [AutofillHints.password],
      textInputAction: TextInputAction.done,
      focusNode: _passwordFocus,
      style: TextStyle(fontSize: 17),
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: Icon(Icons.lock_rounded)
      ),
      onFieldSubmitted: (password){
        _passwordFocus.unfocus();
        FocusScope.of(ctx).requestFocus(_submitButton);
      },
      validator: (value){
        if(value.isEmpty) {
          return "password field required";
        }
        return null;
      },
    );
  }

  Widget buttonSubmit(ctx) {
    return ButtonTheme(
        minWidth: MediaQuery.of(ctx).size.width,
        height: 55,
        child: RaisedButton(
            color: HexColor("#4ea2e2"),
            focusNode: _submitButton,
            child: Text("Sign In",style: TextStyle(fontSize: 17), ),
            textColor:Colors.white,
            onPressed: (){
              setState(() {
                _validateMode = AutovalidateMode.onUserInteraction;
              });
                validateCredentials();
            },
        ),
    );
  }

  void validateCredentials() {
    final FormState form = _formKey.currentState;
    form.validate()?print("credential valid") :print("credential invalidate");
  }
}
