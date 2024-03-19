import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Module
import '../models/geeznum.dart';

class Input extends StatefulWidget {
  @override
  InputState createState() => InputState();
}

class InputState extends State<Input> {
  TextEditingController controller = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  Map<String, dynamic>? result;

  void convertNumber() {
    if (controller.text == '') return setState(() => result = null);
    setState(() => result = GeezNum.toGeeze(int.parse(controller.text)));
  }

  void clear() => setState(() {
        result = null;
        controller.clear();
      });

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        result != null
            ? GestureDetector(
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        result!["number"],
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        result!["name"],
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                onTap: () async {
                  await Clipboard.setData(ClipboardData(
                          text: "${result!["number"]} ${result!["name"]}"))
                      .then((_) {
                    FocusScope.of(context).unfocus();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Number Copied To Clipboard",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    );
                  });
                },
              )
            : Image.asset(
                'assets/images/logo.png',
                width: width * .3,
              ),
        SizedBox(
          height: 50,
          width: width * .9,
          child: TextField(
            focusNode: myFocusNode,
            style: Theme.of(context).textTheme.bodySmall,
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: Theme.of(context).inputDecorationTheme.border,
              hintText: "Input Your Number Here ...",
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) => convertNumber(),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "! Tap On The Translated Number to Copy",
          style: Theme.of(context).textTheme.bodySmall!.merge(TextStyle(
              color: controller.text != "" ? Colors.yellow : Colors.white),),
        )
      ],
    );
  }
}
