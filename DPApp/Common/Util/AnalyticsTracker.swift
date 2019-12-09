class AnalyticsTracker {

    @Dependency(provider.register)
    private var httpClient: HttpClient


    func trackEvent(name: String) -> String {
        if httpClient.request() {
            return "Event tracked =\(name)"
        }
        return "Error"
    }

}
