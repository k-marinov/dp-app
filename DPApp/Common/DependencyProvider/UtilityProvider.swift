class UtilityProvider { //}: UtilityProviding {

    private var instances = [String: Any]()


    func register() -> AnalyticsTracker {
        let key = "\(AnalyticsTracker.self)"
        guard let tracker = instances[key] as? AnalyticsTracker else {
            let tracker = AnalyticsTracker()
            instances[key] = tracker
            return tracker
        }
        return tracker
    }

    func register() -> HttpClient {
        let key = "\(HttpClient.self)"
        guard let client = instances[key] as? HttpClient else {
            let client = HttpClient()
            instances[key] = client
            return client
        }
        return client
    }

}
