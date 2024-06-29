import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  UserModel? _userFromFirebaseUser(User? user) {
    if (user == null) return null;
    return UserModel(
        uid: user.uid,
        email: user.email ?? '',
        displayName: user.displayName ?? '',
        photoUrl: user.photoURL ?? '');
  }

  Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential result = await _auth.signInWithCredential(credential);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
    await _auth.signOut();
  }
}
