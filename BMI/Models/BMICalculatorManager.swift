//
//  BMICalculatorManager.swift
//  BMI
//
//  Created by parkhyo on 2022/07/05.
//
import UIKit

struct BMICalculatorManager {
    
    // BMI 계산 결과값 보관하는 변수
    private var bmi: BMI?
    
    mutating func getBMI(height: String, weight: String) -> BMI {
        // BMI만들기 메서드 호출
        calculateBMI(height: height, weight: weight)
        // BMI리턴
        return bmi ?? BMI(value: 0.0, advice: "문제발생", matchColor: UIColor.white)
    }
    
    // BMI 메서드
    mutating private func calculateBMI(height: String, weight: String){
        guard let h = Double(height), let w = Double(weight) else {
            bmi = BMI(value: 0.0, advice: "문제발생", matchColor: UIColor.white)
            return
        }
        var bmiNumber = w / (h * h) * 10000
        bmiNumber = round(bmiNumber * 10) / 10 // 반올림
        
        switch bmiNumber {
        case ..<18.6:
            let color = UIColor(displayP3Red: 22/255,
                                green: 231/255,
                                blue: 207/255,
                                alpha: 1)
            bmi = BMI(value: bmiNumber, advice: "저체중", matchColor: color)
            
        case 18.6..<23.0:
            let color = UIColor(displayP3Red: 212/255,
                                green: 251/255,
                                blue: 121/255,
                                alpha: 1)
            bmi = BMI(value: bmiNumber, advice: "표준", matchColor: color)
            
            
        case 23.0..<25.0:
            let color = UIColor(displayP3Red: 218/255,
                                green: 127/255,
                                blue: 163/255,
                                alpha: 1)
            bmi = BMI(value: bmiNumber, advice: "과체중", matchColor: color)
        case 25.0..<30.0:
            let color = UIColor(displayP3Red: 255/255,
                                green: 150/255,
                                blue: 141/255,
                                alpha: 1)
            bmi = BMI(value: bmiNumber, advice: "중도비만", matchColor: color)
        case 30.0...:
            let color = UIColor(displayP3Red: 255/255,
                                green: 100/255,
                                blue: 78/255,
                                alpha: 1)
            bmi = BMI(value: bmiNumber, advice: "고도비만", matchColor: color)
        default:
            bmi = BMI(value: 0.0, advice: "문제발생", matchColor: UIColor.white)
        }
    }
}
