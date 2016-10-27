//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    // fetch all repo from Github API and pass the array of dictionaries to the completion closure.
    class func getRepositories(with completion: @escaping ([[String: Any]]) -> Void) {
        
        let githubRepo = "https://api.github.com/repositories?client_id=\(Secrets.clientID)&client_secret=\(Secrets.clientSecret)"
        
        let githubRepoUrl = URL(string: githubRepo)
        guard let unwrappedURL = githubRepoUrl else { print("Bad URL");  return }
        
        let session = URLSession.shared
    
        let dataTask = session.dataTask(with: unwrappedURL, completionHandler: {
            (data, response, error) in
            print(data)
            guard let unwrappedData = data else { return }
            do {
                let responseJSONArray = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [[String: AnyObject]]
                
                completion(responseJSONArray)
            }
            catch { print("error") }
            })
        dataTask.resume()
    }
}
    


