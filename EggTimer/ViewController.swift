import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var label: UILabel!
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime: Int = 0
    var secondsPassed: Int = 0
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        label.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        
        
        
    }
    @objc func update() {
        
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed)/Float(totalTime)
            
        } else {
            timer.invalidate()
            label.text = "Done"
            
            playSound(soundName: "alarm_sound")
        }
  
    
        
    }
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
