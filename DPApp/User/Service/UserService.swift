class UserService: Service {

    private let tracker: AnalyticsTracker
    private let httpClient: HttpClient
    private(set) var configuration: String = ""

    convenience init(provider: DependencyProviding, configuration: String = "DefaultConfiguration") {
        self.init(provider: provider)
        self.configuration = configuration
    }

    required init(provider: DependencyProviding) {
        tracker = provider.register(provider: provider)
        httpClient = provider.register()
    }

    func name() -> String {
        return "Deckard"
    }

    func age() -> Int {
        return 40
    }

    func sendMessage() -> String {
        if httpClient.request() {
            _ = tracker.trackEvent(name: "Message sent")
            return "Message sent"
        }
        return "Error sending message"
    }

}
