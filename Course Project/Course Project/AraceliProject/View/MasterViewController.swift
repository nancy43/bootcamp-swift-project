//
//  MasterViewController.swift
//  Course Project
//
//  Created by Araceli Teixeira on 15/12/17.
//  Copyright © 2017 ProDigi. All rights reserved.
//

import UIKit
import MapKit

class MasterViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    var list: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapView.delegate = self
        
        print("Fetching user list...")
        UserController.sharedInstance.fetchUserList(onSuccess: onSuccessScenario, onFail: onFailScenario)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func onSuccessScenario() {
        DispatchQueue.main.async {
            self.list = UserController.sharedInstance.userList
            for user in self.list {
                print(user.fullName())
            }
        }
    }
    
    private func onFailScenario(errorMessage: String) {
        print(errorMessage)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension MasterViewController: MKMapViewDelegate {

}
