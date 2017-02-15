在该项目中，因为三方的SHOWAPI-SDK.jar不在maven库中。所以在使用maven的clean compile编译项目会出错。可以将webapps/WEB-INF/lib/showapi-sdk.jar放置在项目的lib目录下，与项目一起发布即可。
