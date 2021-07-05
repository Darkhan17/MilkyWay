//
//  EventTableViewCell.swift
//  MilkyWay
//
//  Created by Khamitov Darkhan on 7/1/21.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var flightNumber: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var eventView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
        
    func configure(with event: Event){
        self.titleLabel.text = event.name
        self.descriptionLabel.text = event.details
        self.flightNumber.text = "Flight number:\(event.flightNumber)"
        self.dateLabel.text = "Date: \(getStringFromDate(from: event.date!))"
        self.indicator.isHidden = false
        self.indicator.startAnimating()
        self.eventImage.isHidden = false
        EventNetworkService.getImage(from: event.imageUrl) { (image) in
            self.eventImage.image = image
            /* self.indicator.stopAnimating()
            self.indicator.isHidden = true
            self.imageView?.isHidden = false
            */
            print("end")
 
        }
        
        setStyle()
    }
    
    func setStyle(){
        indicator.isHidden = true
        eventView.layer.cornerRadius = eventView.frame.height/6
        contentView.backgroundColor = .black
    }
    
    func getStringFromDate(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let eventDate = dateFormatter.string(from: date)
        return eventDate
    }

}
