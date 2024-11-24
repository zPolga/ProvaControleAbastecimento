double calcularMediaConsumo(List<Map<String, dynamic>> abastecimentos) {
  double totalKm = 0;
  double totalLitros = 0;

  for (var i = 1; i < abastecimentos.length; i++) {
    totalKm += abastecimentos[i]['km'] - abastecimentos[i - 1]['km'];
    totalLitros += abastecimentos[i]['litros'];
  }

  return totalKm / totalLitros; // Retorna km/l
}