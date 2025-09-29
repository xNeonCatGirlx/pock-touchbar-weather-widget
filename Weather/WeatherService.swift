import Foundation
import CoreLocation

// MARK: - OpenCage Response Models

struct OpenCageResponse: Codable {
    let results: [OpenCageResult]
    let status: Status
    
    struct Status: Codable {
        let code: Int
        let message: String
    }
}

struct OpenCageResult: Codable {
    let components: Components
    let formatted: String
    let geometry: Geometry
    
    struct Components: Codable {
        let city: String?
        let county: String?
        let state: String?
        let country: String?
        let countryCode: String?
        let postcode: String?
        let road: String?
        let suburb: String?
        
        enum CodingKeys: String, CodingKey {
            case city, county, state, country, postcode, road, suburb
            case countryCode = "country_code"
        }
    }
    
    struct Geometry: Codable {
        let lat: Double
        let lng: Double
    }
}

// MARK: - Weather Response Models (keeping your existing ones)

struct WeatherResponse: Codable {
    let conditionsshort: Conditionsshort?
    let fcsthourly24short: Fcsthourly24short?
    let fcstdaily10short: Fcstdaily10short?
    let monthlyalmanac: Monthlyalmanac?
    let nowlinks: Nowlinks?
    let metadata: Metadata?
}

struct Conditionsshort: Codable {
    let metadata: Metadata?
    let observation: Observation?
}

struct Observation: Codable {
    let classa: String?
    let valid_time_gmt: Int?
    let imperial: Imperial?
    let metric: Metric?
    let obs_id: String?
    let obs_name: String?
    let pressure_desc: String?
    let pressure_tend: Int?
    let qualifier: String?
    let rh: Int?
    let uv_desc: String?
    let uv_index: Int?
    let wdir: Int?
    let wdir_cardinal: String?
    let wx_icon: Int?
    let wx_phrase: String?
    let icon_extd: Int?

    enum CodingKeys: String, CodingKey {
        case classa = "class"
        case valid_time_gmt, imperial, metric, obs_id, obs_name
        case pressure_desc, pressure_tend, qualifier, rh
        case uv_desc, uv_index, wdir, wdir_cardinal
        case wx_icon, wx_phrase, icon_extd
    }
}

struct Imperial: Codable {
    let wspd: Int?
    let feelsLike: Int?
    let dewpt: Int?
    let precip1Hour: Double?
    let precip6Hour: Double?
    let precipTotal: Double?
    let pressure: Double?
    let snow1Hour: Double?
    let snow24Hour: Double?
    let snow6Hour: Double?
    let maxTemp: Int?
    let minTemp: Int?
    let temp: Int?
    let vis: Double?
    let qpf: Double?
    let snow_qpf: Double?
    
    enum CodingKeys: String, CodingKey {
        case wspd, dewpt, pressure, qpf
        case feelsLike = "feels_like"
        case precip1Hour = "precip_1Hour"
        case precip6Hour = "precip_6Hour"
        case precipTotal = "precip_total"
        case snow1Hour = "snow_1Hour"
        case snow24Hour = "snow_24Hour"
        case snow6Hour = "snow_6Hour"
        case maxTemp = "max_temp"
        case minTemp = "min_temp"
        case temp, vis
        case snow_qpf
    }
}

struct Metric: Codable {
    let wspd: Int?
    let feelsLike: Int?
    let dewpt: Int?
    let precip1Hour: Double?
    let precip6Hour: Double?
    let precipTotal: Double?
    let pressure: Double?
    let snow1Hour: Double?
    let snow24Hour: Double?
    let snow6Hour: Double?
    let maxTemp: Int?
    let minTemp: Int?
    let temp: Int?
    let vis: Double?
    let qpf: Double?
    let snow_qpf: Double?
    
    enum CodingKeys: String, CodingKey {
        case wspd, dewpt, pressure, qpf
        case feelsLike = "feels_like"
        case precip1Hour = "precip_1Hour"
        case precip6Hour = "precip_6Hour"
        case precipTotal = "precip_total"
        case snow1Hour = "snow_1Hour"
        case snow24Hour = "snow_24Hour"
        case snow6Hour = "snow_6Hour"
        case maxTemp = "max_temp"
        case minTemp = "min_temp"
        case temp, vis
        case snow_qpf
    }
}

struct Fcstdaily10short: Codable {
    let metadata: Metadata?
    let forecasts: [Forecasts]?
}

struct Fcsthourly24short: Codable {
    let metadata: Metadata?
    let forecasts: [Forecasts]?
}

struct Forecasts: Codable {
    let classa: String?
    let dow: String?
    let fcst_valid: Int?
    let fcst_valid_local: String?
    let imperial: Imperial?
    let metric: Metric?
    let moonrise: String?
    let moonset: String?
    let moon_phase: String?
    let moon_phase_code: String?
    let num: Int?
    let sunrise: String?
    let sunset: String?
    let night: Night?
    let day: DayTime?
    let iconName: String?

    enum CodingKeys: String, CodingKey {
        case classa = "class"
        case dow, fcst_valid, fcst_valid_local, imperial, metric
        case moonrise, moonset, moon_phase, moon_phase_code
        case num, sunrise, sunset, night, day
        case iconName = "phrase_32char"
    }
}

struct Night: Codable {
    let alt_daypart_name: String?
    let daypart_name: String?
    let fcst_valid: Int?
    let fcst_valid_local: String?
    let icon_cd: Int?
    let icon_extd: Int?
    let long_daypart_name: String?
    let num: Int?
    let phrase_12char: String?
    let phrase_22char: String?
    let phrase_32char: String?
    let pop: Int?
    let precip_type: String?
    let rh: Int?
    let uv_desc: String?
    let uv_index: Int?
    let wdir: Int?
    let wdir_cardinal: String?
    let metric: Metric?
    let imperial: Imperial?
}

struct DayTime: Codable {
    let alt_daypart_name: String?
    let daypart_name: String?
    let fcst_valid: Int?
    let fcst_valid_local: String?
    let icon_cd: Int?
    let icon_extd: Int?
    let long_daypart_name: String?
    let num: Int?
    let phrase_12char: String?
    let phrase_22char: String?
    let phrase_32char: String?
    let pop: Int?
    let precip_type: String?
    let rh: Int?
    let uv_desc: String?
    let uv_index: Int?
    let wdir: Int?
    let wdir_cardinal: String?
    let metric: Metric?
    let imperial: Imperial?
}

struct Metadata: Codable {
    let language: String?
    let transaction_id: String?
    let version: String?
    let latitude: Double?
    let longitude: Double?
    let expire_time_gmt: Int?
    let status_code: Int?
}

struct Monthlyalmanac: Codable {
    let metadata: Metadata?
    let almanac_summaries: [Almanac_summaries]?
}

struct Almanac_summaries: Codable {
    let avg_hi: Int?
    let avg_lo: Int?
    let record_hi: String?
    let record_hi_yr: String?
    let record_lo: String?
    let record_lo_yr: String?
}

struct Nowlinks: Codable {
    let metadata: Metadata?
    let links: Links?
}

struct Links: Codable {
    let ios: String?
    let mobile: String?
    let web: String?
}

// MARK: - Your existing Weather models

struct Weather: Codable {
    let name: String
    let temp: String
    let temp_F: String
    let icon: String
    let description: String
    
    var temperature: String {
        if Info == 0 {
            let units: String = Preferences[.units]
            switch units {
            case "celsius":
                return "\(temp)°"
            default:
                return "\(temp_F)°"
            }
        } else {
            let units: String = Preferences[.units]
            switch units {
            case "celsius":
                return temp
            default:
                return temp_F
            }
        }
    }
}

struct WeatherData: Codable {
    struct Metadata: Codable {
        let error: String?
        let code: Int
    }
    let metadata: Metadata
    let weather: Weather
    
    private enum CodingKeys: String, CodingKey {
        case weather = "data"
        case metadata
    }
}

// MARK: - Refactored Weather Service

class WeatherService: NSObject, CLLocationManagerDelegate {
    
    // MARK: - Configuration
    private enum Config {
        static let openCageAPIKey = "apiKEY"
        static let weatherAPIKey = "e45ff1b7c7bda231216c7ab7c33509b8"
    }
    
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func currentConditions(result: @escaping (WeatherData?) -> Void) {
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        guard let latitude = locationManager.location?.coordinate.latitude,
              let longitude = locationManager.location?.coordinate.longitude else {
            print("Unable to get location")
            result(nil)
            return
        }
        
        locationManager.stopUpdatingLocation()
        
        fetchLocationAndWeather(latitude: latitude, longitude: longitude, result: result)
    }
    
    private func fetchLocationAndWeather(latitude: Double, longitude: Double, result: @escaping (WeatherData?) -> Void) {
        guard let locationURL = URL(string: "https://api.opencagedata.com/geocode/v1/json?q=\(latitude),\(longitude)&key=\(Config.openCageAPIKey)"),
              let weatherURL = URL(string: "https://api.weather.com/v1/geocode/\(latitude)/\(longitude)/aggregate.json?apiKey=\(Config.weatherAPIKey)&products=conditionsshort,fcstdaily10short,fcsthourly24short,nowlinks") else {
            result(nil)
            return
        }
        
        var locationName: String?
        var weatherInfo: (temp: String, tempF: String, icon: String, description: String)?
        let group = DispatchGroup()
        
        // Fetch location
        group.enter()
        let locationRequest = URLRequest(url: locationURL, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 20)
        URLSession.shared.dataTask(with: locationRequest) { data, _, error in
            defer { group.leave() }
            
            guard let data = data, error == nil else {
                print("Location fetch error: \(error?.localizedDescription ?? "Unknown")")
                return
            }
            
            do {
                let response = try JSONDecoder().decode(OpenCageResponse.self, from: data)
                guard let firstResult = response.results.first else { return }
                
                if Day == 0 {
                    let titlePref = Preferences[.Title] ?? "City"
                    switch titlePref {
                    case "Address":
                        locationName = firstResult.components.road ?? "Unknown Address"
                    case "Neighborhood":
                        locationName = firstResult.components.suburb ?? "Unknown Neighborhood"
                    default:
                        locationName = firstResult.components.city ?? "Unknown City"
                    }
                } else {
                    locationName = firstResult.components.city ?? "Unknown City"
                }
            } catch {
                print("Location decode error: \(error.localizedDescription)")
            }
        }.resume()
        
        // Fetch weather
        group.enter()
        let weatherRequest = URLRequest(url: weatherURL, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 20)
        URLSession.shared.dataTask(with: weatherRequest) { data, _, error in
            defer { group.leave() }
            
            guard let data = data, error == nil else {
                print("Weather fetch error: \(error?.localizedDescription ?? "Unknown")")
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
                weatherInfo = self.parseWeatherInfo(from: weather)
            } catch {
                print("Weather decode error: \(error.localizedDescription)")
            }
        }.resume()
        
        group.notify(queue: .main) {
            guard let info = weatherInfo else {
                result(nil)
                return
            }
            
            let data = WeatherData(
                metadata: .init(error: nil, code: 200),
                weather: Weather(
                    name: locationName ?? "Unknown Location",
                    temp: info.temp,
                    temp_F: info.tempF,
                    icon: info.icon,
                    description: info.description
                )
            )
            result(data)
        }
    }
    
    private func parseWeatherInfo(from weather: WeatherResponse) -> (temp: String, tempF: String, icon: String, description: String)? {
        let observation = weather.conditionsshort?.observation
        
        guard let obs = observation else { return nil }
        
        let temp = String(obs.metric?.temp ?? 0)
        let tempF = String(obs.imperial?.temp ?? 0)
        let description = obs.wx_phrase ?? "Unknown"
        let iconCode = obs.wx_icon ?? 0
        
        let icon: String
        if Preferences[.IconStyle] == "Outlined" {
            icon = " -\(iconCode)"
        } else if Preferences[.IconStyle] == "Filled" {
            icon = "2-\(iconCode)"
        } else {
            icon = String(iconCode)
        }
        
        return (temp, tempF, icon, description)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        print("[WeatherService]: Location updated to \(location.coordinate.latitude), \(location.coordinate.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("[WeatherService]: Location update failed with error \(error.localizedDescription)")
        locationManager.stopUpdatingLocation()
    }
}

