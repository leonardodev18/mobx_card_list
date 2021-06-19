import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_card_list/controller.dart';
import 'package:provider/provider.dart';

class BodyWidget extends StatelessWidget {
  _textField(
      {required String labelText,
      onChanged,
      required String Function() errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Observer(builder: (_) {
            return _textField(
              errorText: controller.validateName,
              labelText: "name",
              onChanged: controller.client.changeName,
            );
          }),
          SizedBox(
            height: 20,
          ),
          Observer(builder: (_) {
            return _textField(
              errorText: controller.validateEmail,
              labelText: "email",
              onChanged: controller.client.changeEmail,
            );
          }),
          SizedBox(
            height: 20,
          ),
          Observer(builder: (_) {
            return TextButton(
              onPressed: controller.isValid ? () {} : null,
              child: Text("Salvar"),
            );
          })
        ],
      ),
    );
  }
}
