//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by Mac on 20/10/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
 
    @IBOutlet weak var postTableView: UITableView!
    var posts : [Post] = []
    private let postTableViewCellReuseIdentifier : String = "PostTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParsingWithAlamofire()
        initializeTableView()
        registerXIBWithPostTableView()
    }
    func initializeTableView(){
        postTableView.dataSource = self
        postTableView.delegate = self
    }
    func registerXIBWithPostTableView(){
        let uiNib = UINib(nibName: postTableViewCellReuseIdentifier, bundle: nil)
        postTableView.register(uiNib, forCellReuseIdentifier: postTableViewCellReuseIdentifier)
    }
    func jsonParsingWithAlamofire(){
        Alamofire.request("https://jsonplaceholder.typicode.com/posts").responseJSON { response in
            let response = response.result.value as! [[String:Any]]
            print(response)
            
            for eachResponseOfPost in response{
                let postuserId = eachResponseOfPost["userId"] as! Int
                let postId = eachResponseOfPost["id"] as! Int
                let postTitle = eachResponseOfPost["title"] as! String
                let postBody = eachResponseOfPost["body"] as! String
            
                self.posts.append(Post(userId: postuserId,
                                       id: postId,
                                       title: postTitle,
                                       body: postBody)
                                  )
                                  
            }
            DispatchQueue.main.async {
                self.postTableView.reloadData()
            }
        }
        .resume()
    }

}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postTableViewCell = self.postTableView.dequeueReusableCell(withIdentifier:postTableViewCellReuseIdentifier , for: indexPath) as! PostTableViewCell
        
        postTableViewCell.PostUserId.text = String(posts[indexPath.row].userId)
        postTableViewCell.PostId.text = String(posts[indexPath.row].id)
        postTableViewCell.PostTitle.text = String(posts[indexPath.row].title)
        postTableViewCell.PostBody.text = String(posts[indexPath.row].body)
        
        return postTableViewCell
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 193.0
    }
}
