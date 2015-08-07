//
//  ViewController.swift
//  OoyalaSwift
//
//  Created by Developer II on 7/1/15.
//  Copyright (c) 2015 Developer II. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	let EMBED_CODE = "1scmJibzpPtw8QwNYtuhXW1r2smNtTop" // 1scmJibzpPtw8QwNYtuhXW1r2smNtTop
	let PCODE = "p1YTAyOkAHioMfsu3I8Rnv04telJ"
	let PLAYERDOMAIN = "http://www.ooyala.com"
	let embedCodesArray = ["J5Zm5jbzrJoQmFG-07qeeOAz4QVt875X","N4a25jbzr_xEeEMHJ02oaQve_Nx77KTt","lkZW5jbzr6WPWxHg6HSmHC_nRl-9P4xC","5sZW5jbzo54MqmId00YiBqCAx1NZTvvW","w0YnBnbzpgq-mcQvlGG0eTGkAIrGolaw","dtZG5jbzrZwTDeDmnKgZXfXFed58zqFu","A1bW5jbzpHgtbxpbX-xasg4JZsnFaoSh","gyazNkbzqe0C-BkLxhZO1BldbOEmg0fX","Z0aW5jbzrAJQ4s_SntPL1NiSRq_igdnP","5rZm5jbzp6aRUrGb7Y_hBIiz-0fFvbwP","o4aG5jbzq0flWLsLSpfyFjoFMSklAqEt", "wyZm5jbzrm1POrKf7wi9zuA24s0XjlIa", "t5am5jbzqxjOCzUNioUG7bWFjDHDVivv", "B0Y25jbzpOFZmsiJaOPkfZQMIVneLxEY"]
	var ooyalaPlayerViewController : OOOoyalaPlayerViewController!
	
	@IBOutlet weak var playerView: UIView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		var player = OOOoyalaPlayer(pcode: PCODE, domain: OOPlayerDomain(string: PLAYERDOMAIN))
		ooyalaPlayerViewController = OOOoyalaPlayerViewController(player: player)
		//self.addChildViewController(ooyalaPlayerViewController)
		ooyalaPlayerViewController.view.frame = playerView.bounds
		self.addChildViewController(ooyalaPlayerViewController)
		playerView.addSubview(ooyalaPlayerViewController.view)
		
		ooyalaPlayerViewController.player.setEmbedCodes(embedCodesArray)
		ooyalaPlayerViewController.player.play()
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.None)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "playerStatus:", name: nil, object: ooyalaPlayerViewController.player)
	}
	
	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.None)
		NSNotificationCenter.defaultCenter().removeObserver(self)
	}
	
	func playerStatus(notification: NSNotification) {
		if notification.name == OOOoyalaPlayerTimeChangedNotification {
			return
		}
		
		println("NOTIFICATION NAME: \(notification.name)")
		if notification.name == "currentItemChanged" {
			println("")
			println("OOYALA CHANGED ITEM !!!!!!!")
			println("")
		}
	}
	
}



