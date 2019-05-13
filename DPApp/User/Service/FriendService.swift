
class FriendService: Service {

    private let httpClient: HttpClient

    required init(provider: DependencyProviding) {
        httpClient = provider.register()
    }

    func findAllFriends() -> [String] {
        if httpClient.request() {
            return ["Phil", "Dimebag", "Vinnie", "Rex"]
        }
        return [String]()
    }

}
