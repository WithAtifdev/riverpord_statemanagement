
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpord_management/futureprovider/Api/provider/post_provider.dart';

class Postscreen extends ConsumerWidget {
  const Postscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Api'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    body: post.when(
  skipLoadingOnRefresh: true,

  data: (posts) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final item = posts[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Post ID
                Text(
                  'Post #${item.id}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                // Title
                Text(
                  item.title ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Body
                Text(
                  item.body ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                // User ID
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'User ID: ${item.userId}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  },

  loading: () => const Center(
    child: CircularProgressIndicator(),
  ),

  error: (error, stack) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline,
          size: 50,
        ),
        const SizedBox(height: 10),
        const Text('Something went wrong'),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {
            ref.invalidate(postProvider);
          },
          child: const Text('Retry'),
        ),
      ],
    ),
  ),
), 
      );
  }
}