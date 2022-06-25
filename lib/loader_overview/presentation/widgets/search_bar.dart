import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordledict_loader/loader_overview/bloc/loader_overview_bloc.dart';
import 'package:wordledict_loader/locator.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoaderOverviewBloc, LoaderOverviewState>(
      builder: (context, state) {
        return TextField(
          controller: state.searchTermController,
          onChanged: (_) => locator<LoaderOverviewBloc>()
              .add(const LoaderOverviewSearchTermChanged()),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => locator<LoaderOverviewBloc>()
                  .add(const LoaderOverviewSearchTermCleared()),
            ),
          ),
        );
      },
    );
  }
}
