import 'dart:io';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:http/http.dart' as http;

var authorizeEndpoint = Uri.parse("https://github.com/login/oauth/authorize");
var tokenEndpoint = Uri.parse("https://github.com/login/oauth/access_token");
var userEndpoint = Uri.parse("https://api.github.com/user");

var identifier = "9f18bf43ed3bce16e685";
var secret = "78331982064908b8a16725e44843e23481fbae46";

var redirectUrl = Uri.parse("http://localhost:5000/api/au/login");
var credentialsFile = new File("credentials.json");

main() async {
  var token = Platform.environment["GITHUB_TOKEN"];
  var user = token;
  var password = token;

  var client = await oauth2.resourceOwnerPasswordGrant(
      authorizeEndpoint, user, password,
      identifier: identifier, secret: secret);

  new File("credentials.json").writeAsString(client.credentials.toJson());
}
