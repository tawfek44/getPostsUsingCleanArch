import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final List<PostInfo> posts;
  const Post({required this.posts});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class PostInfo extends Equatable {
  final int id;
  final String title;
  final String body;

  const PostInfo({required this.id, required this.title, required this.body});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
