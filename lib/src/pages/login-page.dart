import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _getBackground(context, size),
          Positioned(
            // top: size.height * 0.20,
            bottom: size.height * 0.235,
            left: size.width * 0.10,
            right: 0,
            child: _getFormContainer(context, size)
          ),

          Positioned(
            top: size.height * 0.15,
            left: size.width * 0.10,
            child: _getText()
          ),

          Positioned(
            bottom: size.height * 0.10,
            right: 0,
            left: size.width * 0.35,
            child: _btn(context)
          )
        ],
      ),
    );
  }

  Widget _getFormContainer(BuildContext context, Size size) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 40
      ),
      decoration: BoxDecoration(
        // color: Theme.of(context).accentColor,
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        )
      ),
      child: Column(
        children: <Widget>[
          Text(
            'LOGIN',
            style: TextStyle(
              // color: Colors.white,
              color: Colors.black45,
              fontSize: 25,
              letterSpacing: 3.5,
              fontWeight: FontWeight.w700
            ),
          ),

          _userInput(),
          _passInput(),

          SizedBox(height: 15,)
        ],
      ),
    );
  }

  Widget _userInput() {
    return Container(
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.white
        ),
        decoration: InputDecoration(
          icon: Icon(
            Icons.email
          ),
          labelText: 'Correo',
        ),
      ),
    );
  }

  Widget _passInput() {
    return Container(
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.white
        ),
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock
          ),
          labelText: 'Contraseña',
        ),
      ),
    );
  }

  Widget _btn(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: FlatButton(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 35
        ),
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
        ),
        color: Theme.of(context).accentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Entrar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w700
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 30,
            )
          ],
        )
      ),
    );
  }

  Widget _getText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Busca!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(height: 5,),
        Text('Encuentra y reserva,\ndisfrutalo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
        )
      ],
    );
  }

  Widget _getBackground(BuildContext context, Size size) {
    return Container(
      height: size.height,
      width: double.infinity,
      color: Theme.of(context).primaryColor,
    );
  }

}
