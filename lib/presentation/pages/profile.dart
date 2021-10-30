import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  void _launchURL(_url) async {
    if(await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.pink, Colors.blue]
              )
            ),
            child: SizedBox(
              width: double.infinity,
              height: 250.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://media-exp1.licdn.com/dms/image/C5603AQELLQIvycMmIQ/profile-displayphoto-shrink_800_800/0/1608532801641?e=1640822400&v=beta&t=LUN1_ln4kCLzMHWFaTzXq5Ht2vQqptd3n9jnOa8wLEk",
                      ),
                      radius: 50.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "Torikul Aziz - 19552011277",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                     SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Fullstack Programmer",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ]
                )
              )
            )
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: () {
                _launchURL("https://www.instagram.com/thoriqul_azis/");
              },
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListTile(
                leading: Icon(FontAwesomeIcons.instagram, color: Colors.pink,),
                title: Text("Instagram"),
                subtitle: Text("Mari berteman!"),
                trailing: Icon(Icons.arrow_forward_ios, size: 20,),
              ),
            ),
          ),
           SizedBox(height: 5),
          InkWell(
            onTap: () {
                _launchURL("https://www.linkedin.com/in/moh-torikul-aziz");
              },
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListTile(
                leading: Icon(FontAwesomeIcons.linkedin, color: Colors.blue,),
                title: Text("LinkedIn"),
                subtitle: Text("Mari terhubung!"),
                trailing: Icon(Icons.arrow_forward_ios, size: 20,),
              ),
            ),
          )    
        ],
      ),
    );
  }
}
