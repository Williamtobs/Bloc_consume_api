import 'package:bloc_consume_api/features/quotes/bloc/quote_bloc.dart';
import 'package:bloc_consume_api/features/quotes/bloc/quote_event.dart';
import 'package:bloc_consume_api/features/quotes/bloc/quote_state.dart';
import 'package:bloc_consume_api/features/quotes/repository/quotes_repository.dart';
import 'package:bloc_consume_api/features/quotes/ui/widgets/quote_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuoteBloc>(
        create: (context) => QuoteBloc(
              quoteRepository: RepositoryProvider.of<QuotesRepository>(context),
            )..add(LoadQuoteEvent()),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<QuoteBloc, QuoteState>(
            builder: (context, state) {
              if (state is QuoteLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is QuoteLoadedState) {
                return QuoteWidget(
                  quote: state.quote,
                  onRefresh: () {
                    context.read<QuoteBloc>().add(LoadQuoteEvent());
                  },
                );
              } else if (state is QuoteErrorState) {
                return Text(state.message);
              }
              return const SizedBox();
            },
          ),
        )));
  }
}
