import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// Widget
// import './anim.dart';
import './input.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Image.asset(
          "assets/icons/ico.png",
          height: MediaQuery.of(context).size.height * .04,
        ),
        actions: [
          Text(
            "v1.0",
            style: Theme.of(context).textTheme.bodySmall!.merge(
                  const TextStyle(fontWeight: FontWeight.normal),
                ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/word art.png"),
            fit: BoxFit.cover,
            opacity: .1,
          ),
        ),
        child: Input(),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * .05,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildIconButton(
              url: "https://github.com/atocodes",
              icon: FontAwesomeIcons.github,
            ),
            buildIconButton(
              url: "https://www.tiktok.com/@atocodes",
              icon: FontAwesomeIcons.tiktok,
            ),
            buildIconButton(
              url: "https://t.me/atocodes",
              icon: FontAwesomeIcons.telegram,
            ),
            buildIconButton(
              url: "https://www.instagram.com/ato.codes/",
              icon: FontAwesomeIcons.instagram,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIconButton({required String url, required IconData icon}) {
    return IconButton(
      icon: FaIcon(
        icon,
        color: Colors.white,
      ),
      onPressed: () async {
        Uri uri = Uri.parse(url);
        try {
          await canLaunchUrl(uri);
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } on Exception {
          return;
        }
      },
    );
  }
}
