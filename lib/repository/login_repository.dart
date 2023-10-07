import '../model/user.dart';

class FailedLogin implements Exception{
  String errorMessage(){
    return "Login Failed";
  }
}

class LoginRepository {
  //Data Akun Dummy
  String username = "user";
  String password = "123";

  Future<User> login(String username, String password) async {
    print("Logining...");
    User userData = User();
    await Future.delayed(Duration(seconds: 3), (){
      if(this.username == username && this.password == password){
        userData = User(
          name: username,
          password: password,
          token: "12345"
        );
      }else if(username == '' || password == ''){
        throw 'Username or password cannot be empty';
      }else{
        throw FailedLogin();
      }
    });
  return userData;
  }
}

// class LoginRepository {
//   // List to store user data dynamically
//   List<User> users = [];

//   // Constructor to initialize the list with some dummy data
//   LoginRepository() {
//     // Initialize with some initial dummy user data
//     users.add(User(name: "user1", password: "123", token: "12345"));
//     users.add(User(name: "user2", password: "456", token: "67890"));
//     // You can add more initial users as needed
//   }

//   // Register a new user dynamically
//   void registerUser(String username, String password) {
//     // Check if the username is already taken
//     if (users.any((user) => user.name == username)) {
//       throw 'Username is already taken';
//     }

//     // Add the new user to the list
//     users.add(User(name: username, password: password, token: generateToken()));
//   }

//   // Generate a token for a registered user (you can customize this)
//   String generateToken() {
//     // Generate a random token (you can implement this as needed)
//     return "generated_token";
//   }

//   // Login with dynamically checked user data
//   Future<User> login(String username, String password) async {
//     print("Logining...");
//     await Future.delayed(Duration(seconds: 3), () {
//       for (User user in users) {
//         if (user.name == username && user.password == password) {
//           return user; // Return the matched user
//         }
//       }
//       if (username == '' || password == '') {
//         throw 'Username or password cannot be empty';
//       } else {
//         throw FailedLogin();
//       }
//     });
//     return null; // Return null if no user is found (you can handle this case as needed)
//   }
// }
