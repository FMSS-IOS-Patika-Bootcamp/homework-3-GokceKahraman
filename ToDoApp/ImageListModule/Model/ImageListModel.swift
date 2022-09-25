import Foundation

protocol ImageListModelProtocol: AnyObject {
    func didDataFetchProcessFinish(_ isSuccess: Bool )
}

class ImageListModel {
    
    weak var delegate: ImageListModelProtocol?
    
    var images: [Image] = []
    
    func fetchData() {
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/photos") else{
            delegate?.didDataFetchProcessFinish(false)
            return
        }
        var request: URLRequest = .init(url: url)
//        http method
        request.httpMethod = "GET"
        //error
        let task = URLSession.shared.dataTask(with: request) {
            [weak self] data, response, error in
            
            guard let self = self else { return }
            
            guard
                error == nil
            else {
                self.delegate?.didDataFetchProcessFinish(false)
                return
            }
            //data
            guard let data = data else {
                self.delegate?.didDataFetchProcessFinish(false)
                return
            }
            
            do{
                let jsonDecoder = JSONDecoder()
                self.images = try jsonDecoder.decode([Image].self, from: data)
                self.delegate?.didDataFetchProcessFinish(true)
            }catch {
                self.delegate?.didDataFetchProcessFinish(false)
            }
        }
        task.resume()
        
        
        
    }
}
