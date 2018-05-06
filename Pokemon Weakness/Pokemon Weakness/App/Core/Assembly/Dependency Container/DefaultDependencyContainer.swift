//
//  DefaultDependencyContainer.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 17/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import Foundation

private class DefaultDependencyContainer: DependencyContainer {
    
    fileprivate static let container = DefaultDependencyContainer()
    fileprivate var serviceInstances = [String: AnyObject]()
    
    fileprivate init() {}
    
    func register(_ key: String, instance: AnyObject) {
        serviceInstances[key] = instance
    }
    
    func get(_ key: String) -> AnyObject? {
        return serviceInstances[key]
    }
    
    func remove(_ key: String) {
        serviceInstances.removeValue(forKey: key)
    }
    
    func removeAll() {
        serviceInstances.removeAll()
    }
}

/**
 Returns the default dependency container
 */
func Container() -> DependencyContainer {
    return DefaultDependencyContainer.container
}

/**
 Register and save instance of an object
 
 - parameter service: service instance to register/locate
 - parameter key:     an key identifier
 
 - returns: returns a cached instance of the service
 */
func Register<T>(_ service: T, key: String) -> T where T: AnyObject {
    
    if let service = Container().get(key) {
        assertionFailure("Dependency is already registered \(service) -> \(key)")
    }
    
    DefaultDependencyContainer.container.register(key, instance: service)
    
    return service
}

/**
 Try to resolve an instance from the container
 
 - parameter key: instance key identifier
 
 - returns: wether the instance is registered
 */
func Resolve<T>(_ key: String) -> T? where T: AnyObject {
    return Container().get(key) as? T
}
