class MaterialItem {
  final String name;
  final double weight;

  MaterialItem({required this.name, required this.weight});

  MaterialItem copyWith({String? name, double? weight}) {
    return MaterialItem(name: name ?? this.name, weight: weight ?? this.weight);
  }

  Map<String, dynamic> toJson() => {"name": name, "weight": weight};
}
