import 'package:flutter/material.dart';
import 'package:tasky/core/theme/colors/my_colors.dart';
import 'package:tasky/features/auth/presintation/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/undraw_software-engineer.png",
      "title": "Manage your tasks",
      "desc":
          "You can easily manage all of your daily\n tasks in DoMe for free",
    },
    {
      "image": "assets/images/undraw_calendar.png",
      "title": "Create daily routine",
      "desc":
          "In Tasky  you can create your personalized\n routine to stay productive",
    },
    {
      "image": "assets/images/undraw_calendar - Copy.png",
      "title": "Orgonaize your tasks",
      "desc":
          "You can organize your daily tasks by\n adding your tasks into separate categories",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingData.length,
                onPageChanged: (index) => setState(() => currentPage = index),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(onboardingData[index]["image"]!, height: 250),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 5,
                            width: 32,
                            decoration: BoxDecoration(
                              color: currentPage == index
                                  ? MyColor.mainColor
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text(
                        onboardingData[index]["title"]!,
                        style: const TextStyle(fontSize: 32, fontWeight: .w700),
                      ),
                      const SizedBox(height: 42),
                      Text(
                        onboardingData[index]["desc"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: .w400,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            Align(
              alignment: Alignment(.9, .8),
              child: SizedBox(
                width: currentPage == onboardingData.length - 1 ? 150 : 90,
                height: 50,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: MyColor.mainColor,
                  foregroundColor: MyColor.white,
                  onPressed: () {
                    if (currentPage == onboardingData.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Text(
                    currentPage == onboardingData.length - 1
                        ? 'Get Started'
                        : 'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
