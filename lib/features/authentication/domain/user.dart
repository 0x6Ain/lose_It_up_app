/// Simple class representing the user UID and email.
class User {
  const User({
    required this.uid,
    required this.name,
    this.email,
    this.image,
    this.introduction,
    this.posts = 0,
    this.follower = 0,
    this.following = 0,
  });
  final String uid;
  final String name;
  final String? image;
  final String? email;
  final String? introduction;
  final int posts;
  final int follower;
  final int following;
}
