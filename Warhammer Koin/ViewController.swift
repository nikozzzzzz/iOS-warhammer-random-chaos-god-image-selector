//
//  ViewController.swift
//  Warhammer Koin
//
//  Created by Nikos Papadopulos on 19/07/2018.
//  Copyright © 2018 Nikos Papadopulos. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation
class ViewController: UIViewController {
  //add an adday with 3 images from asset folder
    let imageNumberArray = ["chaos,khorne,nurgle,slaanesh,tzeentch]
  //add a starting var with zero value, to use later in random image selector
    var randomImageGen : Int = 0
    @IBOutlet weak var godImage: UIImageView!
    
  //add sound files to app
    let path = Bundle.main.path(forResource: "gun-gunshot-01", ofType:"wav")!
  
    
  //add sound player to app
    var gunshotSoundEffect: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func pushButton(_ sender: UIButton) {
       
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        do {
            gunshotSoundEffect = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            gunshotSoundEffect?.play()
        } catch {
            // for future error report
            print("could not play sound due to some error")
            
        }
        randomImageGen = Int(arc4random_uniform(3))
        print(randomImageGen)
        godImage.image = UIImage (named: imageNumberArray[randomImageGen])
        
        

    }
    
}

