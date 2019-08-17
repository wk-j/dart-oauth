// import 'dart:html' as prefix0;
import 'dart:io';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:http/http.dart' as http;

var endpoint = Uri.parse("https://github.com/login/oauth/authorize");
var tokenEndpoint = Uri.parse("https://github.com/login/oauth/access_token");
var userEndpoint = Uri.parse("https://api.github.com/user");

var identifier = "9f18bf43ed3bce16e685";
var secret = "78331982064908b8a16725e44843e23481fbae46";

var redirectUrl = Uri.parse("http://localhost:5000/api/au/login");
var credentialsFile = new File("credentials.json");

Future<oauth2.Client> getClient() async {
  var exists = await credentialsFile.exists();
  if (exists) {
    var credentials =
        new oauth2.Credentials.fromJson(await credentialsFile.readAsString());
    return new oauth2.Client(credentials,
        identifier: identifier, secret: secret);
  }

  var grant = new oauth2.AuthorizationCodeGrant(
      identifier, endpoint, tokenEndpoint,
      secret: secret);

  // await redirect(grant.getAuthorizationUrl(redirectUrl));

  // var request = await listen(redirectUrl);
  // return await grant.handleAuthorizationResponse(request.uri.queryParameters);
}
