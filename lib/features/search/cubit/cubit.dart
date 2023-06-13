import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/features/search/cubit/states.dart';



class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);


  void search(String text) {
    emit(SearchLoadingState());


  }
}
