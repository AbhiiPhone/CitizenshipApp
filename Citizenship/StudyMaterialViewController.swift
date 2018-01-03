//
//  StudyMaterialViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 18/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import AVFoundation


class StudyMaterialViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate {
    
     var audioPlayer = AVAudioPlayer()
     var audio: AudioViewController?
    
    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()
    
    @IBOutlet var audioWebVw: UIWebView!
    @IBOutlet var studyTableVw: UITableView!
    @IBOutlet var viewTop: NSLayoutConstraint!
   
    @IBOutlet var viewHeight: NSLayoutConstraint!
    
    @IBOutlet var audioHeight: NSLayoutConstraint!
    @IBOutlet var audioWidth: NSLayoutConstraint!
    @IBOutlet var audioTrailing: NSLayoutConstraint!
    
    @IBOutlet var pdfLblHeight: NSLayoutConstraint!
    @IBOutlet var pdfLblTrailing: NSLayoutConstraint!
    @IBOutlet var pdfLblWidth: NSLayoutConstraint!
    
    @IBOutlet var lblLeading: NSLayoutConstraint!
    @IBOutlet var lblHeight: NSLayoutConstraint!
  
    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    var playButton:UIButton?
    var playbackSlider:UISlider?
    
   // var audioPlayer: AVAudioPlayer?
    
    var studyArray = NSArray()
    
    var audioArray = NSArray()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studyTableVw.delegate=self
        studyTableVw.dataSource=self
      
         studyTableVw.tableFooterView = UIView(frame: .zero)
        
      
        
       
        
      if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
        

        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{

      }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
        

            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
        

        }
        
        featchData()
        // Do any additional setup after loading the view.
    }

   func featchData()
    {
        parameters = ["actiontype" :  "study_material",]
        print(parameters)
        
        jsonFetch.jsonData = self
        jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "study_material")
        MBProgressHUD.showAdded(to: (self.navigationController?.view)!, animated: true)
    }
   
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
      
        
    }
    
    
    
    // MARK: - Table View Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
      return studyArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = studyTableVw.dequeueReusableCell( withIdentifier: "StudyMaterialCell", for: indexPath) as! StudyMaterialTableViewCell
        
        self.studyTableVw.separatorColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        cell.audioBtn.addTarget(self, action: #selector(StudyMaterialViewController.audioAction), for:.touchUpInside)
      
        cell.pdfBtn.addTarget(self, action: #selector(pdfAction(_:)), for:.touchUpInside)
       
        cell.chpLbl.text = ((studyArray[indexPath.row] as AnyObject).value(forKey: "chapter_name") as! String)
        
   
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
            
            
//            cell.lblHeight.constant = 40
//
//
//            cell.pdfHeight.constant=25.0
//            cell.pdfWidth.constant=20.0
//
//            cell.audioWidth.constant=20.0
//            cell.audioHeight.constant=25.0
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
            
//            cell.lblHeight.constant = 40
//
//
//            cell.pdfHeight.constant=25.0
//            cell.pdfWidth.constant=20.0
//
//            cell.audioWidth.constant=20.0
//            cell.audioHeight.constant=25.0
//
//
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
//            cell.lblHeight.constant = 40
//
//
//            cell.pdfHeight.constant=25.0
//            cell.pdfWidth.constant=20.0
//
//            cell.audioWidth.constant=20.0
//            cell.audioHeight.constant=25.0

        }
        
        if indexPath.row % 2 == 0
        {
            cell.contentView.backgroundColor = UIColor.hexStringToUIColor(hex: "f5f7df")
            

        }
        else
        {
            cell.contentView.backgroundColor = UIColor.hexStringToUIColor(hex: "e9ecdb")
        }
        

        
      
        cell.pdfBtn.tag = indexPath.row
        
       // cell.audioBtn.addTarget(self, action: #selector(StudyMaterialViewController.buttonTapped), for: .touchUpInside)
        cell.audioBtn.tag = indexPath.row
        
        
        
       
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            return 90
            
        }
        else
        
        {
          return 55
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }

    
     func buttonTapped(sender: UIButton){
        
        let buttonTag = sender.tag
        print(buttonTag)

    }
    

    @objc func pdfAction(_ sender : UIButton)
    {
        print("Pdf Index ==> ",sender.tag)
            
            //        print("hjdfgkhdj")
            //
            ////      //  UIApplication.shared.openURL(URL(string: ((manualArray[sender.tag] as AnyObject).value(forKey: "pdf") as! String))!)
            //
            //
            //        let getpdfString =  (manualArray[sender.tag] as AnyObject).value(forKey: "pdf") as! String!
            //
            //        _ = NSURL(string:getpdfString! )
            
            let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
            
            hud.mode = MBProgressHUDMode.annularDeterminate
            hud.label.text = "Loading... "
            
            
            let getpdfString =  (studyArray[sender.tag] as AnyObject).value(forKey: "chapter_path") as! String!
            
            let destination: DownloadRequest.DownloadFileDestination = { _, _ in
                
                let documentsURL :NSURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as NSURL
                
                print("**** documentUrl: ",documentsURL)
                
                // let fileURL = documentsURL.appendingPathComponent("\(0).pdf")
                
                let fileURL = documentsURL.appendingPathComponent(((self.studyArray[sender.tag] as AnyObject).value(forKey: "chapter_path") as! String!).components(separatedBy : "/").last!)
                
                return (fileURL!, [.removePreviousFile, .createIntermediateDirectories])
            }
            
            
            //    Alamofire.download(getpdfString!,to:destination).response{ response in
            
            Alamofire.download(getpdfString!,to:destination).downloadProgress(closure: {(prog) in
                
                hud.progress = Float(prog.fractionCompleted)
                
                
            }).response{ response in
                
                print(response)
                hud.hide(animated:true)
                if response.error == nil,let filePath = response.destinationURL?.path
                {
//                    print("***sgs",filePath)
//                    let viewResumeVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowPDFController") as! ShowPDFController
//
//                    viewResumeVC.getDownloadlink = filePath
//
//                    UIView.transition(with: self.view, duration: 1.0, options: UIViewAnimationOptions.transitionCurlUp,
//                                      animations: {self.view.addSubview(viewResumeVC.view)}, completion: nil)
//
//                    viewResumeVC.view.frame = CGRect(x: 0, y: 10 , width: self.view.frame.size.width, height: self.view.frame.size.height)
               
                    let showPDFVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowPDFController") as! ShowPDFController
                    
                    showPDFVC.getDownloadlink = filePath
                    
                    self.navigationController?.pushViewController(showPDFVC, animated: true)
                
                }
                
            }
            
        }

        
    @objc func audioAction(_ sender : UIButton)
   {
       let str = audioArray[sender.tag]
    playMusic(audioUrl:str as! String)
    
    }
 
    func playMusic(audioUrl:String)
    {
       
        print(audioUrl)
      //let getPeriorStr = audioUrl.removingPercentEncoding
        let url = URL.init(string: audioUrl)//(string: audioUrl)
      //  print(url!)
        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
            player = AVPlayer(playerItem: playerItem)
            
            let playerLayer=AVPlayerLayer(player: player!)
            playerLayer.frame=CGRect(x:0, y:0, width:10, height:50)
            self.view.layer.addSublayer(playerLayer)
            
            playButton = UIButton(type: UIButtonType.system) as UIButton
            let xPostion:CGFloat = 50
            let yPostion:CGFloat = 100
            let buttonWidth:CGFloat = 150
            let buttonHeight:CGFloat = 45
            
            playButton!.frame = CGRect(x: xPostion, y: yPostion, width: buttonWidth, height: buttonHeight)
            playButton!.backgroundColor = UIColor.lightGray
            playButton!.setTitle("Play", for: UIControlState.normal)
            playButton!.tintColor = UIColor.black
            playButton!.addTarget(self, action: #selector(self.playButtonTapped(_:)), for: .touchUpInside)
            
            self.view.addSubview(playButton!)
        playbackSlider = UISlider(frame:CGRect(x: 10, y: 300, width: 300, height: 20))
        playbackSlider!.minimumValue = 0
        
        
        let duration : CMTime = playerItem.asset.duration
        let seconds : Float64 = CMTimeGetSeconds(duration)
        
        playbackSlider!.maximumValue = Float(seconds)
        playbackSlider!.isContinuous = false
        playbackSlider!.tintColor = UIColor.green
        
        playbackSlider?.addTarget(self, action: #selector(self.playbackSliderValueChanged(_:)), for: .valueChanged)
        //playbackSlider!.addTarget(self, action: "playbackSliderValueChanged:", for: .valueChanged)
        self.view.addSubview(playbackSlider!)
        
        
        player!.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, 1), queue: DispatchQueue.main) { (CMTime) -> Void in
            if self.player!.currentItem?.status == .readyToPlay {
                let time : Float64 = CMTimeGetSeconds(self.player!.currentTime());
                self.playbackSlider!.value = Float ( time );
            }
        }
        }
    @objc func playbackSliderValueChanged(_ playbackSlider:UISlider)
    {
        
        let seconds : Int64 = Int64(playbackSlider.value)
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
              
               
                
                
                //playButton!.setImage(UIImage(named: "player_control_pause_50px.png"), forState: UIControlState.Normal)
                playButton!.setTitle("Pause", for: UIControlState.normal)
            } else {
                player!.pause()
                //playButton!.setImage(UIImage(named: "player_control_play_50px.png"), forState: UIControlState.Normal)
                playButton!.setTitle("Play", for: UIControlState.normal)
             
              
                
            }
        }
    
    
    
    
    }
    




extension StudyMaterialViewController : jsonDataDelegate{
    
    func didReceiveData(_ data: Any, jsonName: String) {
        
        print(jsonName)
        
        print(data)
        
       
        
        if data as? String ==  "NO INTERNET CONNECTION" {
            
            DispatchQueue.main.async {
                
                MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
            }
            
              showAlert(title: "Network !", message: "Check your internet connection please", noOfButton: 1)
            
            
        }
        else{  //((data as! NSDictionary).value(forKey: "data") as! NSArray).value(forKey: "reviews") as! NSArray
            
            print(((data as! NSDictionary).value(forKey: "success") as! String))
            
          //  studyArray = ((data as! NSDictionary).value(forKey: "study_material") as! NSArray)
            
            // studyArray = ((data as! NSDictionary).value(forKey: "audio") as! NSArray)
            
            studyArray = ((data as! NSDictionary).value(forKey: "study_material") as! NSArray)
            
            audioArray = (((data as! NSDictionary).value(forKey: "study_material") as! NSArray).value(forKey: "audio") as! NSArray)
            
            
            
                        //.value(forKey: "audio") as! NSArray)

            
            print(audioArray)
            
        print(studyArray)
            
            
            
//            cheatArray = ((data as! NSDictionary).value(forKey: "chapter") as! NSArray)
//            
//            print(cheatArray)
            
          //  print(((studyArray[0] as AnyObject).value(forKey: "attachment") as! String))
            
            studyTableVw.reloadData()
            
            DispatchQueue.main.async {
                
                MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
            }
            
        }
        
    }
    
    
    func showAlertMessage(alertTitle: String, alertMsg : String)
    {
        let alertController = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction) in
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func didFailedtoReceiveData(_ error: Error) {
        
        print(error)
        
        //  showAlert(title: "Error", message: "Something is not going right !", noOfButton: 1, selectorMethod:())
        
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
        }
    }
    
    
}

