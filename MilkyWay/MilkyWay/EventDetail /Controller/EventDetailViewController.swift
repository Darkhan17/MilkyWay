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
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var youtubeView: YTPlayerView!
    var videoId : String?
    var eventTitle : String?
    var eventDescription : String?
    var eventImage : UIImage?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfig()
        // Do any additional setup after loading the view.
    }
    
    
    func setConfig(){
        titleLabel.text = eventTitle
        descriptionLabel.text = eventDescription
        eventImageView.image = eventImage
        guard let youtubeId = videoId else { return }
        youtubeView.load(withVideoId: youtubeId)
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
