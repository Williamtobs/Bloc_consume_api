import 'package:bloc_consume_api/features/quotes/bloc/quote_event.dart';
import 'package:bloc_consume_api/features/quotes/bloc/quote_state.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_consume_api/features/quotes/repository/quotes_repository.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final QuotesRepository quoteRepository;

  QuoteBloc({required this.quoteRepository}) : super(QuoteLoadingState()) {
    on<LoadQuoteEvent>((event, emit) async {
      emit(QuoteLoadingState());
      try {
        final quote = await quoteRepository.fetchQuote();
        emit(QuoteLoadedState(quote));
      } catch (e) {
        emit(QuoteErrorState(e.toString()));
      }
    });
  }
}
