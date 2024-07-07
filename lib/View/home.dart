import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/Service/remote_services.dart';

import '../Model/post.dart';
import 'post_provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Post>? posts;

  // var isLoading = false;

  @override
  void initState() {
    super.initState();
    // getData();
    Provider.of<PostProvider>(context, listen: false).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API INTEGRATION'),
      ),
      body: Consumer<PostProvider>(builder: (context, provider, child) {
        if (provider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (provider.posts == null) {
          return Center(child: Text('No Posts Found'));
        }

        return Container(
          color: Colors.green,
          height: 500,
          width: 200,
          child: ListView.builder(
            itemCount: provider.posts!.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(provider.posts![index].title.toString()),
                ),
              );
            },
          ),
        );
      }),
    );
  }

  // getData() async {
  //   posts = await RemoteService().getPosts();
  //   if (posts != null) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //   }
  // }
}
