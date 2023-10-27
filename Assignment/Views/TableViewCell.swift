//
//  TableViewCell.swift
//  Assignment
//
//  Created by EMPULSE on 27/10/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var title: UITextView!
    @IBOutlet weak var userLogin: UILabel!
    @IBOutlet weak var created_at: UILabel!
    @IBOutlet weak var imageViewContainer: UIView!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setDataToView(data: Issue){
        imageViewContainer.roundRadius(radiusValue: imageViewContainer.bounds.width / 2)
        print("get data from viewController to Cells \(data)")
        image(url: data.user.imageUrl)
        title.text = data.title
        userLogin.text = data.user.login
        created_at.text = data.createdAt
    }
    
    func image(url: String){
        if let imageUrl = URL(string: url) {
            URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.userImage.image = image 
                    }
                }
            }.resume()
        }

    }
    
}
