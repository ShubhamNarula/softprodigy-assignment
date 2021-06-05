class Response{
  List<String> images = [];

  Response.fromJson(json){
    if(json != null){
      for(int i=0; i<json.length; i++){
        images.add(json[i]);
      }
    }
  }
}