

import Foundation
 public class AppUserInfo: Codable {
    
    public var isLocationUpdated: Bool?
    public var latitude: String?
    public var location: String?
    public var locationId: String?
    public var longitude: String?
    public var mambaId: String?
    public var cityId : Int?
    public var nickName : String?
    public var cityName: String?
    public var addressId: String?
    
    
    enum CodingKeys: String, CodingKey {
        case isLocationUpdated
        case latitude
        case location
        case locationId
        case longitude
        case mambaId
        case cityId
        case nickName
        case cityName
        case addressId
    }
    
    
    
    public func encode(to encoder: Encoder) throws {
        print("encode app")
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.isLocationUpdated, forKey: .isLocationUpdated)
        try container.encodeIfPresent(self.latitude, forKey: .latitude)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.locationId, forKey: .locationId)
        try container.encodeIfPresent(self.longitude, forKey: .longitude)
        try container.encodeIfPresent(self.mambaId, forKey: .mambaId)
        try container.encodeIfPresent(self.cityId, forKey: .cityId)
        try container.encodeIfPresent(self.nickName, forKey: .nickName)
        try container.encodeIfPresent(self.cityName, forKey: .cityName)
        try container.encodeIfPresent(self.addressId, forKey: .addressId)
    }
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isLocationUpdated = try values.decodeIfPresent(Bool.self, forKey: .isLocationUpdated)
        latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        locationId = try values.decodeIfPresent(String.self, forKey: .locationId)
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
        mambaId = try values.decodeIfPresent(String.self, forKey: .mambaId)
        do {
            if let cityIdString = try values.decodeIfPresent(String.self, forKey: .cityId) {
                
                cityId = Int(cityIdString)
            }
        } catch DecodingError.typeMismatch {
            
            cityId = try values.decodeIfPresent(Int.self, forKey: .cityId)
        }
        nickName = try values.decodeIfPresent(String.self, forKey: .nickName)
        cityName = try values.decodeIfPresent(String.self, forKey: .cityName)
        addressId = try values.decodeIfPresent(String.self, forKey: .addressId)
    }
}

class SmilesBaseMainRequest: Codable {
    public var userInfo : AppUserInfo?
    public var deviceHashIdV2 : String?
    
    enum CodingKeys: String, CodingKey {
        case userInfo
        case deviceHashIdV2
    }
    open func encode(to encoder: Encoder) throws {
        print("encode")
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.userInfo, forKey: .userInfo)
        try container.encodeIfPresent(self.deviceHashIdV2, forKey: .deviceHashIdV2)
    }
    required public init(from decoder: Decoder) throws {
        print("decoder")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userInfo = try values.decode(AppUserInfo.self, forKey: .userInfo)
        deviceHashIdV2 = try values.decodeIfPresent(String.self, forKey: .deviceHashIdV2)
    }
    
    init( userInfo : AppUserInfo?, deviceHashIdV2 : String?) {
        self.userInfo = userInfo
        self.deviceHashIdV2 = deviceHashIdV2
    }
    
}



let jsonString = """
{
  "userInfo": {
    "isLocationUpdated": true,
    "latitude": "37.7749",
    "location": "San Francisco",
    "locationId": "1",
    "longitude": "-122.4194",
    "mambaId": "123456",
    "cityId": "3333",
    "nickName": "JohnDoe",
    "cityName": "San Francisco",
    "addressId": "12345"
  },
  "deviceHashIdV2": "your_device_hash_id_here"
}
"""


    let jsonData = jsonString.data(using: .utf8)!
    let smilesBaseMainRequest = try? JSONDecoder().decode(SmilesBaseMainRequest.self, from: jsonData)
    print(smilesBaseMainRequest)


 public func getConfigsAsDictionary() -> [String: Any] {
    guard let configs = smilesBaseMainRequest else { return [:] }
     print("configs")
    return (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(configs))) as? [String: Any] ?? [:]
}

let x = getConfigsAsDictionary()
print(x)
