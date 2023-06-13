import '../../../models/login_model.dart';

abstract class ShoppingAppLoginState{}
class ShoppingLoginInitState extends  ShoppingAppLoginState {}
class ShoppingLoginLoadingState extends  ShoppingAppLoginState {}
class ShoppingLoginSuccessState extends  ShoppingAppLoginState {
  final LoginModel loginModel ;
  ShoppingLoginSuccessState({ required this.loginModel});
}
class ShoppingLoginErrorState extends  ShoppingAppLoginState {
  final String error ;
  ShoppingLoginErrorState({required this.error});

}
