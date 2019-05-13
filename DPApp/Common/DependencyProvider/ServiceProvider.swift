
class ServiceProvider {

    private var services: [String: Service] = [String: Service]()

    func register<SERVICE: Service>(provider: DependencyProviding) -> SERVICE {
        let key: String = "\(SERVICE.self)"
        if services[key] == nil {
            let service = SERVICE(provider: provider)
            services[key] = service
            return service
        }
        return services[key] as! SERVICE
    }

}
