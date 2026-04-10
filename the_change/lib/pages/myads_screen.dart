import "package:flutter/material.dart";

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'OLX',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Login or sign up',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(color: Colors.grey),
                ),
                onPressed: () {},
                icon: Image.network(
                  "https://cdn-icons-png.flaticon.com/512/2991/2991148.png",
                  height: 22,
                ),
                label: const Text(
                  "Sign in with Google",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.facebook),
                label: const Text(
                  "Sign in with Facebook",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Continue with Email",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Continue with Phone",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
