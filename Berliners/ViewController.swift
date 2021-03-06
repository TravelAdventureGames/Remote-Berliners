//
//  ViewController.swift
//  Berliners
//
//  Created by Martijn van Gogh on 08-03-16.
//  Copyright © 2016 Martijn van Gogh. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


var firstTime = true
class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: MKMapView!

    //opzet uview
    var overlayView: UIView!
    var alertView: UIView!
    var animator: UIDynamicAnimator!
    var attachmentBehavior : UIAttachmentBehavior!
    var snapBehavior : UISnapBehavior!
    let textView = UITextView()
    let label = UILabel()
    
    
    let beginTitle = "Herzlich wilkommen!"
    let beginText = "Lieber Berliners!\nDit appje helpt ons alle leuke plekjes van Berlijn te vinden! Er zitten golden oldies bij, maar ook hele nieuwe spots. Met het appje heb je altijd in een paar drukken op de knop de route naar de locatie. 'Ein Kind kann die Wäsche tun' zouden de Duitsers zeggen. Oh ja, als je genoeg hebt gehad voor de dag, klik dan op 'MB' en je wordt teruggeleid naar Michel Berger!"
    
    var LM = CLLocationManager()
    let regionRadius: CLLocationDistance = 6000
    let initialLocation = CLLocation(latitude: 52.504788, longitude: 13.447915)
    let navBar = UINavigationBar()
    
    var locations: [Loc] = locationData
    
    @IBAction func listTapped(sender: AnyObject) {
        performSegueWithIdentifier("to list", sender: self)
    }

    @IBAction func naarHotel(sender: AnyObject) {
        
        let coor: CLLocationCoordinate2D = CLLocationCoordinate2DMake(52.504663, 13.447905)
        
        let placemar = MKPlacemark(coordinate: coor, addressDictionary: nil)
        let mapIt = MKMapItem(placemark: placemar)
        
        
        let launchOption = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
        mapIt.openInMapsWithLaunchOptions(launchOption)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Leuke plekjes!"
        
        mapView.delegate = self
        centerMapOnLocation(initialLocation)
        
        mapView.addAnnotations(locations)
        
        animator = UIDynamicAnimator(referenceView: view)
        
        createOverlay()
        createAlert(beginText, ltext: beginTitle)
        
        if firstTime == true {
            firstTime = false
            showAlert()
        }
        
    }
    
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            LM.requestWhenInUseAuthorization()
        }
    }
    func createOverlay() {
        // Create a gray view and set its alpha to 0 so it isn't visible
        overlayView = UIView(frame: view.bounds)
        overlayView.backgroundColor = UIColor.grayColor()
        overlayView.alpha = 0.0
        view.addSubview(overlayView)
    }
    
    func createAlert(text: String, ltext: String) {
        // Here the red alert view is created. It is created with rounded corners and given a shadow around it
        
        let alertWidth: CGFloat = 270
        let alertHeight: CGFloat = 200
        let originx: CGFloat = view.bounds.width / 2
        let originy: CGFloat = -300
        
        let alertViewFrame: CGRect = CGRectMake(originx, originy, alertWidth, alertHeight)
        alertView = UIView(frame: alertViewFrame)
        alertView.backgroundColor = UIColor.whiteColor()
        alertView.alpha = 0.0
        alertView.layer.cornerRadius = 18;
        alertView.layer.shadowColor = UIColor.blackColor().CGColor;
        alertView.layer.shadowOffset = CGSizeMake(0, 5);
        alertView.layer.shadowOpacity = 0.3;
        alertView.layer.shadowRadius = 10.0;
        
        
        label.text = ltext
        label.backgroundColor = UIColor.clearColor()
        label.frame = CGRectMake(15, 15, alertWidth-30, 16)
        label.font = UIFont.boldSystemFontOfSize(15)
        label.textAlignment = .Center
        
        
        textView.allowsEditingTextAttributes = false
        textView.scrollEnabled = false
        textView.text = text
        textView.backgroundColor = UIColor.clearColor()
        textView.frame = CGRectMake(15, 34, alertWidth-30, alertHeight-15)
        textView.textAlignment = .Justified
        textView.sizeToFit()
        
        alertView.addSubview(label)
        alertView.addSubview(textView)
        view.addSubview(alertView)
    }
    
    func showAlert() {

        if (alertView == nil) {
            createAlert(textView.text, ltext: label.text!)
        }

        createGestureRecognizer()
        
        animator.removeAllBehaviors()
        
        // Animate in the overlay
       UIView.animateWithDuration(0.4) {
            self.overlayView.alpha = 0.3
        }
        
        // Animate the alert view using UIKit Dynamics.
        alertView.alpha = 1.0
        
        
        let snapBehaviour: UISnapBehavior = UISnapBehavior(item: alertView, snapToPoint: view.center)
        animator.addBehavior(snapBehaviour)
        let gravityBehaviour: UIGravityBehavior = UIGravityBehavior(items: [alertView])
        animator.addBehavior(gravityBehaviour)
        
    }
    
    func dismissAlert() {
        
        animator.removeAllBehaviors()
        
        let gravityBehaviour: UIGravityBehavior = UIGravityBehavior(items: [alertView])
        gravityBehaviour.gravityDirection = CGVectorMake(0.0, 10.0)
        animator.addBehavior(gravityBehaviour)
        
        // This behaviour is included so that the alert view tilts when it falls, otherwise it will go straight down
        let itemBehaviour: UIDynamicItemBehavior = UIDynamicItemBehavior(items: [alertView])
        itemBehaviour.addAngularVelocity(CGFloat(-M_1_PI), forItem: alertView)
        animator.addBehavior(itemBehaviour)
        
        // Animate out the overlay, remove the alert view from its superview and set it to nil
        // If you don't set it to nil, it keeps falling off the screen and when Show Alert button is
        // tapped again, it will snap into view from below. It won't have the location settings we defined in createAlert()
        // And the more it 'falls' off the screen, the longer it takes to come back into view, so when the Show Alert button
        // is tapped again after a considerable time passes, the app seems unresponsive for a bit of time as the alert view
        // comes back up to the screen
        UIView.animateWithDuration(0.4, animations: {
            self.overlayView.alpha = 0.0
            }, completion: {
                (value: Bool) in
                self.alertView.removeFromSuperview()
                self.alertView = nil
        })
        
    }
    

    
    func createGestureRecognizer() {
        let panGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(_:)))
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    // This gets called when a pan gesture is recognized. It was set as the selector for the UIPanGestureRecognizer in the
    // createGestureRecognizer() function
    // We check for different states of the pan and do something different in each state
    // In Began, we create an attachment behaviour. We add an offset from the center to make the alert view twist in the
    // the direction of the pan
    // In Changed we set the attachment behaviour's anchor point to the location of the user's touch
    // When the user stops dragging (In Ended), we snap the alert view back to the view's center (which is where it was originally located)
    // When the user drags the view too far down, we dismiss the view
    // I check whether the alert view is not nil before taking action. This ensures that when the user dismisses the alert view
    // and drags on the screen, the app will not crash as it tries to move a view that hasn't been initialized.
    
    
    func handlePan(sender: UIPanGestureRecognizer) {
    
        if (alertView != nil) {
            let panLocationInView = sender.locationInView(view)
            let panLocationInAlertView = sender.locationInView(alertView)
            
            if sender.state == UIGestureRecognizerState.Began {
                animator.removeAllBehaviors()
                
                //let point = CGPointMake(view.bounds.width / 2, view.bounds.height)
                let offset = UIOffsetMake(panLocationInAlertView.x - CGRectGetMidX(alertView.bounds), panLocationInAlertView.y - CGRectGetMidY(alertView.bounds));
                attachmentBehavior = UIAttachmentBehavior(item: alertView, offsetFromCenter: offset, attachedToAnchor: panLocationInView)
                //
                
                animator.addBehavior(attachmentBehavior)
            }
            else if sender.state == UIGestureRecognizerState.Changed {
                attachmentBehavior.anchorPoint = panLocationInView
            }
            else if sender.state == UIGestureRecognizerState.Ended {
                animator.removeAllBehaviors()
                
                snapBehavior = UISnapBehavior(item: alertView, snapToPoint: panLocationInView)
                animator.addBehavior(snapBehavior)
                
                if sender.translationInView(view).y > 10 {
                    dismissAlert()
                }
            }
        }
        
    }


}
class CustomPointAnnotation: MKPointAnnotation {

    var imageName: String = "heartic.png"
    
}


