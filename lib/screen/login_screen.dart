import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/controller/auth_controller.dart';
import 'package:monitor_app/mstate/auth_state.dart';
import 'package:monitor_app/screen/home_screen.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:monitor_app/screen/reset_password_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  String username = '';
  String password = '';
  bool _isFormLoading = false;

  _doLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      // Validation passed.
      _formKey.currentState!.save();
      _isFormLoading = true;
      ref.read(authControllerProvider.notifier).login(username, password);
    }
  }

  void _onLoginSuccess(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  void _onLoginError(BuildContext context, String message) {
    _isFormLoading = false;
    debugPrint('error : $message');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          Center(
            child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK')),
          )
        ],
        title: const Text('Problem'),
        content: Text(message),
      ),
    );
    // final dialog = AwesomeDialog(
    //   context: context,
    //   dialogType: DialogType.error,
    //   desc: message,
    //   width: kDialogWidth,
    //   btnOkText: 'OK',
    //   btnOkOnPress: () {},
    // );

    // dialog.show();
  }

  @override
  void dispose() {
    super.dispose();
    ref.invalidate(authControllerProvider);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(
      authControllerProvider,
      (previous, next) {
        if (next is AuthAuthorized) {
          _onLoginSuccess(context);
        } else if (next is AuthFailedWithError) {
          _onLoginError(context, next.message);
        }
      },
    );

    return Scaffold(
      body: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(),
              const Spacer(),
              FormBuilderTextField(
                name: 'username',
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text('Username'),
                  hintText: "Please type username",
                ),
                enableSuggestions: false,
                validator: FormBuilderValidators.required(),
                onSaved: (value) => (username = value ?? ''),
              ),
              FormBuilderTextField(
                name: 'password',
                decoration: const InputDecoration(
                  label: Text('Password'),
                  hintText: "Please type password",
                ),
                enableSuggestions: false,
                validator: FormBuilderValidators.required(),
                obscureText: true,
                onSaved: (value) => (password = value ?? ''),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: (_isFormLoading ? null : () => _doLogin()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size.fromHeight(40), // NEW
                  ),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white),
                  )),
              const Spacer(),
              InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const ResetPasswordScreen()),
                ),
                child: const Text('forget password?',
                    style: TextStyle(color: Colors.lightBlue)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
