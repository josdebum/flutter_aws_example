import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_aws_project/models/ModelProvider.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
class HomeRepo {
  List<Post> fetchedPost = [];

  Future<void> savePost(String fullName,
      String description,
      String emailAddress,
      String phoneNumber,
      String amount,
      String dateCollected,
      String dateDue,) async {
    final newPost = Post(
        title: 'New Post being saved',
        status: PostStatus.INACTIVE,
        fullName: fullName,
        description: description,
        emailAddress: emailAddress,
        phoneNumber: phoneNumber,
        amount: amount,
        dateCollected: dateCollected,
        dateDue: dateDue
    );

    try {
      await Amplify.DataStore.save(newPost);
    } on DataStoreException catch (e) {
      safePrint('Something went wrong saving model: ${e.message}');
    }
  }

  Future queryPosts() async {
    try {
      print("hello world");
      final posts = await Amplify.DataStore.query(Post.classType);
      print("response is ${posts[0].fullName}");
      print("response is ${posts.length}");
      print("response is ${posts}");

      fetchedPost = posts;
      return posts;
      safePrint('Posts: $posts');
    } on DataStoreException catch (e) {
      safePrint('Something went wrong querying posts: ${e.message}');
    }
  }



  Future<void> uploadExampleData() async {
    const dataString = 'Example file contents';

    try {
      final result = await Amplify.Storage.uploadData(
        data: S3DataPayload.string(dataString),
        key: 'ExampleKey',
        onProgress: (progress) {
          safePrint('Transferred bytes: ${progress.transferredBytes}');
        },
      ).result;

      safePrint('Uploaded data to location: ${result.uploadedItem.key}');
    } on StorageException catch (e) {
      safePrint(e.message);
    }
  }
}


