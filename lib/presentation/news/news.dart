import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/news_provider.dart';
import '../../generated/l10n.dart';
import 'new_card_widget.dart';
import '../../style/colors.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<NewsProvider>().fetchNews());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(S.of(context)?.news ?? ''),
        centerTitle: true,
        backgroundColor: TColors.primary,
        leading: IconButton.outlined(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(width: 1.0, color: Color.fromARGB(255, 7, 7, 7)),
          ),
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            isArabic() ? Icons.arrow_forward : Icons.arrow_back,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {
          if (newsProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (newsProvider.error.isNotEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      newsProvider.error,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => newsProvider.fetchNews(),
                      child: Text(S.of(context)?.tryAgain ?? ''),
                    ),
                  ],
                ),
              ),
            );
          }

          final news = newsProvider.news;
          
          if (news.isEmpty) {
            return Center(
              child: Text(
                S.of(context)?.noNewsAvailable ?? '',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => newsProvider.fetchNews(),
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: news.length,
              itemBuilder: (context, index) => NewsCardWidget(
                news: news[index],
                onTap: () {
                  // TODO: Navigate to news details
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
