import 'package:flutter/material.dart';
import 'package:majester_car_wash/assets.dart';
import 'package:majester_car_wash/core/extensions.dart';
import 'package:majester_car_wash/features/common/presentation/pages/home.dart';
import 'package:majester_car_wash/features/common/presentation/widgets/button.dart';
import 'package:majester_car_wash/features/onboarding/presentation/pages/add.location.dart';

/// this is the welcome page for all users of the application
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            /// background image
            Positioned.fill(
              bottom: context.height * 0.3,
              child: Image.asset(
                Assets.img.carWashBgJPEG,
                fit: BoxFit.cover,
              ),
            ),

            /// cutout
            Positioned(
              right: -context.width * 0.2,
              bottom: -context.height * 0.8,
              top: 0,
              child: Container(
                width: context.width * 2,
                height: context.height * 2,
                decoration: BoxDecoration(
                  color: context.colorScheme.background,
                  shape: BoxShape.circle,
                ),
              ),
            ),

            /// fill up the entire page
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title / heading
                    Text(
                      'Order. Pay. Wash.',
                      style: context.textTheme.headline3,
                    ),
                    const SizedBox(height: 16),
                    // description / subheader
                    Text(
                      'You can order a professional car wash service using a few taps on your device',
                      style: context.textTheme.subtitle1,
                    ),
                    const SizedBox(height: 40),

                    // primary button
                    AppButton(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddLocationPage()),
                      ),
                      label: 'Make a booking',
                      icon: Icons.add_circle_outline,
                    ),

                    const SizedBox(height: 12),

                    /// outlined button
                    SizedBox(
                      width: context.width,
                      child: AppButton(
                        onTap: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                            (route) => false),
                        label: 'Explore',
                        isOutlined: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
