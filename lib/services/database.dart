import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseMethods{

  Future addUserInfoToDB(
      String userId, Map<String, dynamic> userInfoMap) async{
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getUserByUserName(String username) async{
    return FirebaseFirestore.instance
        .collection("users")
        .where("username", isEqualTo: username)
        .snapshots();
  }

  Future addMessage(String chatRoomId, String messageId, Map<String, dynamic> messageInfoMap) async {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .collection("chats")
        .doc(messageId)
        .set(messageInfoMap);
  }

  updateLastMessageSend(String chatroomId, Map<String, dynamic> lastMessageInfoMap){
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatroomId)
        .update(lastMessageInfoMap);
  }
}