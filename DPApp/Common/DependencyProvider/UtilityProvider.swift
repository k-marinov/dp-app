class UtilityProvider {

    private var utilities: [String: Any] = [String: Any]()

    func register(provider: DependencyProviding) -> AnalyticsTracker {
        let key = "\(AnalyticsTracker.self)"
        if utilities[key] == nil {
            let tracker = AnalyticsTracker(provider: provider)
            utilities[key] = tracker
            return tracker
        }
        return utilities[key] as! AnalyticsTracker
    }

    func register() -> HttpClient {
        let key = "\(HttpClient.self)"
        if utilities[key] == nil {
            let client = HttpClient()
            utilities[key] = client
            return client
        }
        return utilities[key] as! HttpClient
    }

}
