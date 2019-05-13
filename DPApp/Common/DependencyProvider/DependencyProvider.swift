class DependencyProvider: DependencyProviding {

    private let serviceProvider = ServiceProvider()
    private let utilityProvider = UtilityProvider()
    
    func register<SERVICE: Service>(provider: DependencyProviding) -> SERVICE {
        return serviceProvider.register(provider: provider)
    }

    func register(provider: DependencyProviding) -> AnalyticsTracker {
        return utilityProvider.register(provider: provider)
    }

    func register() -> HttpClient {
        return utilityProvider.register()
    }

}
