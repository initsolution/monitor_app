import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:monitor_app/controller/auth_controller.dart';
import 'package:monitor_app/mstate/auth_state.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  String email = '';
  bool _isFormLoading = false;

  _resetPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      // Validation passed.
      _formKey.currentState!.save();
      _isFormLoading = true;
      ref.read(authControllerProvider.notifier).resetPassword(email);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ref.listen<AuthState>(
    //   authControllerProvider,
    //   (previous, next) {
    //     if (next is ResetPasswordSuccessWithError) {
    //       _showMessageResponse(context);
    //     } else if (next is ResetPasswordFailedWithError) {
    //       _showMessageResponse(context, next.message);
    //     }
    //   },
    // );

    return Scaffold(
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(),
              const Spacer(),
              FormBuilderTextField(
                name: 'email',
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text('Email'),
                  hintText: "Please type email",
                ),
                enableSuggestions: false,
                validator: FormBuilderValidators.required(),
                onSaved: (value) => (email = value ?? ''),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: (_isFormLoading ? null : () => _resetPassword()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size.fromHeight(40), // NEW
                  ),
                  child: const Text(
                    'RESET PASSWORD',
                    style: TextStyle(color: Colors.white),
                  )),
              const SizedBox(height: 20),
              Consumer(
                builder: (context, ref, child) {
                  var result = ref.watch(authControllerProvider);
                  String message = "";
                  if (result is ResetPasswordSuccess) {
                    message = result.message;
                  } else if (result is ResetPasswordFailedWithError) {
                    message = result.message;
                  }
                  return Text(message);
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
