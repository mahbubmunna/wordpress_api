


import 'package:rxdart/rxdart.dart';
import 'package:wordpress_api/models/user.dart';
import 'package:wordpress_api/repository/user_repository.dart';

class UserBloc {
  final BehaviorSubject<User> _subject =
  BehaviorSubject<User>();

  getUser() async {
    User response = await UserRepository.getUser();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<User> get subject => _subject;

}
final bloc = UserBloc();