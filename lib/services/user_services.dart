import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eccomerce_app_practice/models/user_model.dart';

class UserServices {
  //Create User
  Future createUser(UserModel userModel) async {
    return await FirebaseFirestore.instance
        .collection('userCollection')
        .add(userModel.toJson());
  }

  //Fetch User Record
  Stream<UserModel> fetchUserRecord(String userID) {
    return FirebaseFirestore.instance
        .collection('userCollection')
        .doc(userID)
        .snapshots()
        .map((userData) => UserModel.fromJson(userData.data()!));
  }

//Update User Record
  Future updateUserDetail(UserModel userModel) async {
    return await FirebaseFirestore.instance
        .collection('userCollection')
        .doc(userModel.docId)
        .update(
            {'contactNumber': userModel.contactNumber, 'name': userModel.name});
  }
}
