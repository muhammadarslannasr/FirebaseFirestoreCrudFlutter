import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
class Api{
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path;
  CollectionReference ref;

  Api(this.path) {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.get(); //Futue Return single result over a period of time
  }
  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots(); // Stream Return multiple values over a period of time
  }
  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.doc(id).get();
  }
  Future<void> removeDocument(String id){
    return ref.doc(id).delete();
  }
  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }
  Future<void> updateDocument(Map data , String id) {
    return ref.doc(id).update(data) ;
  }


}