import Foundation

protocol PostListModelProtocol: AnyObject { //modelden gelen data view modele aktarılacak
    func didDataFetchProgressFinish(_ isSuccess: Bool) //get , post for all data
}

class PostListModel{
    
    weak var delegate: PostListModelProtocol?
    
    var posts: [Post] = []
//    post hold data
    
    func fetchData(){
//        TODO: /data çekme işlemi yapılacak
//       make url request
        
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts") else{
            delegate?.didDataFetchProgressFinish(false)
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
                self.delegate?.didDataFetchProgressFinish(false)
                return
            }
            //data
            guard let data = data else {
                self.delegate?.didDataFetchProgressFinish(false)
                return
            }
            
            do{
                let jsonDecoder = JSONDecoder()
                self.posts = try jsonDecoder.decode([Post].self, from: data)
                self.delegate?.didDataFetchProgressFinish(true)
            }catch {
                self.delegate?.didDataFetchProgressFinish(false)
            }
        }
        task.resume()
        
    }
}
