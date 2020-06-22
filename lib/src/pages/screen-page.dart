import 'package:flutter/material.dart';

class ScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _background(context, size),
          Positioned(
            top: size.height * 0.10,
            right: size.height * 0.05,
            child: _getIcon(context)
          ),

          Positioned(
            top: size.height * 0.20,
            left: size.width * 0.10,
            child: _getText()
          ),

          Positioned(
            bottom: size.height * 0.06,
            left: size.width * 0.15,
            right: size.width * 0.15,
            child: _getActions(context, size)
          )
        ],
      ),
    );
  }

  Widget _background(BuildContext context, Size size) {
    return Container(
      height: size.height,
      width: double.infinity,
      color: Theme.of(context).primaryColor,
    );
  }

  Widget _getActions(BuildContext context, Size size) {
    return Column(
      children: <Widget>[
        _loginBtn(context),
        SizedBox(height: size.height * 0.03,),
        _registrarBtn(context),
        SizedBox(height: size.height * 0.05,),
        _getFotgotPassword(),
      ],
    );
  }

  Widget _loginBtn(BuildContext context) {
    return OutlineButton(
      padding: EdgeInsets.symmetric(vertical: 17.5),
      child: _getTextBtn('Login'),
      borderSide: BorderSide(
        color: Colors.white,
        width: 1.5,
      ),
      highlightedBorderColor: Colors.white,
      onPressed: () {
        // Navigator.of(context).pushReplacementNamed('login');
        Navigator.of(context).pushNamed('login');
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      
    );
  }

  Widget _registrarBtn(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 17.5),
      color: Theme.of(context).accentColor,
      child: _getTextBtn('Registrarte'), 
      onPressed: () {},
    );
  }

  Widget _getTextBtn(String text) {
    return Container(
      width: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 27,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5
        ),
      ),
    );
  }

  Widget _getFotgotPassword() {
    return GestureDetector(
      onTap: () {},
      child: Text(
        '¿Olvide la contraseña?',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _getIcon(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Icon(
        Icons.restaurant_menu,
        color: Theme.of(context).primaryColor,
        size: 40,
      ),
    );
  }

  Widget _getText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Bienvenido!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(height: 5,),
        Text('Lo que quieres comer,\nlo encuentras aquí',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
        )
      ],
    );
  }
}