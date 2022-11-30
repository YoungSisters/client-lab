//
//  ThirdViewController.swift
//  client-lab
//
//  Created by 이서영 on 2022/12/01.
//

import UIKit
import Alamofire

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var grammarLabel: UILabel!
    @IBOutlet weak var pronunciationLabel: UILabel!
    
    var audioUrl: URL?
    var text: String?
//    var pronunciation: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        postGrammar()
        postPronunciation()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: - Networking
extension ThirdViewController {
    func postGrammar() {
        guard let text = text else {
            return
        }
        let url = "https://grammarbot.p.rapidapi.com/check"
        let headers: HTTPHeaders = [
            "content-type": "application/x-www-form-urlencoded",
            "X-RapidAPI-Key": "",
            "X-RapidAPI-Host": "grammarbot.p.rapidapi.com"
        ]
        let parameters: Parameters = [
            "text": text
        ]
        AF.request(url, method: .post, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: Grammar.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    guard let text = self.text else {
                        return
                    }
                    let textArray = Array(text)
                    var newText = ""
                    var cursor = 0
                    
                    for match in response.matches {
                        let offset = match.offset
                        let length = match.length
                        if cursor > offset {
                            continue
                        }
                        newText += textArray[cursor..<offset]
                        newText += "[\(String(textArray[offset..<offset+length]))]"
                        cursor = offset + length
                        if cursor < textArray.count {
                            newText += textArray[cursor...]
                        }
                    }
                    self.grammarLabel.text = newText
                case .failure(let error):
                    print(String(describing: error))
                }
            }
    }
    
    func postPronunciation() {
        guard let audioUrl = audioUrl else {
            return
        }
        
        let url = "http://aiopen.etri.re.kr:8000/WiseASR/Pronunciation"
        let key = "9444c3e9-9f88-4d7c-983f-11d7838950e4"
        let audioData =  try? Data(contentsOf: audioUrl)
        let encodedString = audioData?.base64EncodedString()
        guard let encodedString = encodedString else {
            print("오디오 인코딩 실패")
            return
        }
        let parameters: Parameters = [
            "argument": [
                "language_code": "english",
                "audio": encodedString
            ]
        ]
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: ["Content-Type": "application/json; charset=UTF-8", "Authorization" : key])
            .validate()
            .responseDecodable(of: Pronunciation.self) { response in
                switch response.result {
                case .success(let response):
                    guard let score = response.returnObject?.score else {
                        return
                    }
                    if let score = Double(score) {
                        self.pronunciationLabel.text = "당신의 발음은 \(String(format: "%.2f", score))/5.0점 입니다."
                    }
//                    print(response)
                    
                case .failure(let error):
                    print(String(describing: error))
                }
            }
    }
}
