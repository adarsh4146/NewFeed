import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/article.dart';
import '../services/firebase_service.dart';

final articleProvider = FutureProvider<List<Article>>((ref) async {
  final firebaseService = FirebaseService();
  return firebaseService.fetchArticles();
});
