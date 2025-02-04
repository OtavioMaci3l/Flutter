import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        //color: myColor, //no tutorial usaram isso pois era condizente com o que queriam, nesse caso não fica bom
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(myColor.withOpacity(0.9), BlendMode.dstATop)
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 55, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom()),
          ],
        ),
      ),
    );
  }


  Widget _buildTop(){
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_on_sharp,
            size: 100,
            color: Colors.white,
          ),
          Text(
            "Bem-Vindo",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
              letterSpacing: 2,
            ),
          )
        ],
      ),
    );
  }


  Widget _buildBottom(){
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: _buildForm(),
        ),
      ),
    );
  }


  Widget _buildForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Login",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        _buildGreyText("Informe seu login"),
        const SizedBox(height: 50,),
        _buildGreyText("Endereço de Email"),
        _buildInputField(emailController),
        const SizedBox(height: 40,),
        _buildGreyText("Senha"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20,),
        _buildRememberForgot(),
        const SizedBox(height: 20,),
        _buildLoginButtom(),
        const SizedBox(height: 30,),
        _buildOtherLogin(),
      ],
    );
  }

  Widget _buildGreyText(String text){
    return Text(
      text,
      style: const TextStyle(
        color: Colors.grey,
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      cursorColor: Colors.blueAccent,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildRememberForgot(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberUser,
              activeColor: Colors.blueAccent,
              checkColor: Colors.white,
              onChanged: (value){
                setState(() {
                  rememberUser = value!;
                });
              },
            ),
            _buildGreyText("Lembrar de mim"),
          ],
        ),
        TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.blueAccent.withOpacity(0.1)),
          ),
          onPressed: (){},
          child: _buildGreyText("Esqueci minha senha"),
        ),
      ],
    );
  }

  Widget _buildLoginButtom(){
    return ElevatedButton(
      onPressed: (){
        debugPrint("Email : ${emailController.text}");
        debugPrint("Senha : ${passwordController.text}");
      },
      style: ElevatedButton.styleFrom(
        overlayColor: Colors.blue,
        backgroundColor: Colors.blueAccent,
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: null,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
        "LOGIN",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildOtherLogin(){
    return Center(
      child: Column(
        children: [
          _buildGreyText("Outras opções de Login"),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tab(icon: Image.asset("assets/images/facebook.png"),),
              Tab(icon: Image.asset("assets/images/google.png"),),
              Tab(icon: Image.asset("assets/images/github.png"),),
            ],
          )
        ],
      ),
    );
  }
}

