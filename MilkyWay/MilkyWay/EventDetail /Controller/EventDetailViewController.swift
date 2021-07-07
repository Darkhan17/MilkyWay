//
//  EventDetailViewController.swift
//  MilkyWay
//
//  Created by Khamitov Darkhan on 7/6/21.
//

import UIKit
import youtube_ios_player_helper
class EventDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var youtubeView: YTPlayerView!
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var dateStackView: UIStackView!
    var event: Event?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfig()
        // Do any additional setup after loading the view.
        
        setDesign()// set style 
    }
    
    
    func setConfig(){
        titleLabel.text = event?.name
        detailsLabel.text = event?.details
        eventImageView.image = event?.eventImage
        youtubeView.load(withVideoId: "bsM1qdGAVbU")
    }
    
    func setDesign(){
        dateStackView.layer.cornerRadius = dateStackView.frame.height/6
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
