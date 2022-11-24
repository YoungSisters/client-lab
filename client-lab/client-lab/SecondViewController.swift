//
//  SecondViewController.swift
//  client-lab
//
//  Created by 이서영 on 2022/11/25.
//

import UIKit
import Speech

class SecondViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    var audioUrl: URL?
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
//    var recognitionTask: SFSpeechRecognitionTask?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SFSpeechRecognizer.requestAuthorization { (status) in
            switch status {
            case .notDetermined: print("Not determined")
            case .restricted: print("Restricted")
            case .denied: print("Denied")
            case .authorized: print("We can recognize speech now.")
            @unknown default: print("Unknown case")
            }
        }
        
        transcribeAudio()
    }
    
    func transcribeAudio() {
        guard let audioUrl = audioUrl else {
            print("Can't find audio url")
            return
        }

        if speechRecognizer!.isAvailable {
            let request = SFSpeechURLRecognitionRequest(url: audioUrl)
            speechRecognizer?.supportsOnDeviceRecognition = true
            speechRecognizer?.recognitionTask(
                with: request,
                resultHandler: { (result, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else if let result = result {
                        print(result.bestTranscription.formattedString)
                        if result.isFinal {
                            self.resultLabel.text = result.bestTranscription.formattedString
                        }
                    }
                })
        }
    }
}
