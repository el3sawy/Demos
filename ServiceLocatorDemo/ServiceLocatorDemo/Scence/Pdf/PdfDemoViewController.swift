//
//  PdfDemoViewController.swift
//  ServiceLocatorDemo
//
//  Created by NTG on 16/07/2023.
//

import UIKit
import PDFKit

class PdfDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        test()
        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func btn(_ sender: Any) {
     let image = UIImage(named: "Umrah_Template4")
        save(image: image!)
    }
    
    
    func save(image: UIImage) {
        
        let pdfDocument = PDFDocument()

        // Load or create your UIImage
       let data2 = image.jpegData(compressionQuality: 0.5)!
        let newImage = UIImage(data: data2)
        // Create a PDF page instance from your image
      
        let pdfPage = PDFPage(image: newImage!)

        // Insert the PDF page into your document
        pdfDocument.insert(pdfPage!, at: 0)

        // Get the raw data of your PDF document
        let data = pdfDocument.dataRepresentation()

        // The url to save the data to
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let pathDestination = documentsUrl.appendingPathComponent("YourPdfFileName.pdf")
        
        let random = Int.random(in: 1...10)
        let pdfPath = (documentsDirectory as NSString).appendingPathComponent("YourPdfFileName\(random).pdf")
        
        let url = URL(fileURLWithPath: pdfPath)
        print(pathDestination)
        // Save the data to the url
        try! data!.write(to: pathDestination)
    }
    func test2() {
        // Create a PDF file path inside the "myfiles" directory
        let pdfFolderName = "myfiles"
        let pdfFileName = "myView.pdf"
        let fileManager = FileManager.default
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let pdfFolderPath = documentsPath.appending("/\(pdfFolderName)")
        let pdfPath = pdfFolderPath.appending("/\(pdfFileName)")

        // Create the "myfiles" directory if it doesn't exist
        if !fileManager.fileExists(atPath: pdfFolderPath) {
            do {
                try fileManager.createDirectory(atPath: pdfFolderPath, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Error creating directory: \(error.localizedDescription)")
            }
        }

        // Create a UIView and add it to the current view
        let myView = PdfViewCustom().load()
        myView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(myView)
        
        NSLayoutConstraint.activate([
            myView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myView.topAnchor.constraint(equalTo: view.topAnchor),
            myView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        // Create a PDF context and set the paper size
        UIGraphicsBeginPDFContextToFile(pdfPath, CGRect.zero, nil)
        UIGraphicsBeginPDFPage()
        let pdfContext = UIGraphicsGetCurrentContext()
        pdfContext?.scaleBy(x: 1.0, y: -1.0)
        pdfContext?.translateBy(x: 100.0, y: -myView.bounds.size.height)

        // Render the UIView to the PDF context
        myView.layer.render(in: pdfContext!)

        // End the PDF context
        UIGraphicsEndPDFContext()

        // Remove the UIView from the current view
        myView.removeFromSuperview()
    }
    func test () {
      
            let html = "<b>Hello <i>World!</i></b> <p>Generate PDF file from HTML in Swift</p>"
            let fmt = UIMarkupTextPrintFormatter(markupText: html)
        
            // 2. Assign print formatter to UIPrintPageRenderer

            let render = UIPrintPageRenderer()
            render.addPrintFormatter(fmt, startingAtPageAt: 0)
//        render.addPrintFormatter(<#T##formatter: UIPrintFormatter##UIPrintFormatter#>, startingAtPageAt: <#T##Int#>)
            // 3. Assign paperRect and printableRect

            let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // A4, 72 dpi
            let printable = page.insetBy(dx: 0, dy: 0)

            render.setValue(NSValue(cgRect: page), forKey: "paperRect")
            render.setValue(NSValue(cgRect: printable), forKey: "printableRect")

            // 4. Create PDF context and draw

            let pdfData = NSMutableData()
            UIGraphicsBeginPDFContextToData(pdfData, .zero, nil)

            for i in 1...render.numberOfPages {
                UIGraphicsBeginPDFPage();
                let bounds = UIGraphicsGetPDFContextBounds()
                render.drawPage(at: i - 1, in: bounds)
            }

            UIGraphicsEndPDFContext();

            // 5. Save PDF file

            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]

            pdfData.write(toFile: "\(documentsPath)/file.pdf", atomically: true)
        print( "\(documentsPath)/file.pdf")
        }
        
        
    

    
    func test3() {
        // Create a PDF file path inside the "myfiles" directory
        let pdfFolderName = "myfiles"
        let pdfFileName = "myView.pdf"
        let fileManager = FileManager.default
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let pdfFolderPath = documentsPath.appending("/\(pdfFolderName)")
        let pdfPath = pdfFolderPath.appending("/\(pdfFileName)")

        // Create the "myfiles" directory if it doesn't exist
        if !fileManager.fileExists(atPath: pdfFolderPath) {
            do {
                try fileManager.createDirectory(atPath: pdfFolderPath, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Error creating directory: \(error.localizedDescription)")
            }
        }

        let myView = PdfViewCustom(frame: .zero)
        myView.setImage(str: "")
        
        myView.frame = CGRect(x: 0, y: 0, width:  595.2, height: 841.8)
//        myView.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(myView)
//
//        NSLayoutConstraint.activate([
//            myView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            myView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            myView.topAnchor.constraint(equalTo: view.topAnchor),
//            myView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        ])
        
        
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, .zero, nil)
        guard let pdfContext = UIGraphicsGetCurrentContext() else {
            return
        }
        
        UIGraphicsBeginPDFPageWithInfo(CGRect(x: 0, y: 0, width:  595.2, height: 841.8), nil)
        let centerPoint = CGPoint(x: 612 / 2, y: 792 / 2)
        
        let viewOrigin = CGPoint(x: centerPoint.x - view.frame.width / 2, y: centerPoint.y - view.frame.height / 2)
        pdfContext.translateBy(x: viewOrigin.x, y: viewOrigin.y)
        
        myView.layer.render(in: pdfContext)
        
        UIGraphicsEndPDFContext()
        
//        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//        let pdfPath = (documentsDirectory as NSString).appendingPathComponent("YourPdfFileName.pdf")
        pdfData.write(toFile: pdfPath, atomically: true)
//        myView.removeFromSuperview()
        ///Users/ntg/Library/Developer/CoreSimulator/Devices/76C41174-9586-4089-BD94-29B9143C47F0/data/Containers/Data/Application/1B428848-F720-4142-8667-4F4D03196BE1/Documents/file.pdf
    }
    
    
    func multiView() {
        let pdfFolderName = "myfiles"
        let pdfFileName = "myView.pdf"
        let fileManager = FileManager.default
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let pdfFolderPath = documentsPath.appending("/\(pdfFolderName)")
        let pdfPath = pdfFolderPath.appending("/\(pdfFileName)")

        // Create the "myfiles" directory if it doesn't exist
        if !fileManager.fileExists(atPath: pdfFolderPath) {
            do {
                try fileManager.createDirectory(atPath: pdfFolderPath, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Error creating directory: \(error.localizedDescription)")
            }
        }

        let myView = PdfViewCustom().load()
        let views: [UIView] = [myView, myView, myView, myView]
        let pageSize = CGSize(width: 612, height: 792) // 8.5 x 11 inches at 72 dpi
        
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, .zero, nil)
        guard let pdfContext = UIGraphicsGetCurrentContext() else {
            return
        }
        
        
        for view in views {
            // Create a new PDF page
            UIGraphicsBeginPDFPageWithInfo(CGRect(x: 0, y: 0, width: pageSize.width, height: pageSize.height), nil)
            
            // Calculate the origin point of the view so that it is centered on the PDF page:
            let viewOrigin = CGPoint(x: (pageSize.width - view.frame.width) / 2, y: (pageSize.height - view.frame.height) / 2)
            
            // Translate the PDF context to the view's origin point:
            pdfContext.translateBy(x: viewOrigin.x, y: viewOrigin.y)
            
            // Draw the view into the PDF context:
            view.layer.render(in: pdfContext)
        }
        
        UIGraphicsEndPDFContext()
        pdfData.write(toFile: pdfPath, atomically: true)
    }
}
