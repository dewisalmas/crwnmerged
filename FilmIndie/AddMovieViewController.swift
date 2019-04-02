//
//  AddMovieViewController.swift
//  FilmIndie
//
//  Created by claudia kenyta on 29/03/19.
//  Copyright © 2019 claudia kenyta. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var posterImageButton: UIButton!
    @IBOutlet weak var producerField: UITextField!
    @IBOutlet weak var synopsisField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var yearofproductionField: UITextField!
    @IBOutlet weak var screeningLocationField: UITextField!
    
    var data = [String]()
    var data2 = [String]()
    var picker = UIPickerView()
    var picker2 = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        genreLabel.text = UserDefaults.standard.string(forKey: "genre")
        
        for i in (1900...2019){
            data.append(String(i))
        }
        data2 = ["AMBON", "BALIKPAPAN", "BANDUNG", "BANJARMASIN", "BATAM", "BEKASI", "BENGKULU", "BOGOR", "CILEGON", "CIREBON", "DENPASAR", "GARUT", "GRESIK", "JAKARTA", "KARAWANG", "SURABAYA", "PALEMBANG"]
        picker.delegate = self
        picker.dataSource = self
        picker2.delegate = self
        picker2.dataSource = self
        screeningLocationField.inputView = picker2
        yearofproductionField.inputView = picker
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == picker){
            return data.count
        }else{
            return data2.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == picker){
            yearofproductionField.text = data[row]
        }
        else{
            screeningLocationField.text = data2[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == picker){
            return data[row]
        }
        else{
            return data2[row]
        }
    }
    
    
    @IBAction func importImage(_ sender: Any) {
        
    }
    
    
    
    @IBAction func nextAddButton(_ sender: Any) {
        var titleText:String! = titleField.text
        var synopsisText:String! = synopsisField.text
        var producerText:String! = producerField.text
        var genreText:String! = genreLabel.text
        
        
        var tempVideos = UserDefaults.standard.array(forKey: "tempVideos")
        
        
        
        print(titleText!)
        print(synopsisText)
        print(producerText)
        
        
        var video0 = Video(image: #imageLiteral(resourceName: "sample6"), title: titleText, director: producerText, genre: genreText, synopsis: synopsisText, duration: "Movie Duration", year: "2019", location: "Surabaya", poster:#imageLiteral(resourceName: "Untitled"), totvote: 12, publisher: "user001", publishedDate: "12-01-2019", screeningDate: "", vote:false, cs: false, startAt:"", minute:"", theater:"")
        
        
        
        tempVideos?.append(video0)
        print(tempVideos)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
