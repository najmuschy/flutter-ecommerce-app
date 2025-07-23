import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  static String name = '/sign-up';
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
          child: Form(
            child: Column(
              children: [
                AppLogo(width: 90, height: 97),
                Text('Complete Profile', style: textTheme.titleLarge),
                Text(
                  'Enter your email and password',
                  style: textTheme.titleMedium,
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: 'Enter your email'),
                  validator: (String? value) {
                    String email = value ?? '';
                    if (!EmailValidator.validate(email)) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _firstNameTEController,
                  decoration: InputDecoration(
                    hintText: 'Enter your first name',
                  ),
                  validator: (String? value) {
                    String firstName = value?.trim() ?? '';
                    if (firstName.isEmpty) {
                      return 'Enter your firstname';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _lastNameTEController,
                  decoration: InputDecoration(hintText: 'Enter your last name'),
                  validator: (String? value) {
                    String lastName = value?.trim() ?? '';
                    if (lastName.isEmpty) {
                      return 'Please enter last name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _mobileTEController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Enter your phone number',
                  ),
                  validator: (String? value) {
                    String mobile = value?.trim() ?? '';
                    RegExp bdMobile = RegExp(r'^(?:\+?88)?01[3-9]\d{8}$');
                    if (mobile.isNotEmpty && bdMobile.hasMatch(mobile)) {
                      return null;
                    }
                    return 'Please enter a valid phone number';
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _cityTEController,
                  decoration: InputDecoration(hintText: 'Enter your city'),
                  validator: (String? value) {
                    String city = value ?? '';
                    if (city.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordTEController,
                  decoration: InputDecoration(
                    hintText: 'Enter a password more than 6 characters',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      // Check for null first
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _addressTEController,
                  keyboardType: TextInputType.streetAddress,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Enter your full address',
                  ),
                  validator: (String? value) {
                    String address = value ?? '';
                    if (address.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                ElevatedButton(onPressed: onTapSignIn, child: Text('Sign In')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTapSignIn() {
    if (_formKey.currentState!.validate()) {}
  }
}
