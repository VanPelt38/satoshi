import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addDocument(String collection, Map<String, dynamic> data) async {
    try {
      await _db.collection(collection).add(data);
      print("Document added successfully!");
    } catch (e) {
      print("Error adding document: $e");
    }
  }

    Future<void> addDocumentWithId(String collection, String? subcollection1, String docId, Map<String, dynamic> data) async {
    
    final path = subcollection1 == null ? _db.collection(collection) : _db.collection(collection)
    .doc(docId)
    .collection(subcollection1);
    
    try {
      await path.doc(docId).set(data);
      print("Document added successfully!");
    } catch (e) {
      print("Error adding document: $e");
    }
  }

  Future<void> updateDocument(String collection, String docId, Map<String, dynamic> data) async {
    try {
      await _db.collection(collection).doc(docId).update(data);
      print("Document updated successfully!");
    } catch (e) {
      print("Error updating document: $e");
    }
  }

  Future<void> deleteDocument(String collection, String docId) async {
    try {
      await _db.collection(collection).doc(docId).delete();
      print("Document deleted successfully!");
    } catch (e) {
      print("Error deleting document: $e");
    }
  }

  Future<DocumentSnapshot> getDocumentById(String collection, String docId) async {
    try {
      return await _db.collection(collection).doc(docId).get();
    } catch (e) {
      print("Error fetching document: $e");
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getAllDocuments(String collection) async {
    try {
      QuerySnapshot snapshot = await _db.collection(collection).get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print("Error fetching documents: $e");
      return [];
    }
  }

  Stream<List<Map<String, dynamic>>> streamCollection(String collection) {
    return _db.collection(collection).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList());
  }
}