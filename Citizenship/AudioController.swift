//
//  AudioController.swift
//  Citizenship
//
//  Created by Amit Kumar Poreli on 02/01/18.
//  Copyright © 2018 Basir. All rights reserved.
//

import UIKit
import AVFoundation
class AudioController: UIViewController {

    @IBOutlet weak var audioSlider: UISlider!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var audioView: UIView!
    
    var audioPlayer = AVAudioPlayer()
    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    var playButton:UIButton?
    var playbackSlider:UISlider?
 
    var downloadlink = " "
    var isButtonClick = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //audioView.layer.borderWidth = 1;
         audioView.layer.shadowRadius = 12.0
         audioView.layer.cornerRadius = 8
        //audioView.layer.borderColor = UIColor.darkGray.cgColor
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = UIColor.white
        
        self.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = " "
        
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
       
    
    
    }
    @IBAction func crossAction(_ sender: Any) {
        
        player!.pause()
     //  self.navigationController?.popViewController(animated: true)
        
     self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sliderAction(_ sender: Any) {
        
        let seconds : Int64 = Int64(audioSlider.value)
        let targetTime:CMTime = CMTimeMake(seconds, 1)
        
        player!.seek(to: targetTime)
        
        if player!.rate == 0
        {
            player?.play()
        }
        else
        {
             player!.pause()
            
        }
        
        
    }
    @IBAction func playBtnAction(_ sender: Any) {
        
        playMusic(audioUrl:downloadlink )
    }
  
    func playMusic(audioUrl:String)
    {
        
        print(audioUrl)
        let url = URL.init(string: audioUrl)//(string: audioUrl)
    
        if(url == nil)
        {
          
            showAlert(title: "Error", message: "This audio can't be oppen..", noOfButton: 1)
            return
        }
        else
        {
            print(url!)
            let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
            player = AVPlayer(playerItem: playerItem)
            
            
            playBtn!.setTitle("Pause", for: UIControlState.normal)
            playBtn!.tintColor = UIColor.black
            // playBtn!.addTarget(self, action: #selector(self.playButtonTapped(_:)), for: .touchUpInside)
            
            
            let duration : CMTime = playerItem.asset.duration
            let seconds : Float64 = CMTimeGetSeconds(duration)
            
            audioSlider!.maximumValue = Float(seconds)
            audioSlider!.isContinuous = false
            audioSlider!.tintColor = UIColor.green
            
            audioSlider?.addTarget(self, action: #selector(self.playbackSliderValueChanged(_:)), for: .valueChanged)
            //playbackSlider!.addTarget(self, action: "playbackSliderValueChanged:", for: .valueChanged)
            // self.view.addSubview(playbackSlider!)
            
            
            player!.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, 1), queue: DispatchQueue.main) { (CMTime) -> Void in
                if self.player!.currentItem?.status == .readyToPlay {
                    let time : Float64 = CMTimeGetSeconds(self.player!.currentTime());
                    self.audioSlider!.value = Float ( time );
                }
        }
       
            
            playAudio()
            
        }
        
        
       
        
        
        
    }
    
    func playAudio()
    {
        if isButtonClick == false
        {
            player!.play()
            playBtn!.setTitle("Pause", for: UIControlState.normal)
            isButtonClick = true
            
        }
        else {
            player!.pause()
            //playButton!.setImage(UIImage(named: "player_control_play_50px.png"), forState: UIControlState.Normal)
            playBtn!.setTitle("Play", for: UIControlState.normal)
            isButtonClick = false
            
            
        }
    }
    @objc func playbackSliderValueChanged(_ playbackSlider:UISlider)
    {
        
        let seconds : Int64 = Int64(audioSlider.value)
        let targetTime:CMTime = CMTimeMake(seconds, 1)
        
        player!.seek(to: targetTime)
        
        if player!.rate == 0
        {
            player?.play()
        }
    }
    @objc func playButtonTapped(_ sender:UIButton)
    {
        if player?.rate == 0
        {
            player!.play()
            playBtn!.setTitle("Pause", for: UIControlState.normal)
        } else {
            player!.pause()
            //playButton!.setImage(UIImage(named: "player_control_play_50px.png"), forState: UIControlState.Normal)
            playBtn!.setTitle("Play", for: UIControlState.normal)
            
            
            
        }
    }
    
    
    
    
}

    

