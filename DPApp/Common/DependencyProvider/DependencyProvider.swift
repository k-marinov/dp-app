class DependencyProvider: DependencyProviding {

    private let serviceProvider = ServiceProvider()
    private let utilityProvider = UtilityProvider()
    
    
    func register<SERVICE: Service>() -> SERVICE {
        print("created service =\(SERVICE.self)")
        return serviceProvider.register()
    }

    func register() -> AnalyticsTracker {
        return utilityProvider.register()
    }

    func register() -> HttpClient {
        return utilityProvider.register()
    }

}
