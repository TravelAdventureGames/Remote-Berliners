//
//  VCMapExtensions.swift
//  Berliners
//
//  Created by Martijn van Gogh on 08-03-16.
//  Copyright © 2016 Martijn van Gogh. All rights reserved.
//

import Foundation
import MapKit

extension UIViewController {
    var contentViewController: UIViewController {
        if let navCon = self as? UINavigationController {
            return navCon.visibleViewController!
        } else {
            return self
        }
    }
}


extension ViewController: MKMapViewDelegate {
    
    // zorgt voor de vormgeving van de pinannotation, waaronder rightcalloutaccessoryview.
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Loc {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView { // 2
                    dequeuedView.annotation = annotation
                    view = dequeuedView
            } else {
                
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)//Hier heb je de annotationverwijzing die de koppeling met de ARtwork class maakt.
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -25, y: 5)
                
            }
            
            view.pinTintColor = annotation.pinTintColor()
            
            return view
        }
        return nil
    }
    
    
    // Bizar! Deze func zegt wat er gebeurt als er op de accessorycontrol wordt getapt. De app 'Maps' van Apple wordt geopend in directionsmode , waarbij standaard voor driving wordt gekozen. Dit ziet er waanzinnig uit!
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            let location = view.annotation as! Loc
            let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
            location.mapItem().openInMapsWithLaunchOptions(launchOptions)
            
        } else if control == view.leftCalloutAccessoryView {
            performSegueWithIdentifier("to ImageVC", sender: view)
        }
        
        
        
    }
    //Is de eerste tap om de annotation te selecteren, waarop de callout voor het eerst opkomt.
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        let textString = view.annotation as! Loc
        let titleString = view.annotation as! Loc
        
        label.text = "\(titleString.title!)"
        textView.text = "\(textString.descript)"
        createOverlay()
        showAlert()
        
        //maakt rightcalloutaccesory met custom-button met route66
        let image = UIImage(named: "route7.png")
        let button = UIButton(type: .Custom)
        button.frame = CGRectMake(0, 0, 35, 35)
        button.setImage(image, forState: .Normal)
        view.rightCalloutAccessoryView = button
        
        //maakt leftaccItem aan
        let accItem = view.annotation as! Loc
        let butIm = UIImage(named: accItem.imageName)
        let leftButton = UIButton(type: .Custom)
        leftButton.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        leftButton.setImage(butIm, forState: .Normal)
        view.leftCalloutAccessoryView = leftButton
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "to ImageVC" {
            if let location = (sender as? MKAnnotationView)?.annotation as? Loc {
                if let ivc = segue.destinationViewController.contentViewController as? ImageVC {
                    ivc.imageName = location.imageName
                    ivc.titleName = location.title!
                }
            }
        }
    }
}

