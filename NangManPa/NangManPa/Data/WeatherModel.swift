//
//  WeatherModel.swift
//  NangManPa
//
//  Created by Oh Seojin on 8/24/25.
//

import Foundation

// MARK: 우리가 사용하는 날씨 정보
// 맑음, 흐림, 강우, 강설, 안개, 강풍
struct WeatherDomain {
    var temperature: Double
    var condition: String
    var region: String
    var date: Date
    var humidity: Int

    init(temperature: Double, condition: String, region: String, humidity: Int)
    {
        self.temperature = temperature
        self.condition = condition
        self.region = region
        self.humidity = humidity
        self.date = Date()
    }
}

// MARK: API에서 날씨정보 저장하기 위한 Type
struct WeatherDTO: Decodable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

struct Coord: Decodable {
    let lon: Double
    let lat: Double
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
    let sea_level: Int?
    let grnd_level: Int?
}

struct Wind: Decodable {
    let speed: Double
    let deg: Int
}

struct Clouds: Decodable {
    let all: Int
}

struct Sys: Decodable {
    let country: String
    let sunrise: Int
    let sunset: Int
}

private func mapCondition(_ main: String) -> String {
    switch main.lowercased() {
    case "clear":
        return "맑음"
    case "clouds":
        return "흐림"
    case "rain", "drizzle":
        return "강우"
    case "snow":
        return "강설"
    case "mist", "fog", "haze", "smoke", "dust", "sand":
        return "안개"
    case "thunderstorm", "squall", "tornado":
        return "강풍"
    default:
        return "맑음"
    }
}

extension WeatherDTO {
    func toDomain() -> WeatherDomain {
        return WeatherDomain(
            temperature: main.temp - 273,
            condition: mapCondition(weather.first?.main ?? ""),
            region: name,
            humidity: main.humidity,
        )
    }
}

// MARK: 네트워크 에러 enum
enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}
