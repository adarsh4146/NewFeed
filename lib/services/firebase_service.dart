import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/article.dart';

class FirebaseService {
  final _firestore = FirebaseFirestore.instance;

  Future<List<Article>> fetchArticles() async {
    final snapshot = await _firestore.collection('articles').get();
    return snapshot.docs.map((doc) {
      return Article.fromFirestore(doc.data(), doc.id);
    }).toList();
  }
}
