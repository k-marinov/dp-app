
class FriendService: Service {

    @Dependency(provider.register)
    private var httpClient: HttpClient

    required init() {}

    
    func findAllFriends() -> [String] {
        if httpClient.request() {
            return ["Phil", "Dimebag", "Vinnie", "Rex"]
        }
        return [String]()
    }

}
