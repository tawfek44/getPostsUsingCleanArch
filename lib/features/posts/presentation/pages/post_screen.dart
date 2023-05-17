import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/posts/presentation/bloc/get_post_cubit.dart';

import '../../../../core/dependancy_injection/injection.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<GetPostCubit, GetPostState>(
        builder: (context, state) {
          print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
          if (state is LoadedGetPostState) {
            return Center(
              child: Text(state.post.length().toString()),
            );
          } else {
            return const Center(
              child: Text(
                '5555555',
                style: TextStyle(color: Colors.black),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<GetPostCubit>().getPosts();
  }
}
