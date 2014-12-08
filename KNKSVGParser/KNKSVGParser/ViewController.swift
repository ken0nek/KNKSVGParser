//
//  ViewController.swift
//  KNKSVGParser
//
//  Created by Ken Tominaga on 12/7/14.
//  Copyright (c) 2014 Ken Tominaga. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var sampleTableView: UITableView!
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        sampleTableView.delegate = self
        sampleTableView.dataSource = self
        let names = ["masuhara", "ken0nek", "wkentaro", "fukuta0614", "TAKKAA", "gachaa", "tadory", "shoya140"]
        for name in names {
            self.images.append(KNKSVGView(userName: name).toImage())
        }
        
//        let image = KNKSVGView(userName: "ken0nek").toImage()
//        let imageView = UIImageView(frame: CGRectMake(10, 10, 300, 300))
//        imageView.image = image
//        imageView.contentMode = UIViewContentMode.ScaleAspectFit
//        self.view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as KNKSVGSampleCell
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let image = self.images[indexPath.row]
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                cell.svgImageView.image = image
                cell.svgImageView.alpha = 0.0
                cell.svgImageView.transform = CGAffineTransformMakeScale(0.6, 0.6)
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    cell.svgImageView.alpha = 1.0
                    cell.svgImageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
                })
            })
        })
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    

}

