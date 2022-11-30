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
    
    var text: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let text = text {
            grammarLabel.text = text
        }
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
