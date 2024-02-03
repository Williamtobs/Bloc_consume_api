import 'package:bloc_consume_api/models/quote_model.dart';

abstract class QuoteState {}

class QuoteLoadingState extends QuoteState {}

class QuoteLoadedState extends QuoteState {
  final QuoteModel quote;

  QuoteLoadedState(this.quote);
}

class QuoteErrorState extends QuoteState {
  final String message;

  QuoteErrorState(this.message);
}
