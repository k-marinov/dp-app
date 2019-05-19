# DI App

## Developer Prerequisites

### macOS Mojave

10.14

### Xcode

Xcode Version 10.1 (10B61)

### Swift

Apple Swift version 4.2.1 (swiftlang-1000.11.42 clang-1000.11.45.1)


### Quick Start Guide 

```git clone https://github.com/k-marinov/dp-app.git```

```cd dp-app```

```open DPApp.xcodeproj```

```CMD + R```


## Dependency Injection with Single Instance Services by using Service Locator Pattern

This project is a new take on the on the previous Dependency Injection project https://github.com/k-marinov/di-app.git

But in this flavour of the dependency provider, services or dependencies are registered once and added to a dictionary where migh be available 
for other classes via dependency provider.

### DependencyProvider 
Lazily initialized once and passed to the view models or other services. Owns ServiceProvider and UtilityProvider classes
conforms to DepedencyProviding protocol

### DepedencyProviding
This protocol extends ServiceProviding UtilityProviding protocols

### ServiceProvider
Registers a new service and adds the instance to the internal dictionary, on the second register call returns existing service instance.

### UtilityProvider
Registers a new utility class and adds the instance to the internal dictionary, on the second register call returns existing instance.
UtilityProvider can be anything like HttpClient, AnalyticsTracker or any other helper or utility class, where might want to provide with depedency provider.


