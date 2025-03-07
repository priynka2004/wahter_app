class WeatherInfoItem  {
Location? location;
Current? current;

WeatherInfoItem ({this.location, this.current});

WeatherInfoItem .fromJson(Map<String, dynamic> json) {
location = json['location'] != null ? new Location.fromJson(json['location']) : null;
current = json['current'] != null ? new Current.fromJson(json['current']) : null;
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
if (this.location != null) {
data['location'] = this.location!.toJson();
}
if (this.current != null) {
data['current'] = this.current!.toJson();
}
return data;
}
}

class Location {
String? name;
String? region;
String? country;
double? lat;
double? lon;
String? tzId;
int? localtimeEpoch;
String? localtime;

Location({this.name, this.region, this.country, this.lat, this.lon, this.tzId, this.localtimeEpoch, this.localtime});

Location.fromJson(Map<String, dynamic> json) {
name = json['name'];
region = json['region'];
country = json['country'];
lat = json['lat'];
lon = json['lon'];
tzId = json['tz_id'];
localtimeEpoch = json['localtime_epoch'];
localtime = json['localtime'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['name'] = this.name;
data['region'] = this.region;
data['country'] = this.country;
data['lat'] = this.lat;
data['lon'] = this.lon;
data['tz_id'] = this.tzId;
data['localtime_epoch'] = this.localtimeEpoch;
data['localtime'] = this.localtime;
return data;
}
}

class Current {
int? lastUpdatedEpoch;
String? lastUpdated;
double? tempC;
int? tempF;
int? isDay;
Condition? condition;
double? windMph;
double? windKph;
int? windDegree;
String? windDir;
int? pressureMb;
double? pressureIn;
int? precipMm;
int? precipIn;
int? humidity;
int? cloud;
double? feelslikeC;
double? feelslikeF;
double? windchillC;
double? windchillF;
int? heatindexC;
double? heatindexF;
double? dewpointC;
int? dewpointF;
int? visKm;
int? visMiles;
double? uv;
double? gustMph;
double? gustKph;
AirQuality? airQuality;

Current({this.lastUpdatedEpoch, this.lastUpdated, this.tempC, this.tempF, this.isDay, this.condition, this.windMph, this.windKph, this.windDegree, this.windDir, this.pressureMb, this.pressureIn, this.precipMm, this.precipIn, this.humidity, this.cloud, this.feelslikeC, this.feelslikeF, this.windchillC, this.windchillF, this.heatindexC, this.heatindexF, this.dewpointC, this.dewpointF, this.visKm, this.visMiles, this.uv, this.gustMph, this.gustKph, this.airQuality});

Current.fromJson(Map<String, dynamic> json) {
lastUpdatedEpoch = json['last_updated_epoch'];
lastUpdated = json['last_updated'];
tempC = json['temp_c'];
tempF = json['temp_f'];
isDay = json['is_day'];
condition = json['condition'] != null ? new Condition.fromJson(json['condition']) : null;
windMph = json['wind_mph'];
windKph = json['wind_kph'];
windDegree = json['wind_degree'];
windDir = json['wind_dir'];
pressureMb = json['pressure_mb'];
pressureIn = json['pressure_in'];
precipMm = json['precip_mm'];
precipIn = json['precip_in'];
humidity = json['humidity'];
cloud = json['cloud'];
feelslikeC = json['feelslike_c'];
feelslikeF = json['feelslike_f'];
windchillC = json['windchill_c'];
windchillF = json['windchill_f'];
heatindexC = json['heatindex_c'];
heatindexF = json['heatindex_f'];
dewpointC = json['dewpoint_c'];
dewpointF = json['dewpoint_f'];
visKm = json['vis_km'];
visMiles = json['vis_miles'];
uv = json['uv'];
gustMph = json['gust_mph'];
gustKph = json['gust_kph'];
airQuality = json['air_quality'] != null ? new AirQuality.fromJson(json['air_quality']) : null;
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['last_updated_epoch'] = this.lastUpdatedEpoch;
data['last_updated'] = this.lastUpdated;
data['temp_c'] = this.tempC;
data['temp_f'] = this.tempF;
data['is_day'] = this.isDay;
if (this.condition != null) {
data['condition'] = this.condition!.toJson();
}
data['wind_mph'] = this.windMph;
data['wind_kph'] = this.windKph;
data['wind_degree'] = this.windDegree;
data['wind_dir'] = this.windDir;
data['pressure_mb'] = this.pressureMb;
data['pressure_in'] = this.pressureIn;
data['precip_mm'] = this.precipMm;
data['precip_in'] = this.precipIn;
data['humidity'] = this.humidity;
data['cloud'] = this.cloud;
data['feelslike_c'] = this.feelslikeC;
data['feelslike_f'] = this.feelslikeF;
data['windchill_c'] = this.windchillC;
data['windchill_f'] = this.windchillF;
data['heatindex_c'] = this.heatindexC;
data['heatindex_f'] = this.heatindexF;
data['dewpoint_c'] = this.dewpointC;
data['dewpoint_f'] = this.dewpointF;
data['vis_km'] = this.visKm;
data['vis_miles'] = this.visMiles;
data['uv'] = this.uv;
data['gust_mph'] = this.gustMph;
data['gust_kph'] = this.gustKph;
if (this.airQuality != null) {
data['air_quality'] = this.airQuality!.toJson();
}
return data;
}
}

class Condition {
String? text;
String? icon;
int? code;

Condition({this.text, this.icon, this.code});

Condition.fromJson(Map<String, dynamic> json) {
text = json['text'];
icon = json['icon'];
code = json['code'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['text'] = this.text;
data['icon'] = this.icon;
data['code'] = this.code;
return data;
}
}

class AirQuality {
double? co;
double? no2;
int? o3;
double? so2;
double? pm25;
double? pm10;
int? usEpaIndex;
int? gbDefraIndex;

AirQuality({this.co, this.no2, this.o3, this.so2, this.pm25, this.pm10, this.usEpaIndex, this.gbDefraIndex});

AirQuality.fromJson(Map<String, dynamic> json) {
co = json['co'];
no2 = json['no2'];
o3 = json['o3'];
so2 = json['so2'];
pm25 = json['pm2_5'];
pm10 = json['pm10'];
usEpaIndex = json['us-epa-index'];
gbDefraIndex = json['gb-defra-index'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['co'] = this.co;
data['no2'] = this.no2;
data['o3'] = this.o3;
data['so2'] = this.so2;
data['pm2_5'] = this.pm25;
data['pm10'] = this.pm10;
data['us-epa-index'] = this.usEpaIndex;
data['gb-defra-index'] = this.gbDefraIndex;
return data;
}
}