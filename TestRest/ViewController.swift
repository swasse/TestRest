//
//  ViewController.swift
//  TestRest
//
//  Created by ontlener on 22/01/2020.
//  Copyright © 2020 EhB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colletionView: UICollectionView!
    
    
    var items = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        items = DAO.sharedInstance.getAllPosts()
        let width = (view.frame.width-20)/2
        let layout = colletionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! PostCollectionViewCell
        let index = colletionView.indexPath(for: cell)!
        let post = items[index.item]
        
        let destination = segue.destination as! DetailViewController
        
        destination.post = post
    }
}

extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PostCollectionViewCell

        let post = items[indexPath.item]
        cell.postTitle.text = post.title
        
        return cell
    }
}
