import 'package:mobx/mobx.dart';
import 'package:mobx_card_list/models/client.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  var client = Client();

  @computed
  bool get isValid {
    return validateName() == "" && validateEmail() == "";
  }

  String validateName() {
    if (client.name == null || client.name.isEmpty) {
      return "Este campo é obrigatório";
    } else if (client.name.length < 3) {
      return "Seu nome precisa ter mais que 3 caracteres";
    }

    return "";
  }

  String validateEmail() {
    if (client.email == null || client.email.isEmpty) {
      return "Este campo é obrigatório";
    } else if (!client.email.contains("@")) {
      return "Esse não é um email válido";
    }

    return "";
  }

  dispose() {}
}
