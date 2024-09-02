import 'package:flutter/material.dart';
import 'package:news_app/core/models/article.dart';

import '../../views/article_details/view.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleDetailsView(
        article: article,
      ))),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.network(
                article.image ?? '',
                height: MediaQuery.sizeOf(context).height / 4,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height / 4,
                    child: LayoutBuilder(
                      builder: (context, constraints) => Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                          size: constraints.maxHeight - 80,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          article.author ?? 'N/A',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        article.publishedAt,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
