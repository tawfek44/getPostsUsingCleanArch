import '../../domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({required super.posts});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(posts: json['posts']);
  }
}
