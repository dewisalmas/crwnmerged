//
//  homeListSreenViewController.swift
//  FilmIndie
//
//  Created by Dewi Salma Salsabila on 28/03/19.
//  Copyright © 2019 claudia kenyta. All rights reserved.
//

import UIKit

class myLibraryListViewController: UIViewController {
    
    struct GlobalVariable{
        static var myVideos: [Video] = []
        static var myLibIndex=0
    }
    
    @IBOutlet weak var libtableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GlobalVariable.myVideos = createArray()
        /*else{
         var addvideo02=Video(image: #imageLiteral(resourceName: "parachute-4078833_640"), title: "coba", director: "coba", genre: "coba", synopsis: "coba", duration: "coba", year: "coba", location: "coba", poster: #imageLiteral(resourceName: "Untitled"), totvote: 0, publisher: "coba", publishedDate: "coba", screeningDate: "coba", vote: false)
         GlobalVariable.videos.append(addvideo02)
         }*/
        
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        libtableView.delegate=self
        libtableView.dataSource=self
        
        libtableView.reloadData()
    }
    
    func createArray() -> [Video]{
        var tempVideos: [Video] = []
        
        var video0 = Video(image: #imageLiteral(resourceName: "Untitled"), title: "Movie Title", director: "Movie Director", genre: "Movie Genre", synopsis: "Movie Synopsis", duration: "Movie Duration", year: "2019", location: "Surabaya", poster:#imageLiteral(resourceName: "Untitled"), totvote: 12, publisher: "user001", publishedDate: "12-01-2019", screeningDate: "", vote:false, cs: false, startAt:"", minute:"", theater:"")
        var video1 = Video(image: #imageLiteral(resourceName: "tulips-4072214_640"), title: "Semi di Bawah Sakura", director: "Galih Ratih", genre: "Slice of Life", synopsis: "Disaat langit tak lagi biru", duration: "00:53:02", year: "2019", location: "Malang", poster:#imageLiteral(resourceName: "Untitled"), totvote: 8, publisher: "user002", publishedDate: "12-03-2019", screeningDate: "", vote:false, cs: false, startAt:"", minute:"", theater:"")
        var video2 = Video(image: #imageLiteral(resourceName: "hand-2326058_640"), title: "Sebut Saja Mawar", director: "Trisha Hanum", genre: "Drama", synopsis: "Arti dari sekuntum bunga yang dianggap sebagai mawar oleh wanita itu dibiarkan menengadah seolah menerima debu", duration: "00:41:56", year: "2019", location: "Surabaya", poster:#imageLiteral(resourceName: "Untitled"), totvote: 6, publisher: "user003", publishedDate: "23-02-2019", screeningDate: "",vote:false, cs: false, startAt:"", minute:"", theater:"")
        
        //tempVideos.append(video0)
        tempVideos.append(video1)
        tempVideos.append(video2)
        
        return tempVideos
    }
    
    //CODING ACTION APA AJA DI PAGE INI
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        GlobalVariable.myLibIndex=indexPath.row
        performSegue(withIdentifier: "segue3", sender: self)
    }
}

extension myLibraryListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GlobalVariable.myVideos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video=GlobalVariable.myVideos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier:"myVideoCell") as! videoCellTableViewCell
        
        cell.setVideo(video: video)
        
        return cell
    }
}
