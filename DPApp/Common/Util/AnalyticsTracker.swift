class AnalyticsTracker {

    private var httpClient: HttpClient

    init(provider: DependencyProviding) {
        httpClient = provider.register()
    }

    func trackEvent(name: String) -> String {
        if httpClient.request() {
            return "Event tracked =\(name)"
        }
        return "Error"
    }

}
