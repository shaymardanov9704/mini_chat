import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_chat/firebase/auth_service.dart';
import 'package:mini_chat/ui/chats.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future googleSignIn() async {
    await AuthService().signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const SizedBox()),
      body: Padding(
        padding: const EdgeInsets.only(right: 24, bottom: 50, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const Stack(
            //   children: [
            //     SizedBox(
            //       width: double.infinity,
            //       height: 100,
            //       child: Center(
            //         child: Icon(
            //           Icons.account_circle,
            //           color: Colors.black,
            //           size: 110,
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       height: 100,
            //       child: Align(
            //         alignment: Alignment(0.25, 1),
            //         child: Icon(
            //           Icons.add_circle,
            //           color: Colors.blue,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 32),
            // Container(
            //   height: 45,
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   margin: const EdgeInsets.only(bottom: 12),
            //   decoration: BoxDecoration(
            //     color: Colors.grey.withOpacity(0.2),
            //     borderRadius: BorderRadius.circular(12),
            //   ),
            //   child: Center(
            //     child: TextField(
            //       controller: emailController,
            //       cursorColor: Colors.transparent,
            //       decoration: const InputDecoration(
            //         hintText: "Email",
            //         border: InputBorder.none,
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   height: 45,
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   decoration: BoxDecoration(
            //     color: Colors.grey.withOpacity(0.2),
            //     borderRadius: BorderRadius.circular(12),
            //   ),
            //   child: Center(
            //     child: TextField(
            //       controller: passwordController,
            //       cursorColor: Colors.transparent,
            //       decoration: const InputDecoration(
            //         hintText: "Password",
            //         border: InputBorder.none,
            //       ),
            //     ),
            //   ),
            // ),
            // const Expanded(child: SizedBox()),
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () async {
                try {
                  await AuthService().createUserWithEmailAndPass(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ChatsPage(),
                    ),
                  );
                } catch (e) {
                  print(e);
                }
              },
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_circle, size: 30),
                      SizedBox(width: 12),
                      Text(
                        "Sign in with Google",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
