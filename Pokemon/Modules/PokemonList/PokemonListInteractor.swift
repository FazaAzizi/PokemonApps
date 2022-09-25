//
//  PokemonListInteractor.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import Foundation
import Alamofire
import SwiftyJSON


class PokemonListInteractor: PTIPokemonListProtocol{
    var presenter: ITPPokemonListProtocol?
    
    var listPokemon: [PokemonDetailModel] = []
    var isEnd = false
    var get: Int = 0
    var end: Int = 0
    var url = ""
    
    func fetchPokemonList(url: String){
        let headers :  HTTPHeaders = [
            "content-type": "application/json",
        ]
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).response { response in
            print("api response", response)
            print("api response data", JSON(response.data as Any))
            
            switch response.result {
            case .success:
                print("success")
                if let value = response.data{
                    let json = JSON(value)
                    var dataList: [PokemonListModel] = []
                    let temp = json["results"].arrayValue
                    self.url = json["next"].stringValue
                    for i in 0..<temp.count{
                        let dataTemp = PokemonListModel(temp[i])
                        dataList.append(dataTemp)
                        self.end += 1
                        if let url = dataTemp.url{
                            self.fetchDetailPokemon(url: url)
                        }
                    }
                }
            case .failure(let error):
                print("failure(error)",error)
            }
        }
    }
    
    func fetchDetailPokemon(url: String){
        let headers :  HTTPHeaders = [
            "content-type": "application/json",
        ]
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).response { response in
            print("api response", response)
            print("api response data", JSON(response.data as Any))
            
            switch response.result {
            case .success:
                print("success")
                if let value = response.data{
                    let json = JSON(value)
                    let data: PokemonDetailModel = PokemonDetailModel(json)
                    self.listPokemon.append(data)
                    self.get += 1
                    if self.get == self.end{
                        self.presenter?.onSuccessFetchPokemonList(data: self.listPokemon, url: self.url)
                    }
                }
            case .failure(let error):
                print("failure(error)",error)
            }
        }
    }
}
