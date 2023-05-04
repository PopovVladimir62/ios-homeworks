//
//  UITableViewCell+Ext.swift
//  Navigation
//
//  Created by Владимир on 26.04.2023.
//

import UIKit

extension UITableViewCell {
    //for making 4 photo in PhotosTableViewCell
    
    func makePhotoImageView() -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.clipsToBounds = true
        
        return image
    }
}
