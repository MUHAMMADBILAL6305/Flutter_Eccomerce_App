import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eccomerce_app_practice/models/order_model.dart';

class OrderServices {
  //Place Order
  Future placeOrder(OrderModel orderModel) async {
    return await FirebaseFirestore.instance
        .collection('orderCollection')
        .add(orderModel.toJson());
  }

  //Get My Order
  Stream<List<OrderModel>> streamMyOrders(String myID) {
    return FirebaseFirestore.instance
        .collection('orderCollection')
        .where('user.docID', isEqualTo: myID)
        .snapshots()
        .map((list) => list.docs
            .map((sinlgleDoc) => OrderModel.fromJson(sinlgleDoc.data()))
            .toList());
  }

//Get My Processed Orders
  Stream<List<OrderModel>> streamMyProcessedOrders(String myID) {
    return FirebaseFirestore.instance
        .collection('orderCollection')
        .where('user.docID', isEqualTo: myID)
        .where('isProcessed', isEqualTo: true)
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) => OrderModel.fromJson(singleDoc.data()))
            .toList());
  }
//Get My Completed Orders
  Stream<List<OrderModel>> streamMyCompletedOrders(String myID) {
    return FirebaseFirestore.instance
        .collection('orderCollection')
        .where('user.docID', isEqualTo: myID)
        .where('isCompleted', isEqualTo: true)
        .snapshots()
        .map((list) => list.docs
        .map((singleDoc) => OrderModel.fromJson(singleDoc.data()))
        .toList());
  }
//Get My Pending Orders
  Stream<List<OrderModel>> streamMyPendingOrders(String myID) {
    return FirebaseFirestore.instance
        .collection('orderCollection')
        .where('user.docID', isEqualTo: myID)
        .where('isPending', isEqualTo: true)
        .snapshots()
        .map((list) => list.docs
        .map((singleDoc) => OrderModel.fromJson(singleDoc.data()))
        .toList());
  }
}
