import 'package:flutter/material.dart';
import 'dart:ui';
import 'feed_page.dart' as prefix;

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _postTextController = TextEditingController();
  final List<String> items = [];
  List<String> _postList = [];

  late String _postText;

  void _submitPost() {
    if (_formKey.currentState?.validate() ?? false) {
      // add null check
      // form is valid, add post to the list
      setState(() {
        _postList.add(_postTextController.text);
        _postTextController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Post submitted!'),
          ),
        );
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Post'),
        ),
        body: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Write your post...',
                  ),
                  validator: (value) {
                    if (_postList.isEmpty == true) {
                      return 'Please enter text';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    String _postText = value!;
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _submitPost,
              child: Text('Submit'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${items[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
