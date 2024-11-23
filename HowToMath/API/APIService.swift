//
//  APIService.swift
//  HowToMath
//
//  Created by user269369 on 11/23/24.
//

import Foundation
import Alamofire

struct APIService {
    func getGoals(completion: @escaping([GoalType]?, Error?)-> Void) {
        AF.request("https://private-5723db-howtomathapi.apiary-mock.com/goal")
            .responseDecodable(of: [GoalType].self){
                response in
                
                switch response.result {
                case .success(let goals):
                    completion(goals, nil)
                default: break
                }
            }
    }
    
    func addGoal(newGoal: GoalType, completion: @escaping (Result<GoalType, Error>) -> Void) {
        AF.request("https://private-5723db-howtomathapi.apiary-mock.com/goal", method: .post, parameters: newGoal, encoder: JSONParameterEncoder.default)
            .responseDecodable(of: GoalType.self) { response in
                switch response.result {
                case .success(let goal):
                    completion(.success(goal))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
