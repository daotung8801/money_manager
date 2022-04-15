class Category {
  final String icon;
  final String title;
  final String bgColor;

  Category(this.icon, this.title, this.bgColor);

  factory Category.fromMap(Map<String, dynamic> json) {
    return Category(
      json['icon'],
      json['title'],
      json['bgColor'],
    );
  }
}