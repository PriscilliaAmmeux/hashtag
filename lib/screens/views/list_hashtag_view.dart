import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_images/models/hashtag_model.dart';
import 'package:my_images/services/list_hashtag/list_hashtag_bloc.dart';

class ListHashtagView extends StatelessWidget {
  const ListHashtagView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListHashtagBloc, ListHashtagState>(
        builder: (builder, state) {
      List<HashtagModel> listHashtag = [];

      if (state is ListHashtagInitialState) {
        listHashtag = state.listHashtag;
      }

      return listHashtag.isEmpty
          ? const Center(
              child: Text('No hashtags'),
            )
          : ListView.builder(
              itemCount: listHashtag.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    key: Key(index.toString()),
                    onDismissed: (direction) => {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text("")))
                        },
                    background: Container(
                        color: const Color.fromARGB(255, 203, 30, 233)),
                    child: Card(
                        child: ListTile(
                      title: Text(
                        listHashtag[index].name,
                      ),
                    )));
              });
    });
  }
}
