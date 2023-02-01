import 'package:ecommercapp/controllers/auth_controller.dart';
import 'package:ecommercapp/services/auth.dart';
import 'package:ecommercapp/utlis/enum.dart';
import 'package:ecommercapp/utlis/routes.dart';
import 'package:ecommercapp/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  FocusNode _emailNodeController = FocusNode();
  FocusNode _passwordNodeController = FocusNode();

  var _formKey = GlobalKey<FormState>();

  Future<void> _submit(AuthController model) async {
    try {
      await model.submit();
      if(!mounted)return;
      Navigator.of(context).pushNamed(AppRoutes.bottomNavBarRoute);
    } catch (e) {
      showDialog(
          context: context,
          builder: (builder) => AlertDialog(
                content: Text(e.toString()),
                title: Text(
                  'error',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Close'))
                ],
              ));
    }

  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<AuthController>(
      create: (_) => AuthController(auth: authController),
      child: Consumer<AuthController>(
        builder: (_, model, child) => Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 32.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          model.authFormType == AuthFormType.login
                              ? 'Login'
                              : 'Registeriton',
                          style: Theme.of(context).textTheme.headline3),
                      SizedBox(
                        height: 90,
                      ),
                      TextFormField(
                        onChanged: model.updateEmail,
                        focusNode: _emailNodeController,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_passwordNodeController),
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your email!';
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            labelText: 'Email',
                            hintText: 'Enter your Email'),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        onChanged: model.updatePassword,
                        textInputAction: TextInputAction.next,
                        focusNode: _passwordNodeController,
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password!';
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            labelText: 'Password',
                            hintText: 'Enter your Password'),
                      ),
                      SizedBox(
                        height: 24,
                      ),

                      SizedBox(
                        height: 16.0,
                      ),
                      if (model.authFormType == AuthFormType.login)
                        Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            child: Text('Forgot Your Password?'),
                            onTap: () {},
                          ),
                        ),

                      SizedBox(
                        height: 24.0,
                      ),
                      AppButton(
                          title: model.authFormType == AuthFormType.login
                              ? 'Login'
                              : 'Register',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _submit(model);
                            } else {
                              print('UnAuthuntaicted');
                            }
                          }),
                      SizedBox(
                        height: 24.0,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          child: Text(model.authFormType == AuthFormType.login
                              ? 'Dont have an account?Register'
                              : 'Have an Account Login'),
                          onTap: () {
                            _formKey.currentState!.reset();

                            model.toggleFormType();
                          },
                        ),
                      ),
//Spacer(),
                      SizedBox(
                        height: 100,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            model.authFormType == AuthFormType.login
                                ? 'Or login with'
                                : 'Or register with',
                            style: Theme.of(context).textTheme.subtitle1,
                          )),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.0)),
                            child: Icon(Icons.email),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.0)),
                            child: Icon(Icons.face_sharp),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
