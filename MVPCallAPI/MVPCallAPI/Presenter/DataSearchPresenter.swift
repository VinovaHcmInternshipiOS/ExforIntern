//
//  DataSearchPresenter.swift
//  ExampleCallAPI
//
//  Created by nguyen gia huy on 14/10/2020.
//

import Foundation
protocol DataSearchViewControllerProtocol: class {
    func refreshDataAPI()
    func callAPISuccess(movie: [Movies])
    func callAPIFailed(msg: String)
    func callNotResult()

}
protocol DataSearchPresenterProtocol: class {
    var view: DataSearchViewControllerProtocol? { get set }
    func callAPILoadmore(searchText: String, page: Int)
    func callAPISearch(searchText: String)
    func resetPageLoadMore()
    func getCurrentPage() -> Int
    func getTotalPage() -> Int
    func removeSpecialCharsFromString(text: String) -> String
}
    
class DataSearchPresenter: DataSearchPresenterProtocol {

    weak var view: DataSearchViewControllerProtocol?
    var processedJson = [Movies]()
    var dataJson = [ModelJson]()
    var totalPage = 0
    var pageCurrent = 1
    func callAPISearch(searchText: String) {
            self.view?.refreshDataAPI()
            processedJson = []
            dataJson = []
        URLSession.shared.dataTask(with: URL(string: "https://api.themoviedb.org/3/search/movie?api_key=2b08fb7cdc8dbd19cddd2e8ab9388af2&page=1&query=\(searchText)")!) { [weak self] (data,respone, err) in
                if let err = err {
                    self?.view?.callAPIFailed(msg: err.localizedDescription)
                    return
                }
                guard let data = data else { return }
                guard let response = try? JSONDecoder().decode(ModelJson.self, from: data) else { return }
                self!.dataJson.append(response)
            
            if response.results.count == 0 {
                DispatchQueue.main.async { [weak self] in
                    self?.view?.callNotResult()
                }
                
            }
            else
            {
                for element in self!.dataJson {
                    self!.totalPage = element.totalPages
                    self!.pageCurrent = element.page
                    for id in element.results {
                        let request = Movies(title: id.title, id: id.id)
                        self!.processedJson.append(request)
                        DispatchQueue.main.async { [weak self] in
                            self?.view?.callAPISuccess(movie: self!.processedJson)
                        }
                        
                    }
                }
            }
                
            }.resume()
        
    }
    
    func callAPILoadmore(searchText: String, page: Int) {
        pageCurrent = pageCurrent + 1
        URLSession.shared.dataTask(with: URL(string: "https://api.themoviedb.org/3/search/movie?api_key=2b08fb7cdc8dbd19cddd2e8ab9388af2&page=\(pageCurrent)&query=\(searchText)")!) { [weak self] (data,respone, err) in
            if let err = err {
                self?.view?.callAPIFailed(msg: err.localizedDescription)
                return
            }
            guard let data = data else { return }
            guard let response = try? JSONDecoder().decode(ModelJson.self, from: data) else { return }
            self!.dataJson.append(response)
            print("data",self!.dataJson.count)
            for element in self!.dataJson {
                print("page",element.page)
                if element.page == self!.pageCurrent {
                    for id in element.results {
                        let request = Movies(title: id.title, id: id.id)
                        self!.processedJson.append(request)
                        DispatchQueue.main.async { [weak self] in
                            self?.view?.callAPISuccess(movie: self!.processedJson)



                        }

                    }
                }
                
            }


        }.resume()
    }
    
    func getCurrentPage() -> Int {
        return pageCurrent
    }
    
    func getTotalPage() -> Int {
        return totalPage
    }
    
    func resetPageLoadMore() {
        pageCurrent = 1
    }
    
    func removeSpecialCharsFromString(text: String) -> String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-=().!_")
        let trimmed = text.trimmingCharacters(in: .whitespaces)
        return trimmed.filter {okayChars.contains($0) }.replacingOccurrences(of: " ", with: "-")
    }
}

