import 'package:floor/floor.dart';

@Entity()
class TableEntity {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String name;

  TableEntity(this.id, this.name);
}