abstract class Failure {
  late String code;
}

class BottomPlacedException extends Failure {
  String code;

  BottomPlacedException({this.code = ""});
}

class UnImplementedFailure extends BottomPlacedException {
  final code = "An Error occured !";
}

class UnImplementedFailure1 extends BottomPlacedException {
  final code = "Please add a reason for daily way changes";
}

class NetworkException extends BottomPlacedException {
  final code = "Netwrok connection error !";
}

class NoException extends Failure {}
