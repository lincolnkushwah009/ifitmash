
class JsonUser {
  String input;
  String otp;

  JsonUser({
    this.input,this.otp

  });

  factory JsonUser.fromJson(Map<String, dynamic> parsedJson) {

    return JsonUser(
        input: "input",
      otp: "otp"
    );
  }
}