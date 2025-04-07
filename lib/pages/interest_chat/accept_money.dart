import 'dart:async';
import 'package:flutter/src/animation/curves.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interestpe/constants.dart';
import 'package:math_expressions/math_expressions.dart';

class AcceptMoney extends StatefulWidget {
  const AcceptMoney({super.key});

  @override
  State<AcceptMoney> createState() => _AcceptMoneyState();
}

class _AcceptMoneyState extends State<AcceptMoney> {
  final TextEditingController _amountController = TextEditingController();
  double _textFieldWidth = 50.0;
  Timer? _backspaceTimer;
  final TextEditingController _dateController = TextEditingController();
  DateTime? pickedDate;

  @override
  void initState() {
    super.initState();
    _amountController.addListener(() {
      setState(() {
        _textFieldWidth = 25.0 + (_amountController.text.length * 20.0);
      });
    });
  }

  @override
  void dispose() {
    _backspaceTimer?.cancel();
    _amountController.dispose();
    super.dispose();
  }

  void _startBackspace() {
    _backspaceTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (_amountController.text.isNotEmpty) {
        setState(() {
          _amountController.text = _amountController.text
              .substring(0, _amountController.text.length - 1);
        });
      }
    });
  }

  void _stopBackspace() {
    _backspaceTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 1,
        titleSpacing: 0,
        title: _buildProfileSection(0xff5099f5, "Vishal Gupta"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildLendContent(context),
            Expanded(child: Container()), // Some space or content above
            _buildDone(context), // Your adjustable widget
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            height: 1,
            thickness: 1,
            color: Color.fromRGBO(140, 179, 255, 0.3),
          ),
          _buildCustomKeypad(),
        ],
      ),
    );
  }

  Widget _buildDone(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.bounceIn,
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 16,
        top: 16,
      ),
      child: SafeArea(
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // TextFormField
                Expanded(
                  flex: 6,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Add Note (Optional)",
                      prefixIcon: const Icon(
                        Icons.note_add,
                        color: kPrimaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // Done Button
                Expanded(
                  flex: 1,
                  child: Material(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(30),
                    child: InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus(); // Dismiss keyboard
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: 50,
                        height: 45,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildLendContent(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool showDateField = _amountController.text.trim().isNotEmpty;
        // ✅ Set today's date to the controller if it's empty
        if (_dateController.text.isEmpty) {
          DateTime now = DateTime.now();
          pickedDate = now;
          _dateController.text =
          "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year}";
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Amount input row
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.currency_rupee, size: 28, color: Colors.grey),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: _textFieldWidth.clamp(50.0, MediaQuery.of(context).size.width * 0.5),
                    child: TextField(
                      controller: _amountController,
                      readOnly: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 25),
                      decoration: const InputDecoration(
                        hintText: "0",
                        hintStyle: TextStyle(fontSize: 25, color: Colors.grey),
                      ),
                      onChanged: (value) {
                        setState(() {}); // Just to trigger fade-in
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Fade-in animated date picker TextField
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: showDateField ? 1.0 : 0.0,
                curve: Curves.easeInOut,
                child: Visibility(
                  visible: showDateField,
                  child: GestureDetector(
                    onTap: () async {
                      DateTime initialDate = pickedDate ?? DateTime.now();
                      final DateTime? selected = await showDatePicker(
                        context: context,
                        initialDate: initialDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (selected != null) {
                        pickedDate = selected;
                        _dateController.text =
                        "${selected.day.toString().padLeft(2, '0')}-${selected.month.toString().padLeft(2, '0')}-${selected.year}";
                        setState(() {});
                      }
                    },
                    child: AbsorbPointer(
                      child: SizedBox(
                        width: 150,
                        child: TextField(
                          controller: _dateController,
                          readOnly: true,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(width: 0.5, color: Colors.grey),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCustomKeypad() {
    final List<String> keys = ['1', '2', '3', '←', '4', '5', '6', 'x', '7', '8', '9', '+', '.', '0', '=', '-'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: keys.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.7,
        ),
        itemBuilder: (context, index) {
          String key = keys[index];

          Color backgroundColor;
          Color textColor = Colors.black;

          if (key == '←') {
            backgroundColor = kPrimaryColor;
            textColor = Colors.white;
          } else if (['+', '-', 'x', '='].contains(key)) {
            backgroundColor = Colors.blue.shade100;
          } else {
            backgroundColor = Colors.grey.shade200;
          }

          final button = Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                key,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          );

          if (key == '←') {
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (_amountController.text.isNotEmpty) {
                    _amountController.text = _amountController.text
                        .substring(0, _amountController.text.length - 1);
                  }
                });
              },
              onLongPressStart: (_) => _startBackspace(),
              onLongPressEnd: (_) => _stopBackspace(),
              child: button,
            );
          }

          return GestureDetector(
            onTap: () {
              setState(() {
                if (key == '=') {
                  _evaluateExpression();
                } else {
                  _amountController.text += key;
                }

                _amountController.selection = TextSelection.fromPosition(
                  TextPosition(offset: _amountController.text.length),
                );
              });
            },
            child: button,
          );
        },
      ),
    );
  }

  void _evaluateExpression() {
    String expression = _amountController.text;

    try {
      expression = expression.replaceAll('x', '*');
      Parser parser = Parser();
      Expression exp = parser.parse(expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      _amountController.text = result.toStringAsFixed(2).replaceAll('.00', '');
    } catch (e) {
      _amountController.text = 'Error';
    }
  }

  Widget _buildProfileSection(int color, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                color: Color(color),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  name[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  "₹0",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(margin: const EdgeInsets.only(right: 15)),
      ],
    );
  }
}
