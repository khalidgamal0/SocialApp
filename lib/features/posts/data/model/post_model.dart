class PostModel {
  String? uid;
  String? name;
  String? profileImage;
  String? dataTime;
  String? text;
  String? postPhoto;

  PostModel({
    this.uid,
    this.name,
    this.profileImage,
    this.dataTime,
    this.text,
    this.postPhoto,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    profileImage = json['profileImage'];
    dataTime = json['dataTime'];
    text = json['text'];
    postPhoto = json['postPhoto'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'profileImage': profileImage,
      'dataTime': dataTime,
      'text': text,
      'postPhoto': postPhoto,
    };
  }
}
