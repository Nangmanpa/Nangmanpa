//
//  PredictViewModel.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import Foundation
import SwiftUI

@MainActor
class PredictViewModel: ObservableObject {
    private let region = "Seoul"
    @Published var weather: WeatherDomain? = nil
    
    
    // MARK: weather 변수에 날씨정보 불러오기 -> view의 task에서 실행
    func loadWeather() async {
        do {
            let response = try await fetchWeather(region: region)
            let weatherDomain = response.toDomain()
            weather = weatherDomain
        } catch {
            print("LoadWeather Error")
        }
    }
    
    // MARK: API에서 날씨정보 불러오는 함수
    private func fetchWeather(region: String) async throws -> WeatherDTO {
        guard
            let url = URL(
                string:
                    "https://api.openweathermap.org/data/2.5/weather?q=\(region)&appid=\(Bundle.main.OPENWEATHERMAP_API_KEY)"
            )
        else {
            throw NetworkError.badURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 /* OK */
        else {
            throw NetworkError.noData
        }

        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherDTO.self, from: data)
            return weatherData
        } catch {
            throw NetworkError.decodingError
        }

    }

}

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
