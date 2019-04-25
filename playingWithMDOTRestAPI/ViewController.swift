//
//  ViewController.swift
//  playingWithMDOTRestAPI
//
//  Created by Administrator on 1/16/19.
//  Copyright © 2019 Jason Kwak. All rights reserved.
//

import UIKit

struct Course: Decodable{
    var id:Int
    var name: String
    var link: String
    var imageUrl: String
}

struct WebsiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [Course]
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course" //case1
//        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses" //case2
//        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description" //case3
//        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields" //case4
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //check err
            //check response 200 ok
            
            //parse data as a string
//            guard let data = data else { return }
//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString)
           
            guard let data = data else { return }
            do {
                
//              CASE ONE
                //when returning a single json object
//                let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
//                /***uncomment below to run
                let course = try JSONDecoder().decode(Course.self, from: data)
                print(course.name)
//                  ***/end uncomment
                
//                CASE TWO
                //when returning an array of courses
//                let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
//                /***uncomment below to run
//                let courses = try JSONDecoder().decode([Course].self, from: data)
//                print(courses[2].name)
//                  ***/end uncomment
                
//                CASE THREE
                //when returning complicated JSON object arrays that have arrays within themselves
//                let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
                //***uncomment below to run
//                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
//                print(websiteDescription.name, websiteDescription.description)
//                  ***/end uncomment

//                CASE FOUR
                //when returning JSON data with missing fields
//                let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
                //either make all struct data optionals
                //convert to string and edit the string to get data without optional tag
//                /***uncomment below to run
//                let courses = try JSONDecoder().decode([Course].self, from: data)
//                let tempString: String =  "\(courses[1].name)"
//                print(courses[1].name)
//                print(tempString.replacingOccurrences(of: "Optional(\"", with: "").replacingOccurrences(of: "\")", with: ""))
//                  ***/end uncomment

                
            }catch let jsonErr{
                print("Error serializing json:", jsonErr)
            }
            
            
        }.resume()
        
        
        
    }


}

