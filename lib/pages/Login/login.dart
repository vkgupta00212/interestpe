import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interestpe/utility/routes.dart';

class Login extends StatefulWidget {
  static const id = '/logIn';

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mobileNumberController = TextEditingController(); // Controller for TextFormField
  bool isButtonEnabled = false; // Track if the button should be enabled

  @override
  void initState() {
    super.initState();
    // Add a listener to the controller to track changes
    _mobileNumberController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is removed
    _mobileNumberController.removeListener(_updateButtonState);
    _mobileNumberController.dispose();
    super.dispose();
  }

  // Update button state based on input length
  void _updateButtonState() {
    setState(() {
      isButtonEnabled = _mobileNumberController.text.length == 10;
    });
  }

  moveToHome(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(milliseconds: 300));
      await Navigator.pushNamed(context, MyRoutes.otp);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/bg2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 60.0,
                ),
                Text(
                  "interestPe",
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Image.asset(
                  "assets/img/login.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    children: [
                      // Row for TextFormField and Login Button
                      Row(
                        children: [
                          // Reduced width TextFormField
                          Expanded(
                            flex: 6, // Adjust the flex value to control the width
                            child: TextFormField(
                              controller: _mobileNumberController, // Assign the controller
                              decoration: InputDecoration(
                                hintText: "Mobile Number",
                                labelText: "Mobile Number",
                                prefixIcon: Icon(Icons.smartphone,
                                  color: Colors.deepPurple,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                              ),
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return "Enter Your Number";
                                } else if (value!.length < 10) {
                                  return "Please enter a 10-digit number";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 20),
                          // Login Button
                          Expanded(
                            flex: 1, // Adjust the flex value to control the width
                            child: Material(
                              color: isButtonEnabled ? Colors.deepPurple : Colors.grey, // Change color based on input
                              borderRadius: BorderRadius.circular(30),
                              child: InkWell(
                                onTap: isButtonEnabled ? () => moveToHome(context) : null, // Enable/disable button
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 250),
                                  width: 50,
                                  height: 45,
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text("By continuing, you agree to our Terms of service and Privacy Policy.",
                      style: TextStyle(
                      fontSize: 13
                      ),)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}