import 'package:mobx/mobx.dart';
part 'client.g.dart';

class Client = _ClientBase with _$Client;

abstract class _ClientBase with Store {
  @observable
  late String name;
  @action
  changeName(String value) => name = value;

  @observable
  late String email;
  @action
  changeEmail(String value) => email = value;
  
  @observable
  late String cpf;
  @action
  changecpf(String value) => cpf = value;
}
