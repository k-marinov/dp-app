class UserService: Service {

    @Dependency(provider.register)
    private var tracker: AnalyticsTracker
    
    @Dependency(provider.register)
    private var httpClient: HttpClient

    private(set) var configuration: String = ""

    convenience init(configuration: String = "DefaultConfiguration") {
        self.init()
        self.configuration = configuration
    }

    required init() {
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
