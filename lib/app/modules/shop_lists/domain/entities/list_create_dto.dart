class ListCreateDTO {
  final String name;
  final double? budgetLimit;
  final bool smartGrouping;
  final String typeId;

  ListCreateDTO({
    required this.name,
    this.budgetLimit,
    required this.smartGrouping,
    required this.typeId,
  });
}
