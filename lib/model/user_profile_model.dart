// class UserProfileModel {
//   bool? status;
//   List<Profile>? data;
//
//   UserProfileModel({this.status, this.data});
//
//   UserProfileModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <Profile>[];
//       json['data'].forEach((v) {
//         data!.add(Profile.fromJson(v));
//       });
//     }
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Profile {
//
//   int? id;
//   int? userId;
//   String? name;
//   String? image;
//   String? email;
//   String? mobile;
//   String? address;
//   String? language;
//   String? interestedWork;
//   String? offlinePlace;
//   String? remotePlace;
//   String? bio;
//   String? education;
//   String? experience;
//   String? personalDetailed;
//   String? createdAt;
//   String? updatedAt;
//   Profile(
//       {this.id,
//         this.userId,
//         this.name,
//         this.image = "assets/images/Profile.png",
//         this.email,
//         this.mobile,
//         this.address,
//         this.language,
//         this.interestedWork,
//         this.offlinePlace,
//         this.remotePlace,
//         this.bio,
//         this.education,
//         this.experience,
//         this.personalDetailed,
//         this.createdAt,
//         this.updatedAt
//
//       });
//
//   Profile.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     name = json['name'];
//     image= json['image'];
//     email = json['email'];
//     mobile = json['mobile'];
//     address = json['address'];
//     language = json['language'];
//     interestedWork = json['interested_work'];
//     offlinePlace = json['offline_place'];
//     remotePlace = json['remote_place'];
//     bio = json['bio'];
//     education = json['education'];
//     experience = json['experience'];
//     personalDetailed = json['personal_detailed'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     data['email'] = this.email;
//     data['mobile'] = this.mobile;
//     data['address'] = this.address;
//     data['language'] = this.language;
//     data['interested_work'] = this.interestedWork;
//     data['offline_place'] = this.offlinePlace;
//     data['remote_place'] = this.remotePlace;
//     data['bio'] = this.bio;
//     data['education'] = this.education;
//     data['experience'] = this.experience;
//     data['personal_detailed'] = this.personalDetailed;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }


//
// class UserProfileModel {
//   ///portfolio
//   int? id;
//   String? cvFile;
//   String? image;
//  /// Profile
//   int? userId;
//   String? name;
//   String? email;
//   String? mobile;
//   String? address;
//   String? language;
//   String? interestedWork;
//   String? offlinePlace;
//   String? remotePlace;
//   String? bio;
//   String? education;
//   String? experience;
//   String? personalDetailed;
//   String? createdAt;
//   String? updatedAt;
//
//   UserProfileModel({
//       this.id,
//       this.cvFile,
//       this.image = "assets/images/Profile.png",
//       this.userId,
//       //this.name ="Rafif Dian Axelingga",
//     this.name,
//     this.email,
//       this.mobile,
//       this.address,
//       this.language,
//       this.interestedWork,
//       this.offlinePlace,
//       this.remotePlace,
//       this.bio,
//       this.education,
//       this.experience,
//       this.personalDetailed,
//       this.createdAt,
//       this.updatedAt});
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'cvFile': cvFile,
//       'image': image,
//       'userId': userId,
//       'name': name,
//       'email': email,
//       'mobile': mobile,
//       'address': address,
//       'language': language,
//       'interestedWork': interestedWork,
//       'offlinePlace': offlinePlace,
//       'remotePlace': remotePlace,
//       'bio': bio,
//       'education': education,
//       'experience': experience,
//       'personalDetailed': personalDetailed,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//     };
//   }
//
//   factory UserProfileModel.fromMap(Map<String, dynamic> map) {
//     return UserProfileModel(
//       id: map['id'] as int,
//       cvFile: map['cvFile'] as String,
//       image: map['image'] as String,
//       userId: map['userId'] as int,
//       name: map['name'] as String,
//       email: map['email'] as String,
//       mobile: map['mobile'] as String,
//       address: map['address'] as String,
//       language: map['language'] as String,
//       interestedWork: map['interestedWork'] as String,
//       offlinePlace: map['offlinePlace'] as String,
//       remotePlace: map['remotePlace'] as String,
//       bio: map['bio'] as String,
//       education: map['education'] as String,
//       experience: map['experience'] as String,
//       personalDetailed: map['personalDetailed'] as String,
//       createdAt: map['createdAt'] as String,
//       updatedAt: map['updatedAt'] as String,
//     );
//   }
// }


class UserProfileModel {
  bool? status;
  Data? data;

  UserProfileModel({this.status, this.data});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Portofolio>? portofolio;
  Profile? profile;

  Data({this.portofolio, this.profile});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['portofolio'] != null) {
      portofolio = <Portofolio>[];
      json['portofolio'].forEach((v) {
        portofolio!.add(Portofolio.fromJson(v));
      });
    }
    profile =
    json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (portofolio != null) {
      data['portofolio'] = portofolio!.map((v) => v.toJson()).toList();
    }
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Portofolio {
  int? id;
  String? cvFile;
  String? name;
  String? image;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Portofolio(
      {this.id,
        this.cvFile,
        this.name,
        this.image,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Portofolio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cvFile = json['cv_file'];
    name = json['name'];
    image = json['image'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cv_file'] = cvFile;
    data['name'] = name;
    data['image'] = image;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
class Profile {
  int? id;
  int? userId;
  String? name;
  String? image;
  String? email;
  String? mobile;
  String? address;
  String? language;
  String? interestedWork;
  String? offlinePlace;
  String? remotePlace;
  String? bio;
  String? education;
  String? experience;
  String? personalDetailed;
  String? createdAt;
  String? updatedAt;

  Profile(
      {this.id,
        this.userId,
        this.name,
        this.image = "assets/images/Profile.png",
        this.email,
        this.mobile,
        this.address,
        this.language,
        this.interestedWork,
        this.offlinePlace,
        this.remotePlace,
        this.bio,
        this.education,
        this.experience,
        this.personalDetailed,
        this.createdAt,
        this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    image= json['image'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    language = json['language'];
    interestedWork = json['interested_work'];
    offlinePlace = json['offline_place'];
    remotePlace = json['remote_place'];
    bio = json['bio'];
    education = json['education'];
    experience = json['experience'];
    personalDetailed = json['personal_detailed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['image'] = image;
    data['email'] = email;
    data['mobile'] = mobile;
    data['address'] = address;
    data['language'] = language;
    data['interested_work'] = interestedWork;
    data['offline_place'] = offlinePlace;
    data['remote_place'] = remotePlace;
    data['bio'] = bio;
    data['education'] = education;
    data['experience'] = experience;
    data['personal_detailed'] = personalDetailed;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

