// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String id;
  final String type;
  final Site site;
  final Employee verificator;
  final String createdDate;
  final String? submittedDate;
  final String? verifiedDate;
  final String status;
  final List<TaskAsset>? assets;
  const Task({
    required this.id,
    required this.type,
    required this.site,
    required this.verificator,
    required this.createdDate,
    this.submittedDate,
    this.verifiedDate,
    required this.status,
    this.assets,
  });

  Task copyWith({
    String? id,
    String? type,
    Site? site,
    Employee? verifier,
    String? createdDate,
    String? submittedDate,
    String? verifiedDate,
    String? status,
    List<TaskAsset>? assets,
  }) {
    return Task(
      id: id ?? this.id,
      type: type ?? this.type,
      site: site ?? this.site,
      verificator: verifier ?? this.verificator,
      createdDate: createdDate ?? this.createdDate,
      submittedDate: submittedDate ?? this.submittedDate,
      verifiedDate: verifiedDate ?? this.verifiedDate,
      status: status ?? this.status,
      assets: assets ?? this.assets,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'site': site.toMap(),
      'verificator': verificator.toMap(),
      'createdDate': createdDate,
      'submittedDate': submittedDate,
      'verifiedDate': verifiedDate,
      'status': status,
      'assets': assets?.map((x) => x.toMap()).toList(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] ?? '',
      type: map['type'] ?? '',
      site: Site.fromMap(map['site']),
      verificator: Employee.fromMap(map['verificator']),
      createdDate: map['createdDate'] ?? '',
      submittedDate: map['submittedDate'],
      verifiedDate: map['verifiedDate'],
      status: map['status'] ?? '',
      assets: map['assets'] != null
          ? List<TaskAsset>.from(
              map['assets']?.map((x) => TaskAsset.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Todo(id: $id, type: $type, site: $site, verificator: $verificator, createdDate: $createdDate, submittedDate: $submittedDate, verifiedDate: $verifiedDate, status: $status, assets: $assets)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      type,
      site,
      verificator,
      createdDate,
      submittedDate,
      verifiedDate,
      status,
      assets,
    ];
  }
}

class TaskAsset extends Equatable {
  final int id;
  final String category;
  final String? subcategory;
  final String description;
  final String? url;
  final String? createdDate;
  final String? lastModified;
  final bool isPassed;
  const TaskAsset({
    required this.id,
    required this.category,
    this.subcategory,
    required this.description,
    this.url,
    this.createdDate,
    this.lastModified,
    required this.isPassed,
  });

  TaskAsset copyWith({
    int? id,
    String? category,
    String? subcategory,
    String? description,
    String? url,
    String? createdDate,
    String? lastModified,
    bool? isPassed,
  }) {
    return TaskAsset(
      id: id ?? this.id,
      category: category ?? this.category,
      subcategory: subcategory ?? this.subcategory,
      description: description ?? this.description,
      url: url ?? this.url,
      createdDate: createdDate ?? this.createdDate,
      lastModified: lastModified ?? this.lastModified,
      isPassed: isPassed ?? this.isPassed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'subcategory': subcategory,
      'description': description,
      'url': url,
      'createdDate': createdDate,
      'lastModified': lastModified,
      'isPassed': isPassed,
    };
  }

  factory TaskAsset.fromMap(Map<String, dynamic> map) {
    return TaskAsset(
      id: map['id']?.toInt() ?? 0,
      category: map['category'] ?? '',
      subcategory: map['subcategory'],
      description: map['description'] ?? '',
      url: map['url'],
      createdDate: map['createdDate'],
      lastModified: map['lastModified'],
      isPassed: map['isPassed'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskAsset.fromJson(String source) =>
      TaskAsset.fromMap(json.decode(source));

  @override
  String toString() {
    return '_Asset(id: $id, category: $category, subcategory: $subcategory, description: $description, url: $url, createdDate: $createdDate, lastModified: $lastModified, isPassed: $isPassed)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      category,
      subcategory,
      description,
      url,
      createdDate,
      lastModified,
      isPassed,
    ];
  }
}

class Employee extends Equatable {
  final String nik;
  final String name;
  const Employee({
    required this.nik,
    required this.name,
  });

  Employee copyWith({
    String? nik,
    String? name,
  }) {
    return Employee(
      nik: nik ?? this.nik,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nik': nik,
      'name': name,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      nik: map['nik'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source));

  @override
  String toString() => '_Employee(nik: $nik, name: $name)';

  @override
  List<Object> get props => [nik, name];
}

class Site extends Equatable {
  final String siteId;
  final String name;
  final String towerType;
  final int towerHeight;
  final String fabricator;
  final String? tenant;
  final String region;
  final String province;
  final String kabupaten;
  final String? address;
  final double? longitude;
  final double? latitude;
  const Site({
    required this.siteId,
    required this.name,
    required this.towerType,
    required this.towerHeight,
    required this.fabricator,
    this.tenant,
    required this.region,
    required this.province,
    required this.kabupaten,
    this.address,
    this.longitude,
    this.latitude,
  });

  Site copyWith({
    String? siteId,
    String? name,
    String? towerType,
    int? towerHeight,
    String? fabricator,
    String? tenant,
    String? region,
    String? province,
    String? kabupaten,
    String? address,
    double? longitude,
    double? latitude,
  }) {
    return Site(
      siteId: siteId ?? this.siteId,
      name: name ?? this.name,
      towerType: towerType ?? this.towerType,
      towerHeight: towerHeight ?? this.towerHeight,
      fabricator: fabricator ?? this.fabricator,
      tenant: tenant ?? this.tenant,
      region: region ?? this.region,
      province: province ?? this.province,
      kabupaten: kabupaten ?? this.kabupaten,
      address: address ?? this.address,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'siteId': siteId,
      'name': name,
      'towerType': towerType,
      'towerHeight': towerHeight,
      'fabricator': fabricator,
      'tenant': tenant,
      'region': region,
      'province': province,
      'kabupaten': kabupaten,
      'address': address,
      'longitude': longitude,
      'latitude': latitude,
    };
  }

  factory Site.fromMap(Map<String, dynamic> map) {
    return Site(
      siteId: map['siteId'] ?? '',
      name: map['name'] ?? '',
      towerType: map['towerType'] ?? '',
      towerHeight: map['towerHeight']?.toInt() ?? 0,
      fabricator: map['fabricator'] ?? '',
      tenant: map['tenant'],
      region: map['region'] ?? '',
      province: map['province'] ?? '',
      kabupaten: map['kabupaten'] ?? '',
      address: map['address'],
      longitude: map['longitude']?.toDouble(),
      latitude: map['latitude']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Site.fromJson(String source) => Site.fromMap(json.decode(source));

  @override
  String toString() {
    return '_Site(siteId: $siteId, name: $name, towerType: $towerType, towerHeight: $towerHeight, fabricator: $fabricator, tenant: $tenant, region: $region, province: $province, kabupaten: $kabupaten, address: $address, longitude: $longitude, latitude: $latitude)';
  }

  @override
  List<Object?> get props {
    return [
      siteId,
      name,
      towerType,
      towerHeight,
      fabricator,
      tenant,
      region,
      province,
      kabupaten,
      address,
      longitude,
      latitude,
    ];
  }
}
