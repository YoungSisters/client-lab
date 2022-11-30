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

        if let text = text {
            grammarLabel.text = text
        }
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
        print(encodedString)
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
