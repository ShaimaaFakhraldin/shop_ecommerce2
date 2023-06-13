import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/shared/components/componets.dart';

import '../register/shop_register_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ShopLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passController = TextEditingController();
     return  BlocProvider(
       create : (con ) => ShopLoginCubit(),
       child: BlocConsumer<ShopLoginCubit ,ShoppingAppLoginState>(
         listener: (context ,state){},
         builder: ( cont , state){
           return Scaffold(
             appBar: AppBar(),
             body: Center(
               child: SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Form(
                     key: formKey,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           'LOGIN',
                           style:
                           Theme.of(context).textTheme.headline4!.copyWith(
                             color: Colors.black,
                           ),
                         ),
                         Text(
                           'Login now to browse our hot offers',
                           style:
                           Theme.of(context).textTheme.bodyText1!.copyWith(
                             color: Colors.grey,
                           ),
                         ),
                         SizedBox(
                           height: 30,
                         ),
                         defaultFormField(
                           controller: emailController,
                           keyboardType: TextInputType.name,
                           validate: (String? value) {
                             if (value!.isEmpty) {
                               return 'please enter your User name';
                             }
                           },
                           label: 'User name ',
                           prefix: Icons.person,
                         ),
                         SizedBox(
                           height: 15,
                         ),
                         defaultFormField(
                           controller: passController,
                           keyboardType: TextInputType.visiblePassword,
                           onSubmit: (value) {

                           },
                           validate: (String? value) {
                             if (value!.isEmpty) {
                               return 'password is too short';
                             }
                           },
                           label: 'Password',
                           suffix: Icons.visibility_outlined,
                           prefix: Icons.lock_outline,
                           isPassword: true,
                           suffixPressed: () {

                           },
                         ),
                         SizedBox(
                           height: 15,
                         ),
                         defaultButton(
                             function: () {

                             },
                             text: 'login')
                         ,
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Spacer(),
                             Text(
                               'Don\'t have an account?',
                             ),
                             defaultTextButton(
                                 function: () {
                                   navigateTo(context, ShopRegisterScreen());
                                 },
                                 text: 'register'),
                             Spacer()
                           ],
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             ),
           );
         },
       )

     );
  }
}
