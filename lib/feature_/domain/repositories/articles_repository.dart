import 'package:flutter_template_app/core/params/article_request.dart';
import 'package:flutter_template_app/core/resources/data_state.dart';

import '../entities/article.dart';

abstract class ArticlesRepository {
  Future<DataState<List<Article>>> getBreakingNewsArticles(ArticlesRequestParams params);
}
