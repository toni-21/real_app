class Post {
  String name;
  String image;
  String caption;

  Post({
    required this.name,
    required this.image,
    required this.caption,
  });

  @override
  String toString() {
    return "name: $name, caption: $caption, image: $image";
  }
}
