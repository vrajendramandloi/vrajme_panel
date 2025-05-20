class DeviceDetailsModel {
  final String os;
  final String brand;
  final String device;
  final String model;
  final String lastInstalledOn; // Consider using DateTime if more appropriate
  final String versionRelease;

  const DeviceDetailsModel({
    required this.os,
    required this.brand,
    required this.device,
    required this.model,
    required this.lastInstalledOn,
    required this.versionRelease,
  });

  factory DeviceDetailsModel.fromJson(Map<String, dynamic> json) {
    return DeviceDetailsModel(
      os: json['os'] as String? ?? 'Unknown OS', // Provide default values or handle nulls
      brand: json['brand'] as String? ?? 'Unknown Brand',
      device: json['device'] as String? ?? 'Unknown Device',
      model: json['model'] as String? ?? 'Unknown Model',
      lastInstalledOn: json['lastInstalledOn'] as String? ?? DateTime(0).millisecondsSinceEpoch.toString(), // Default to epoch 0
      versionRelease: json['versionRelease'] as String? ?? 'Unknown Version',
    );
  }

  // Method to convert DeviceDetailsModel object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'os': os,
      'brand': brand,
      'device': device,
      'model': model,
      'lastInstalledOn': lastInstalledOn,
      'versionRelease': versionRelease,
    };
  }

  // copyWith method for creating copies with modified fields
  DeviceDetailsModel copyWith({
    String? os,
    String? brand,
    String? device,
    String? model,
    String? lastInstalledOn,
    String? versionRelease,
  }) {
    return DeviceDetailsModel(
      os: os ?? this.os,
      brand: brand ?? this.brand,
      device: device ?? this.device,
      model: model ?? this.model,
      lastInstalledOn: lastInstalledOn ?? this.lastInstalledOn,
      versionRelease: versionRelease ?? this.versionRelease,
    );
  }

  @override
  List<Object?> get props => [os, brand, device, model, lastInstalledOn, versionRelease];
  bool hasSameCoreDetails(DeviceDetailsModel other) {
    return os == other.os &&
          brand == other.brand &&
          device == other.device &&
          model == other.model;
  }
}
