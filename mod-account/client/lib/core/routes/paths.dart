


class Paths{
  final String baseRoute;
  String login;
  String signup;
  String settings;

  Paths(this.baseRoute) : 
   login = '$baseRoute/login',
   signup = '$baseRoute/signup',
  settings = '$baseRoute/settings';
  
}