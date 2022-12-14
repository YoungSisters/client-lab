//
//  ViewController.swift
//  client-lab
//
//  Created by 이서영 on 2022/11/22.
//

import UIKit
import AVFoundation
import Alamofire

class ViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    
    // MARK: - Properties
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var transcribeButton: UIButton!
    @IBOutlet weak var pronunciationButton: UIButton!
    @IBOutlet weak var pronunciationLabel: UILabel!
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        playButton.isEnabled = false
        transcribeButton.isEnabled = false
        pronunciationButton.isEnabled = false
        
        recordingSession = AVAudioSession.sharedInstance()

        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { allowed in
                if allowed {
                    print("음성 녹음 허용")
                } else {
                    print("음성 녹음 비허용")
                }
            }
        } catch {
            print("음성 녹음 실패")
        }
    }
    
    // MARK: - Actions
    @IBAction func recordButtonTapped() {
        if let recorder = audioRecorder {
            if recorder.isRecording {
                finishRecording(success: true)
            } else {
                startRecording()
            }
        } else {
            startRecording()
        }
        
    }
    
    @IBAction func playButtonTapped() {
        audioPlayer = try? AVAudioPlayer(contentsOf: audioRecorder.url)
        audioPlayer?.delegate = self
        audioPlayer?.play()
    }
    
    @IBAction func pronuncationButtonTapped() {
//        postPronunciation()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondViewController = segue.destination as? SecondViewController else {
            return
        }
        secondViewController.audioUrl = audioRecorder.url
    }

}

// MARK: - Recording
extension ViewController {
    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.wav")

        let settings = [
            AVFormatIDKey: Int(kAudioFormatLinearPCM),
            AVSampleRateKey: 16000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()

            print("녹음 시작")
        } catch {
            finishRecording(success: false)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()

        if success {
            playButton.isEnabled = true
            transcribeButton.isEnabled = true
            pronunciationButton.isEnabled = true
            print("finishRecording - success")
        } else {
            playButton.isEnabled = false
            transcribeButton.isEnabled = false
            pronunciationButton.isEnabled = false
            print("finishRecording - fail")
            // recording failed :(
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
}
