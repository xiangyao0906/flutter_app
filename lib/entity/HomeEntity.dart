class HomeEntity {
  Meta meta;
  PublicEntity response;

  HomeEntity({this.meta, this.response});

  HomeEntity.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    response = json['response'] != null
        ? new PublicEntity.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    if (this.response != null) {
      data['response'] = this.response.toJson();
    }
    return data;
  }
}

class Meta {
  int status;
  String msg;

  Meta({this.status, this.msg});

  Meta.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    return data;
  }
}

class PublicEntity {
  int lastKey;
  bool hasMore;
  List<Feeds> feeds;

  PublicEntity({this.lastKey, this.hasMore, this.feeds});

  PublicEntity.fromJson(Map<String, dynamic> json) {
    lastKey = json['last_key'];
    hasMore = json['has_more'];
    if (json['feeds'] != null) {
      feeds = new List<Feeds>();
      json['feeds'].forEach((v) {
        feeds.add(new Feeds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_key'] = this.lastKey;
    data['has_more'] = this.hasMore;
    if (this.feeds != null) {
      data['feeds'] = this.feeds.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Feeds {
  String image;
  int type;
  Post post;

  Feeds({this.image, this.type, this.post});

  Feeds.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    type = json['type'];
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['type'] = this.type;
    if (this.post != null) {
      data['post'] = this.post.toJson();
    }
    return data;
  }
}

class Post {
  int id;
  int genre;
  String title;
  String description;
  int publishTime;
  String image;
  int startTime;
  int commentCount;
  bool commentStatus;
  int praiseCount;
  String superTag;
  int pageStyle;
  int postId;
  String appview;
  String filmLength;
  String datatype;
  Category category;
  Column column;

  Post(
      {this.id,
        this.genre,
        this.title,
        this.description,
        this.publishTime,
        this.image,
        this.startTime,
        this.commentCount,
        this.commentStatus,
        this.praiseCount,
        this.superTag,
        this.pageStyle,
        this.postId,
        this.appview,
        this.filmLength,
        this.datatype,
        this.category,
        this.column});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    genre = json['genre'];
    title = json['title'];
    description = json['description'];
    publishTime = json['publish_time'];
    image = json['image'];
    startTime = json['start_time'];
    commentCount = json['comment_count'];
    commentStatus = json['comment_status'];
    praiseCount = json['praise_count'];
    superTag = json['super_tag'];
    pageStyle = json['page_style'];
    postId = json['post_id'];
    appview = json['appview'];
    filmLength = json['film_length'];
    datatype = json['datatype'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    column =
    json['column'] != null ? new Column.fromJson(json['column']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['genre'] = this.genre;
    data['title'] = this.title;
    data['description'] = this.description;
    data['publish_time'] = this.publishTime;
    data['image'] = this.image;
    data['start_time'] = this.startTime;
    data['comment_count'] = this.commentCount;
    data['comment_status'] = this.commentStatus;
    data['praise_count'] = this.praiseCount;
    data['super_tag'] = this.superTag;
    data['page_style'] = this.pageStyle;
    data['post_id'] = this.postId;
    data['appview'] = this.appview;
    data['film_length'] = this.filmLength;
    data['datatype'] = this.datatype;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.column != null) {
      data['column'] = this.column.toJson();
    }
    return data;
  }
}

class Category {
  int id;
  String title;
  String normal;
  String normalHl;
  String imageLab;
  String imageExperiment;

  Category(
      {this.id,
        this.title,
        this.normal,
        this.normalHl,
        this.imageLab,
        this.imageExperiment});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    normal = json['normal'];
    normalHl = json['normal_hl'];
    imageLab = json['image_lab'];
    imageExperiment = json['image_experiment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['normal'] = this.normal;
    data['normal_hl'] = this.normalHl;
    data['image_lab'] = this.imageLab;
    data['image_experiment'] = this.imageExperiment;
    return data;
  }
}

class Column {
  int id;
  String name;
  String description;
  bool subscribeStatus;
  String icon;
  String image;
  String imageLarge;
  String contentProvider;
  int showType;
  int genre;
  int subscriberNum;
  int postCount;
  String sortTime;
  String columnTag;
  Null location;
  Share share;

  Column(
      {this.id,
        this.name,
        this.description,
        this.subscribeStatus,
        this.icon,
        this.image,
        this.imageLarge,
        this.contentProvider,
        this.showType,
        this.genre,
        this.subscriberNum,
        this.postCount,
        this.sortTime,
        this.columnTag,
        this.location,
        this.share});

  Column.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    subscribeStatus = json['subscribe_status'];
    icon = json['icon'];
    image = json['image'];
    imageLarge = json['image_large'];
    contentProvider = json['content_provider'];
    showType = json['show_type'];
    genre = json['genre'];
    subscriberNum = json['subscriber_num'];
    postCount = json['post_count'];
    sortTime = json['sort_time'];
    columnTag = json['column_tag'];
    location = json['location'];
    share = json['share'] != null ? new Share.fromJson(json['share']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['subscribe_status'] = this.subscribeStatus;
    data['icon'] = this.icon;
    data['image'] = this.image;
    data['image_large'] = this.imageLarge;
    data['content_provider'] = this.contentProvider;
    data['show_type'] = this.showType;
    data['genre'] = this.genre;
    data['subscriber_num'] = this.subscriberNum;
    data['post_count'] = this.postCount;
    data['sort_time'] = this.sortTime;
    data['column_tag'] = this.columnTag;
    data['location'] = this.location;
    if (this.share != null) {
      data['share'] = this.share.toJson();
    }
    return data;
  }
}

class Share {
  String url;
  String title;
  String text;
  String image;

  Share({this.url, this.title, this.text, this.image});

  Share.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = json['title'];
    text = json['text'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['title'] = this.title;
    data['text'] = this.text;
    data['image'] = this.image;
    return data;
  }
}
