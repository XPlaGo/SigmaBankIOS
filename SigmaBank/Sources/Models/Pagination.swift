struct PaginationModel {

    let pageToken: String

    let pageSize: Int
    
    init(pageToken: String, pageSize: Int) {
        self.pageToken = pageToken
        self.pageSize = pageSize
    }
}
