//
//  MovieViewController.swift
//  TMDBAT
//
//  Created by Gustavo Gomes de Oliveira on 11/11/17.
//  Copyright © 2017 Gustavo Gomes de Oliveira. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    var movie: Movie!
    var genreList: [[String: String]]!

    @IBOutlet weak var ImgMovie: UIImageView!
    @IBOutlet weak var LblMovieTitle: UILabel!
    @IBOutlet weak var LblMovieGenre: UILabel!
    @IBOutlet weak var LblReleaseDate: UILabel!
    @IBOutlet weak var TxtMovieDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovie()
        getMovieGenres()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        ImgMovie.isUserInteractionEnabled = true
        ImgMovie.addGestureRecognizer(tapGestureRecognizer)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    func loadMovie(){
        
        LblMovieTitle.text = self.movie.tittle
        LblReleaseDate.text = self.movie.releaseDate
        TxtMovieDescription.text = self.movie.overview
        ImgMovie.image = movie.posterImage
        
    }
    
    func getMovieGenres(){
        
        LblMovieGenre.text = ""
        
        for movieGenre in movie.genre {
            
            for genre in genreList {
                
                if (movieGenre == Int(genre["id"]!)) {
                    
                    LblMovieGenre.text = genre["name"]
                }
                
            }
            
        }
    }

    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        
        performSegue(withIdentifier: "seguePoster", sender: nil)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "seguePoster") {
            
            let destinationVC = segue.destination as! PosterViewController
            destinationVC.posterImage = ImgMovie.image
            
        }
        
    }
    
}
