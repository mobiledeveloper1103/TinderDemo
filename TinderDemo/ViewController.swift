//
//  ViewController.swift
//  TinderDemo
//
//  Created by Shiffa Khurana on 08/11/17.
//  Copyright © 2017 IOS Freelancer. All rights reserved.
//

import UIKit
import Koloda
class ViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet var tinderBaseView: KolodaView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var skillTypeLabel: UILabel!
    
    //MARK: CLASS VARIABLES
    var allImages : [UIImage ] =  [#imageLiteral(resourceName: "feamle1.jpg"),#imageLiteral(resourceName: "male1.jpeg"),#imageLiteral(resourceName: "male2.jpeg"),#imageLiteral(resourceName: "male3.jpeg"),#imageLiteral(resourceName: "female2.jpeg"),#imageLiteral(resourceName: "female3.jpg"),#imageLiteral(resourceName: "female4.jpeg"),#imageLiteral(resourceName: "female5.jpeg"),#imageLiteral(resourceName: "female6.jpg"),#imageLiteral(resourceName: "female7.jpg"),#imageLiteral(resourceName: "female8.jpeg"),#imageLiteral(resourceName: "female9.jpeg"),#imageLiteral(resourceName: "male4.jpeg"),#imageLiteral(resourceName: "male 5.jpeg"),#imageLiteral(resourceName: "female10.jpg"),#imageLiteral(resourceName: "female11.jpeg"),#imageLiteral(resourceName: "female12.jpeg"),#imageLiteral(resourceName: "female13.jpeg"),#imageLiteral(resourceName: "female14.jpeg"),#imageLiteral(resourceName: "male6.jpeg"),#imageLiteral(resourceName: "male7.jpeg"),#imageLiteral(resourceName: "male8.jpeg"),#imageLiteral(resourceName: "male9.jpg"),#imageLiteral(resourceName: "female15.jpeg"),#imageLiteral(resourceName: "female16.jpg"),#imageLiteral(resourceName: "male10.jpg"),#imageLiteral(resourceName: "female17.jpg"),#imageLiteral(resourceName: "male11.jpeg"),#imageLiteral(resourceName: "female18.jpeg")]
    var userNames = ["Sagar Shah", "John Harper", "Clara Smith","Bob Thomas","Sophie Laura","Sammie Lopez","Connie Jones","Camille Rowe","Joana Silver","Sasha Doe", "Gaby Simone", "Chloe Isabella", "George Stanley", "Dominic Hope","Sandra Bonhomme", "Sophie Gerbault","Sarah Seemore",      "Rachel Green", "Josephine Taylor", "Jay Jiang", "Hunter Dickson", "Sam Gupta", "Tom Brady", "Taylor Thompson", "Tatianna Marshall", "Eric Street", "Marine Simon", "Ronald Duck", "Jennifer Lopez"]
    var skills = ["Django", "Python", "Django", "React", "React", "Django", "Django" , "Django" ,"Python", "Django" , "React" ,"React","Django", "Django", "Django","React","React","Django","Django","Django","React","React","Django","Django","Django", "Python","Python","Python","Python"]
    
    //MARK: CONTROLLERS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tinderBaseView.dataSource = self
        tinderBaseView.delegate = self
        tinderBaseView.reloadData()
    }

    //MARK: BUTTONS ACTIONS
    //DECLINE TAPPED
    @IBAction func leftButtonTapped(_ sender: Any) {
        tinderBaseView?.swipe(.left)
        
    }
    //CHOSEN TAPPED
    @IBAction func rightButtonTapped(_ sender: Any) {
        tinderBaseView?.swipe(.right)
    }
}

//MARK: KOLADO DELEGATE
extension ViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        self.showBasicAlert(title: "You selected \(userNames[index])" , message: "")
    }
}

//MARK: KOLADO DATASOURCE
extension ViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return allImages.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        //set user name and skill according to picture
        userNameLabel.text = userNames[index]
        skillTypeLabel.text = skills[index]
        print(index)
        return UIImageView(image: allImages[index])
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)?[0] as? OverlayView
    }
}


extension UIViewController{
    //BASIC ALERT FUNCTION
    func showBasicAlert(title:String, message: String)  {
        let alertVc = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            
        }
        alertVc.addAction(okAction)
        if self.presentedViewController == nil{
            self.present(alertVc, animated: true, completion: nil)
            
        }
    }
}

