class AppConfig {
  static const authHost = "https://identitytoolkit.googleapis.com";

  static const firebaseKey = "AIzaSyCS6L4e6mdL63uBHOsMJvXbFRkF4rJuMb4 ";

  static const signup = "$authHost/v1/accounts:signUp?key=$firebaseKey";

    static const login = "$authHost/v1/accounts:signInWithPassword?key=$firebaseKey";
}