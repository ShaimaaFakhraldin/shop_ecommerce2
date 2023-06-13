import 'package:flutter/material.dart';
 import 'package:shop_ecommerce/shared/components/componets.dart';



class ShopRegisterScreen extends StatelessWidget
{
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context){

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
                          'REGISTER',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Register now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your name';
                            }
                          },
                          label: 'User Name',
                          prefix: Icons.person,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validate: (String ?value) {
                            if (value!.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          suffix:Icons.visibility_outlined,
                          onSubmit: (value)
                          {

                          },
                          isPassword: true,
                          suffixPressed: () {

                          },
                          validate: (String ?value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        // defaultFormField(
                        //   controller: phoneController,
                        //   keyboardType: TextInputType.phone,
                        //   validate: (String ?value) {
                        //     if (value!.isEmpty) {
                        //       return 'please enter your phone number';
                        //     }
                        //   },
                        //   label: 'Phone',
                        //   prefix: Icons.phone,
                        // ),
                        // SizedBox(
                        //   height: 30.0,
                        // ),
                       defaultButton(
                          function: () {
                          },
                          text: 'register',
                          isUpperCase: true,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );

  }
}
