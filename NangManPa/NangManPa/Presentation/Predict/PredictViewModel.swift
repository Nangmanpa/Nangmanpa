//
//  PredictViewModel.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import CoreML
import Foundation
import SwiftUI

@MainActor
class PredictViewModel: ObservableObject {
    private let region = "Seoul"
    private let model: MLModel
    //    private var inputData: InputModel? = .load()

    @Published var weather: WeatherDomain? = nil
    @Published var accidentType: AccidentType? = nil
    @Published var checkedCount: Int = 0
    @Published var itemCount: Int? = nil
    @Published var lightColor: String = "redlight"
    var OccurrenceProbability: Int {
        guard let itemCount = itemCount, itemCount > 0 else { return 67 }
        let ratio = Double(checkedCount) / Double(itemCount)
        if ratio <= 0.5 {
            return 67
        } else if ratio == 1 {
            return 34
        } else {
            return 51
        }
    }

    private var inputData: InputModel? = .init(
        moneyRange: .under10Million,
        facilityType: .apartment,
        extent: 1000,
        groundFloor: 50,
        undergroundFloor: 2
    )

    init() {
        guard let model = Self.loadModel() else {
            fatalError("Failed to load ML model")
        }
        self.model = model
    }

    // MARK: ML모델 불러오는 함수
    private static func loadModel() -> MLModel? {
        guard
            let url = Bundle.main.url(
                forResource: "NangManPaClassification",
                withExtension: "mlmodelc"
            )
        else {
            fatalError("Failed to load ML model")
        }

        guard
            let model = try? MLModel(
                contentsOf: url
            )
        else {
            fatalError("Failed to setting ML model")
        }

        return model
    }

    // MARK: 예측 실행 함수
    func run() -> AccidentType? {
        if let inputData = inputData {
            let predictedResult = predict(input: inputData)
            if let result = predictedResult {
                // 타입 저장
                accidentType = AccidentType.init(name: result)
                // 체크리스트 설정
                itemCount = accidentType?.checkList.count
                checkedCount = 0
                print(result, accidentType)
                return accidentType
            }
        }
        return nil
    }

    // MARK: 입력 데이터 생성 함수
    private func makeModelInputArray(input: InputModel) -> MLFeatureProvider? {
        if input.isValid {
            guard let facility = input.facilityType?.name_ko,
                let money = input.moneyRange?.description_ko,
                let extent = input.extent,
                let ground = input.groundFloor,
                let under = input.undergroundFloor,
                let condition = weather?.condition,
                let temperature = weather?.temperature,
                let humidity = weather?.humidity

            else { return nil }

            let dict: [String: MLFeatureValue] = [
                "Weather": MLFeatureValue(string: condition),
                "Temperature": MLFeatureValue(int64: Int64(temperature)),
                "Humidity": MLFeatureValue(int64: Int64(humidity)),
                "TotalArea": MLFeatureValue(int64: Int64(extent)),
                "FloorsAboveGround": MLFeatureValue(int64: Int64(ground)),
                "FloorsBelowGround": MLFeatureValue(int64: Int64(under)),
                "Facility": MLFeatureValue(string: facility),  // String 그대로
                "ConstructionCost": MLFeatureValue(string: money),  // String 그대로
            ]

            return try? MLDictionaryFeatureProvider(dictionary: dict)
        } else {
            return nil
        }
    }

    // MARK: 예측 함수
    private func predict(input: InputModel) -> String? {
        guard let inputArray = makeModelInputArray(input: input) else {
            return nil
        }
        let inputFeatures = inputArray
        print(inputFeatures)
        guard let result = try? model.prediction(from: inputFeatures) else {
            print("error in prediction")
            return nil
        }
        print(result)
        if let label = result.featureValue(for: "AccidentType")?.stringValue {
            return label
        }
        if let probs = result.featureValue(for: "AccidentTypeProbability")?
            .dictionaryValue
        {
            // return the top-1 label by probability as a fallback
            let sorted = probs.sorted {
                ($0.value.doubleValue) > ($1.value.doubleValue)
            }
            if let top = sorted.first { return String(describing: top.key) }
        }
        return nil
    }

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
        
        try await Task.sleep(nanoseconds: 1_500_000_000)
        
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
