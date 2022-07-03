//
//  CoinListRepository.swift
//  MyCoin
//
//  Created by 강조은 on 2022/06/28.
//

import Foundation
import Alamofire

class CoinListRepository {
    let URL = "https://api.coinpaprika.com/v1/coins"
    var temp: [CoinListEntity] = []
    func apiRequest() {

        AF.request(URL, method: .get).responseJSON() { response in
            do{
                let decoder = JSONDecoder()
                switch (response.result) {
                case .success:
                    self.temp = try decoder.decode([CoinListEntity].self, from: response.data!)
                    print(self.temp.count)
                    print(self.temp[1])
                    print("id:\(self.temp[1].id)")
                case .failure(let error):
                    print("errorCode: \(error._code)")
                    print("errorDescription: \(error.errorDescription!)")
                }
            } catch let parsingError {
                print("Error:", parsingError)
            }
        }.resume()
    }
    
    func passData() -> [CoinListEntity] {
        return temp
    }
}

////
////  CoinListRepository.swift
////  MyCoin
////
////  Created by 강조은 on 2022/06/28.
////
//
//import Foundation
//import Alamofire
//
//class CoinListRepository {
//    let URL = "https://api.coinpaprika.com/v1/coins"
//
//    func apiRequest() {
//        AF.request(URL, method: .get).responseJSON() { response in
//            do{
//                let decoder = JSONDecoder()
//                switch (response.result) {
//                case .success:
//                    self.coinListData = try decoder.decode([CoinListEntity].self, from: response.data!)
//                case .failure(let error):
//                    print("errorCode: \(error._code)")
//                    print("errorDescription: \(error.errorDescription!)")
//                }
//            } catch let parsingError {
//                print("Error:", parsingError)
//            }
//        }.resume()
//    }
//}