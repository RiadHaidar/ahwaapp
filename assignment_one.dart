//Q1

abstract class Content{  
    Widget build(BuildContext context);
}

class TextContent extends Content{
  String text;
  TextContent(this.text);
  @override
Widget build(BuildContext context){
return Text(text);
}
}
class ImageNetworkContent extends Content{
  String imageURL;

  ImageNetworkContent(this.imageURL)
  @override
Widget build(BuildContext context){
return Image.network(imageURL);
}
}


class ImageAssetContent extends Content{
  String imagePath;

  ImageAssetContent(this.imagePath);
  @override
Widget build(BuildContext context){
return Image.asset(imagePath);
}
}
class VideoContent extends Content{
  String videoURL;

  VideoContent(this.videoURL);
  @override
Widget build(BuildContext context){
return VideoPlayer(videoURL);
 }
}

class ContentDisplay extends StatelessWidget {
  final List<Content> items;
  ContentDisplay(this.items);

   /// [so here im just trying to show you that we can have a list like this:]
  //  List<Content> contentList = [
  //   TextContent("Hello World!"),
  //   ImageNetworkContent("https://example.com/image.jpg"),
  //   ImageAssetContent("assets/local_image.png"),
  //   VideoContent("https://example.com/video.mp4"),
  // ];
  // then pass it like this

  //   @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: contentList.map((item) => item.build(context)).toList(),
  //   );
  // }.       or just as below, 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) => item.build(context)).toList(),
    );
  }
}





//Q2
class UserModel {

  String _name = "";
  int _age = 0;
  String _email = "";

set name(String value){
_name=value;
}
set age(int value){
_age=value;
}
set email(String value){
_email=value;
}
String get name => _name;
int get age=>_age;
String get email=>_email;
  void updateUser(String name, int age, String email) {
    this._name = name;
    this._age = age;
    this._email = email;
  }
}

class FirebaseManager{
  UserModel user;
FirebaseManager(this.user);

  void saveToFirestore(user) {
    print("Saving ${user.name}, ${user.age}, ${user.email} to Firestore");
  }

}




// Q3 

abstract class Navigable {
  void navigate();
}

class Screen implements Navigable {
  @override
  void navigate() {
    print("Navigating normally");
  }
}

class HomeScreen extends Screen {
  @override
  void navigate() {
    print("Navigating to home");
  }
}

class SettingsScreen implements Navigable {
  @override
  void navigate() {
    print("Navigating in a way compatible with settings");
  }
}

class NavigationButton extends StatelessWidget {
  final Navigable target;
  NavigationButton(this.target);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => target.navigate(),
      child: Text("Navigate"),
    );
  }
}








// Q4


abstract class WidgetController {
  void initState();
  void dispose();

}

class SimpleButtonController extends WidgetController {
  @override
  void initState() => print('Init button');
  
  @override
  void dispose() => print('Dispose button');
  

}


abstract class AnimationController {
  void handleAnimation();
}

class SimpleAnimationClass extends AnimationController {
  @override
  void handleAnimation() => print('Handling animation');
}

abstract class NetworkController {
  void handleNetwork();
}

class SimpleNetworkClass extends NetworkController {
  @override
  void handleNetwork() => print('Handling network');
}





  //Q3


abstract class Navigator{
  Screen currentScreen;
  Opener opener;
}
class Screen {
  void navigate();
}


class Opener{
  void open();
}

class HomeScreen implements Navigator {
  @override
  void navigate() {
    print('Navigating to home screen');
  }
}

class SettingsScreen extends Screen {
  @override
  void navigate() {
    throw Exception('Settings don\'t navigate this way!');
  }
}

class NavigationButton extends StatelessWidget {
  final Navigator navigator;
  
  NavigationButton(this.navigator);
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => screen.navigate(),
      child: Text('Navigate'),
    );
  }
}

  






// Q5

abstract class NotificationService{

  void send(String message);

}

class LocalNotificationService extends NotificationService {
    @override
  void send(String message) {
    print('Sending local notification: $message');
  }
}


class RemoteNotificationService extends NotificationService {
    @override
  void send(String message) {
    print('Sending remote notification: $message');
  }
}

class AppNotifier {
  final NotificationService service ;

  AppNotifier() {
    this.service;
  }
  void notifyUser(String message) {
    service.send(message);
  }
}
// finally to use it
void main() {
AppNotifier remoteNotifier = AppNotifier(RemoteNotificationService());
AppNotifier localNotifier = AppNotifier(LocalNotificationService());


remoteNotifier.notifyUser("Remote Notification");
localNotifier.notifyUser("Local Notification");

} 