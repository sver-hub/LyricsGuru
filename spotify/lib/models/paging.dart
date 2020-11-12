import 'package:json_annotation/json_annotation.dart';

part 'paging.g.dart';

@JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
    genericArgumentFactories: true)
class Paging<T> {
  final String href;
  final List<T> items;
  final int limit;
  final int offset;
  final int total;
  final String next;
  final String previous;

  Paging(this.href, this.items, this.limit, this.next, this.offset,
      this.previous, this.total);

  factory Paging.fromJson(
          Map<String, dynamic> json, T Function(Object json) fromJsonT) =>
      _$PagingFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PagingToJson(this, toJsonT);
}
