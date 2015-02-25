//
//  FirstViewController.swift
//  Images
//
//  Created by Cenny Davidsson on 2015-02-25.
//  Copyright (c) 2015 Linköpings University. All rights reserved.
//

/*
    Börja med att förstå koden. Just nu finns det en scrollview som har en imageView som subview
    går att zooma och skrolla. Om du testar att zooma så märker du att det går att zooma så att 
    bilden blir väldigt liten. Första uppgiften är att anpassa zoomingen så det inte går att zoom
    ut mer än vad bilden är stor, när du zoomat ut maximalt så bilden vara kant i kant med skärmen 
    på två sidor om bilden inte har exakt samma propotioner som skärmen som den visas på.

    Andra uppgiften är att se till att bilden är centrerad när bilden är maximalt utzoomad. Det 
    betyder att det ska finnas vit bakgrund under och över eller på sidorna. Det färdiga resultatet 
    ska alltså fungera som bilder applikationen som finns på iOS.

    Tredje uppgiften är att zooma in där användaren dubbeltrycker och zooma ut om personen redan 
    har zoomat in. Samma här det är meningen att det ska efterliknnas funktionaliteten i bilder
    applikationen.

*/

import UIKit

class FirstViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    let imageView = UIImageView(image: UIImage(named: "Kyrka"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sätter contentSize så scrollView vet den faktiska storlken på det 
        // den ska visa.
        scrollView.contentSize = imageView.frame.size
        scrollView.addSubview(imageView)
        
        scrollView.delegate = self
        
        // Dessa värden ska sättas till något som är anpassat till
        // bildens storlek.
        scrollView.minimumZoomScale = 0.2
        scrollView.maximumZoomScale = 5
        
    }
    
    // MARK: UIScrollViewDelegate
    
    // Denna metod från delegatet måste implemeteras för att zoom ska fungera
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        // Retunerar den subview till scrollView som vill kunna zooma
        return imageView
    }

}

