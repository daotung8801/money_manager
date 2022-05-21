class Account {
  Account(
      {this.index = 0,
        required this.id,
        required this.icon,
        required this.color,
        required this.description,
        required this.value,
        required this.currentunit,
        required this.visible,
      });

  int index;
  String id;
  String icon;
  String color;
  String description;
  String currentunit;
  int value;
  bool visible;
}