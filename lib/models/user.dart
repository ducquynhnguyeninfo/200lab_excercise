class User {
  String? id;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? fullName;
  String? email;
  String? phone;
  String? about;
  String? address;
  double? lng;
  double? lat;
  String? dob;
  int? height;
  int? gender;
  int? weight;
  int? roleId;
  int? typeId;
  RelationshipStatus? relationshipStatus;
  Avatar? avatar;
  Avatar? coverPic;
  List<Avatar>? profilePics;
  List<LookingForTopics>? lookingForTopics;

  User(
      {this.id,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.fullName,
      this.email,
      this.phone,
      this.about,
      this.address,
      this.lng,
      this.lat,
      this.dob,
      this.height,
      this.gender,
      this.weight,
      this.roleId,
      this.typeId,
      this.relationshipStatus,
      this.avatar,
      this.coverPic,
      this.profilePics,
      this.lookingForTopics});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    about = json['about'];
    address = json['address'];
    lng = json['lng'];
    lat = json['lat'];
    dob = json['dob'];
    height = json['height'];
    gender = json['gender'];
    weight = json['weight'];
    roleId = json['role_id'];
    typeId = json['type_id'];
    relationshipStatus =
        RelationshipStatus.fromJson(json['relationship_status']);
    avatar =
        (json['avatar'] != null ? new Avatar.fromJson(json['avatar']) : null)!;
    coverPic = json['cover_pic'];
    if (json['profile_pics'] != null) {
      profilePics = [];
      json['profile_pics'].forEach((v) {
        profilePics!.add(Avatar.fromJson(v));
      });
    }
    if (json['looking_for_topics'] != null) {
      lookingForTopics = [];
      json['looking_for_topics'].forEach((v) {
        lookingForTopics!.add(LookingForTopics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['about'] = this.about;
    data['address'] = this.address;
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    data['dob'] = this.dob;
    data['height'] = this.height;
    data['gender'] = this.gender;
    data['weight'] = this.weight;
    data['role_id'] = this.roleId;
    data['type_id'] = this.typeId;
    data['relationship_status'] = this.relationshipStatus?.toJson();
    if (this.avatar != null) {
      data['avatar'] = this.avatar!.toJson();
    }
    data['cover_pic'] = this.coverPic;
    if (this.profilePics != null) {
      data['profile_pics'] = this.profilePics!.map((v) => v.toJson()).toList();
    }
    if (this.lookingForTopics != null) {
      data['looking_for_topics'] =
          this.lookingForTopics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Avatar {
  String? url;
  int? orgWidth;
  int? orgHeight;
  String? orgUrl;

  Avatar({this.url, this.orgWidth, this.orgHeight, this.orgUrl});

  Avatar.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    orgWidth = json['org_width'];
    orgHeight = json['org_height'];
    orgUrl = json['org_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['org_width'] = this.orgWidth;
    data['org_height'] = this.orgHeight;
    data['org_url'] = this.orgUrl;
    return data;
  }
}

class LookingForTopics {
  String? id;
  String? name;

  LookingForTopics({this.id, this.name});

  LookingForTopics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class RelationshipStatus {
  String? id;
  String? name;

  RelationshipStatus({this.id, this.name});

  RelationshipStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
