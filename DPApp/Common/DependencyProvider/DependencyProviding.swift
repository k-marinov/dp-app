protocol DependencyProviding { //}: ServiceProviding, UtilityProviding {

    func register<SERVICE: Service>() -> SERVICE

    func register() -> AnalyticsTracker

    func register() -> HttpClient

}
