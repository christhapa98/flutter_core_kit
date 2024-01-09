abstract class Entity {
  Map<String, dynamic> toJson();
}

abstract class EntityParser<T extends Entity> {
  T parseObject(Map<String, dynamic> json);
}
