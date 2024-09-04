import 'package:flutter/material.dart';
import 'package:news_app/core/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsView extends StatelessWidget {
  const ArticleDetailsView({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  article.image ?? '',
                  height: MediaQuery.sizeOf(context).height / 3,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height / 3,
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
              SizedBox(height: 16),
              Text(
                article.title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 16),
              Text(
                article.author ?? 'N/A',
              ),
              SizedBox(height: 8),
              Text(
                article.publishedAt,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              if (article.source != null) ...[
                SizedBox(height: 8),
                Text(
                  article.source!,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
              if (article.description != null) ...[
                Divider(height: 40),
                Text(article.description!),
              ],
              if (article.content != null) ...[
                Divider(height: 40),
                Text(article.content!),
              ],
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.web,
        ),
        onPressed: () => launchUrl(Uri.parse(article.url)),
      ),
    );
  }
}
