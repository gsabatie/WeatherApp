// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



// Generated with SwiftyMocky 3.5.0

import SwiftyMocky
#if !MockyCustom
import XCTest
#endif
import UIKit
import MapKit
import CoreLocation
@testable import WeatherApp


// MARK: - AddressFinderService
open class AddressFinderServiceMock: AddressFinderService, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func searchLocationFrom(        address: String,        completion: @escaping (_ location: CLLocation?, _ error: Error?) -> ()) {
        addInvocation(.m_searchLocationFrom__address_addresscompletion_completion(Parameter<String>.value(`address`), Parameter<(_ location: CLLocation?, _ error: Error?) -> ()>.value(`completion`)))
		let perform = methodPerformValue(.m_searchLocationFrom__address_addresscompletion_completion(Parameter<String>.value(`address`), Parameter<(_ location: CLLocation?, _ error: Error?) -> ()>.value(`completion`))) as? (String, @escaping (_ location: CLLocation?, _ error: Error?) -> ()) -> Void
		perform?(`address`, `completion`)
    }

    open func searchLocalityFrom(        location: CLLocation,        completion: @escaping (_ addresse: String?, _ error: Error?) -> ()) {
        addInvocation(.m_searchLocalityFrom__location_locationcompletion_completion(Parameter<CLLocation>.value(`location`), Parameter<(_ addresse: String?, _ error: Error?) -> ()>.value(`completion`)))
		let perform = methodPerformValue(.m_searchLocalityFrom__location_locationcompletion_completion(Parameter<CLLocation>.value(`location`), Parameter<(_ addresse: String?, _ error: Error?) -> ()>.value(`completion`))) as? (CLLocation, @escaping (_ addresse: String?, _ error: Error?) -> ()) -> Void
		perform?(`location`, `completion`)
    }

    open func searchLocationfrom(        localSearchCompletion: MKLocalSearchCompletion,        completion: @escaping (_ location: CLLocation?, _ error: Error?) -> ()) {
        addInvocation(.m_searchLocationfrom__localSearchCompletion_localSearchCompletioncompletion_completion(Parameter<MKLocalSearchCompletion>.value(`localSearchCompletion`), Parameter<(_ location: CLLocation?, _ error: Error?) -> ()>.value(`completion`)))
		let perform = methodPerformValue(.m_searchLocationfrom__localSearchCompletion_localSearchCompletioncompletion_completion(Parameter<MKLocalSearchCompletion>.value(`localSearchCompletion`), Parameter<(_ location: CLLocation?, _ error: Error?) -> ()>.value(`completion`))) as? (MKLocalSearchCompletion, @escaping (_ location: CLLocation?, _ error: Error?) -> ()) -> Void
		perform?(`localSearchCompletion`, `completion`)
    }

    open func autoComplete(          locality: String,          completion: @escaping (_ addresses: [MKLocalSearchCompletion]?, _ error: Error?) -> ()) {
        addInvocation(.m_autoComplete__locality_localitycompletion_completion(Parameter<String>.value(`locality`), Parameter<(_ addresses: [MKLocalSearchCompletion]?, _ error: Error?) -> ()>.value(`completion`)))
		let perform = methodPerformValue(.m_autoComplete__locality_localitycompletion_completion(Parameter<String>.value(`locality`), Parameter<(_ addresses: [MKLocalSearchCompletion]?, _ error: Error?) -> ()>.value(`completion`))) as? (String, @escaping (_ addresses: [MKLocalSearchCompletion]?, _ error: Error?) -> ()) -> Void
		perform?(`locality`, `completion`)
    }


    fileprivate enum MethodType {
        case m_searchLocationFrom__address_addresscompletion_completion(Parameter<String>, Parameter<(_ location: CLLocation?, _ error: Error?) -> ()>)
        case m_searchLocalityFrom__location_locationcompletion_completion(Parameter<CLLocation>, Parameter<(_ addresse: String?, _ error: Error?) -> ()>)
        case m_searchLocationfrom__localSearchCompletion_localSearchCompletioncompletion_completion(Parameter<MKLocalSearchCompletion>, Parameter<(_ location: CLLocation?, _ error: Error?) -> ()>)
        case m_autoComplete__locality_localitycompletion_completion(Parameter<String>, Parameter<(_ addresses: [MKLocalSearchCompletion]?, _ error: Error?) -> ()>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_searchLocationFrom__address_addresscompletion_completion(let lhsAddress, let lhsCompletion), .m_searchLocationFrom__address_addresscompletion_completion(let rhsAddress, let rhsCompletion)):
                guard Parameter.compare(lhs: lhsAddress, rhs: rhsAddress, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            case (.m_searchLocalityFrom__location_locationcompletion_completion(let lhsLocation, let lhsCompletion), .m_searchLocalityFrom__location_locationcompletion_completion(let rhsLocation, let rhsCompletion)):
                guard Parameter.compare(lhs: lhsLocation, rhs: rhsLocation, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            case (.m_searchLocationfrom__localSearchCompletion_localSearchCompletioncompletion_completion(let lhsLocalsearchcompletion, let lhsCompletion), .m_searchLocationfrom__localSearchCompletion_localSearchCompletioncompletion_completion(let rhsLocalsearchcompletion, let rhsCompletion)):
                guard Parameter.compare(lhs: lhsLocalsearchcompletion, rhs: rhsLocalsearchcompletion, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            case (.m_autoComplete__locality_localitycompletion_completion(let lhsLocality, let lhsCompletion), .m_autoComplete__locality_localitycompletion_completion(let rhsLocality, let rhsCompletion)):
                guard Parameter.compare(lhs: lhsLocality, rhs: rhsLocality, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_searchLocationFrom__address_addresscompletion_completion(p0, p1): return p0.intValue + p1.intValue
            case let .m_searchLocalityFrom__location_locationcompletion_completion(p0, p1): return p0.intValue + p1.intValue
            case let .m_searchLocationfrom__localSearchCompletion_localSearchCompletioncompletion_completion(p0, p1): return p0.intValue + p1.intValue
            case let .m_autoComplete__locality_localitycompletion_completion(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func searchLocationFrom(address: Parameter<String>, completion: Parameter<(_ location: CLLocation?, _ error: Error?) -> ()>) -> Verify { return Verify(method: .m_searchLocationFrom__address_addresscompletion_completion(`address`, `completion`))}
        public static func searchLocalityFrom(location: Parameter<CLLocation>, completion: Parameter<(_ addresse: String?, _ error: Error?) -> ()>) -> Verify { return Verify(method: .m_searchLocalityFrom__location_locationcompletion_completion(`location`, `completion`))}
        public static func searchLocationfrom(localSearchCompletion: Parameter<MKLocalSearchCompletion>, completion: Parameter<(_ location: CLLocation?, _ error: Error?) -> ()>) -> Verify { return Verify(method: .m_searchLocationfrom__localSearchCompletion_localSearchCompletioncompletion_completion(`localSearchCompletion`, `completion`))}
        public static func autoComplete(locality: Parameter<String>, completion: Parameter<(_ addresses: [MKLocalSearchCompletion]?, _ error: Error?) -> ()>) -> Verify { return Verify(method: .m_autoComplete__locality_localitycompletion_completion(`locality`, `completion`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func searchLocationFrom(address: Parameter<String>, completion: Parameter<(_ location: CLLocation?, _ error: Error?) -> ()>, perform: @escaping (String, @escaping (_ location: CLLocation?, _ error: Error?) -> ()) -> Void) -> Perform {
            return Perform(method: .m_searchLocationFrom__address_addresscompletion_completion(`address`, `completion`), performs: perform)
        }
        public static func searchLocalityFrom(location: Parameter<CLLocation>, completion: Parameter<(_ addresse: String?, _ error: Error?) -> ()>, perform: @escaping (CLLocation, @escaping (_ addresse: String?, _ error: Error?) -> ()) -> Void) -> Perform {
            return Perform(method: .m_searchLocalityFrom__location_locationcompletion_completion(`location`, `completion`), performs: perform)
        }
        public static func searchLocationfrom(localSearchCompletion: Parameter<MKLocalSearchCompletion>, completion: Parameter<(_ location: CLLocation?, _ error: Error?) -> ()>, perform: @escaping (MKLocalSearchCompletion, @escaping (_ location: CLLocation?, _ error: Error?) -> ()) -> Void) -> Perform {
            return Perform(method: .m_searchLocationfrom__localSearchCompletion_localSearchCompletioncompletion_completion(`localSearchCompletion`, `completion`), performs: perform)
        }
        public static func autoComplete(locality: Parameter<String>, completion: Parameter<(_ addresses: [MKLocalSearchCompletion]?, _ error: Error?) -> ()>, perform: @escaping (String, @escaping (_ addresses: [MKLocalSearchCompletion]?, _ error: Error?) -> ()) -> Void) -> Perform {
            return Perform(method: .m_autoComplete__locality_localitycompletion_completion(`locality`, `completion`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - DatabaseSerive
open class DatabaseSeriveMock: DatabaseSerive, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func save(forecast: Forecast) {
        addInvocation(.m_save__forecast_forecast(Parameter<Forecast>.value(`forecast`)))
		let perform = methodPerformValue(.m_save__forecast_forecast(Parameter<Forecast>.value(`forecast`))) as? (Forecast) -> Void
		perform?(`forecast`)
    }

    open func getLatestForecast() -> Forecast? {
        addInvocation(.m_getLatestForecast)
		let perform = methodPerformValue(.m_getLatestForecast) as? () -> Void
		perform?()
		var __value: Forecast? = nil
		do {
		    __value = try methodReturnValue(.m_getLatestForecast).casted()
		} catch {
			// do nothing
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_save__forecast_forecast(Parameter<Forecast>)
        case m_getLatestForecast

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_save__forecast_forecast(let lhsForecast), .m_save__forecast_forecast(let rhsForecast)):
                guard Parameter.compare(lhs: lhsForecast, rhs: rhsForecast, with: matcher) else { return false } 
                return true 
            case (.m_getLatestForecast, .m_getLatestForecast):
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_save__forecast_forecast(p0): return p0.intValue
            case .m_getLatestForecast: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getLatestForecast(willReturn: Forecast?...) -> MethodStub {
            return Given(method: .m_getLatestForecast, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getLatestForecast(willProduce: (Stubber<Forecast?>) -> Void) -> MethodStub {
            let willReturn: [Forecast?] = []
			let given: Given = { return Given(method: .m_getLatestForecast, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Forecast?).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func save(forecast: Parameter<Forecast>) -> Verify { return Verify(method: .m_save__forecast_forecast(`forecast`))}
        public static func getLatestForecast() -> Verify { return Verify(method: .m_getLatestForecast)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func save(forecast: Parameter<Forecast>, perform: @escaping (Forecast) -> Void) -> Perform {
            return Perform(method: .m_save__forecast_forecast(`forecast`), performs: perform)
        }
        public static func getLatestForecast(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getLatestForecast, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - WeatherInteractorOutputProtocol
open class WeatherInteractorOutputProtocolMock: WeatherInteractorOutputProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }






    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - WeatherPresentationProtocol
open class WeatherPresentationProtocolMock: WeatherPresentationProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func presentWeatherFromCurrentLocation() {
        addInvocation(.m_presentWeatherFromCurrentLocation)
		let perform = methodPerformValue(.m_presentWeatherFromCurrentLocation) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_presentWeatherFromCurrentLocation

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_presentWeatherFromCurrentLocation, .m_presentWeatherFromCurrentLocation):
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_presentWeatherFromCurrentLocation: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func presentWeatherFromCurrentLocation() -> Verify { return Verify(method: .m_presentWeatherFromCurrentLocation)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func presentWeatherFromCurrentLocation(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_presentWeatherFromCurrentLocation, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - WeatherRouterProtocol
open class WeatherRouterProtocolMock: WeatherRouterProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func present(from viewController:UIViewController) {
        addInvocation(.m_present__from_viewController(Parameter<UIViewController>.value(`viewController`)))
		let perform = methodPerformValue(.m_present__from_viewController(Parameter<UIViewController>.value(`viewController`))) as? (UIViewController) -> Void
		perform?(`viewController`)
    }


    fileprivate enum MethodType {
        case m_present__from_viewController(Parameter<UIViewController>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_present__from_viewController(let lhsViewcontroller), .m_present__from_viewController(let rhsViewcontroller)):
                guard Parameter.compare(lhs: lhsViewcontroller, rhs: rhsViewcontroller, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_present__from_viewController(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func present(from viewController: Parameter<UIViewController>) -> Verify { return Verify(method: .m_present__from_viewController(`viewController`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func present(from viewController: Parameter<UIViewController>, perform: @escaping (UIViewController) -> Void) -> Perform {
            return Perform(method: .m_present__from_viewController(`viewController`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - WeatherService
open class WeatherServiceMock: WeatherService, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getForecast(        location: CLLocation,        time: Date?,        completion: @escaping (_ response: ForecastRequestResponse?, _ error: Error?) -> ()    ) {
        addInvocation(.m_getForecast__location_locationtime_timecompletion_completion(Parameter<CLLocation>.value(`location`), Parameter<Date?>.value(`time`), Parameter<(_ response: ForecastRequestResponse?, _ error: Error?) -> ()>.value(`completion`)))
		let perform = methodPerformValue(.m_getForecast__location_locationtime_timecompletion_completion(Parameter<CLLocation>.value(`location`), Parameter<Date?>.value(`time`), Parameter<(_ response: ForecastRequestResponse?, _ error: Error?) -> ()>.value(`completion`))) as? (CLLocation, Date?, @escaping (_ response: ForecastRequestResponse?, _ error: Error?) -> ()) -> Void
		perform?(`location`, `time`, `completion`)
    }


    fileprivate enum MethodType {
        case m_getForecast__location_locationtime_timecompletion_completion(Parameter<CLLocation>, Parameter<Date?>, Parameter<(_ response: ForecastRequestResponse?, _ error: Error?) -> ()>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_getForecast__location_locationtime_timecompletion_completion(let lhsLocation, let lhsTime, let lhsCompletion), .m_getForecast__location_locationtime_timecompletion_completion(let rhsLocation, let rhsTime, let rhsCompletion)):
                guard Parameter.compare(lhs: lhsLocation, rhs: rhsLocation, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsTime, rhs: rhsTime, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getForecast__location_locationtime_timecompletion_completion(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getForecast(location: Parameter<CLLocation>, time: Parameter<Date?>, completion: Parameter<(_ response: ForecastRequestResponse?, _ error: Error?) -> ()>) -> Verify { return Verify(method: .m_getForecast__location_locationtime_timecompletion_completion(`location`, `time`, `completion`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getForecast(location: Parameter<CLLocation>, time: Parameter<Date?>, completion: Parameter<(_ response: ForecastRequestResponse?, _ error: Error?) -> ()>, perform: @escaping (CLLocation, Date?, @escaping (_ response: ForecastRequestResponse?, _ error: Error?) -> ()) -> Void) -> Perform {
            return Perform(method: .m_getForecast__location_locationtime_timecompletion_completion(`location`, `time`, `completion`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - WeatherUseCaseProtocol
open class WeatherUseCaseProtocolMock: WeatherUseCaseProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getMatchedLocalitiesFrom(text: String, completion: @escaping AutoCompletionBlock) {
        addInvocation(.m_getMatchedLocalitiesFrom__text_textcompletion_completion(Parameter<String>.value(`text`), Parameter<AutoCompletionBlock>.any))
		let perform = methodPerformValue(.m_getMatchedLocalitiesFrom__text_textcompletion_completion(Parameter<String>.value(`text`), Parameter<AutoCompletionBlock>.any)) as? (String, @escaping AutoCompletionBlock) -> Void
		perform?(`text`, `completion`)
    }

    open func getStoredForecast() -> Forecast? {
        addInvocation(.m_getStoredForecast)
		let perform = methodPerformValue(.m_getStoredForecast) as? () -> Void
		perform?()
		var __value: Forecast? = nil
		do {
		    __value = try methodReturnValue(.m_getStoredForecast).casted()
		} catch {
			// do nothing
		}
		return __value
    }

    open func getForecast(        localSearchCompletion: MKLocalSearchCompletion,        completion: @escaping ForecastBlock) {
        addInvocation(.m_getForecast__localSearchCompletion_localSearchCompletioncompletion_completion(Parameter<MKLocalSearchCompletion>.value(`localSearchCompletion`), Parameter<ForecastBlock>.any))
		let perform = methodPerformValue(.m_getForecast__localSearchCompletion_localSearchCompletioncompletion_completion(Parameter<MKLocalSearchCompletion>.value(`localSearchCompletion`), Parameter<ForecastBlock>.any)) as? (MKLocalSearchCompletion, @escaping ForecastBlock) -> Void
		perform?(`localSearchCompletion`, `completion`)
    }

    open func getLatestForecast(completion: @escaping ForecastBlock) {
        addInvocation(.m_getLatestForecast__completion_completion(Parameter<ForecastBlock>.any))
		let perform = methodPerformValue(.m_getLatestForecast__completion_completion(Parameter<ForecastBlock>.any)) as? (@escaping ForecastBlock) -> Void
		perform?(`completion`)
    }

    open func getForecast(locality: String, completion: @escaping ForecastBlock) {
        addInvocation(.m_getForecast__locality_localitycompletion_completion(Parameter<String>.value(`locality`), Parameter<ForecastBlock>.any))
		let perform = methodPerformValue(.m_getForecast__locality_localitycompletion_completion(Parameter<String>.value(`locality`), Parameter<ForecastBlock>.any)) as? (String, @escaping ForecastBlock) -> Void
		perform?(`locality`, `completion`)
    }

    open func getForecast(location: CLLocation, completion: @escaping ForecastBlock) {
        addInvocation(.m_getForecast__location_locationcompletion_completion(Parameter<CLLocation>.value(`location`), Parameter<ForecastBlock>.any))
		let perform = methodPerformValue(.m_getForecast__location_locationcompletion_completion(Parameter<CLLocation>.value(`location`), Parameter<ForecastBlock>.any)) as? (CLLocation, @escaping ForecastBlock) -> Void
		perform?(`location`, `completion`)
    }


    fileprivate enum MethodType {
        case m_getMatchedLocalitiesFrom__text_textcompletion_completion(Parameter<String>, Parameter<AutoCompletionBlock>)
        case m_getStoredForecast
        case m_getForecast__localSearchCompletion_localSearchCompletioncompletion_completion(Parameter<MKLocalSearchCompletion>, Parameter<ForecastBlock>)
        case m_getLatestForecast__completion_completion(Parameter<ForecastBlock>)
        case m_getForecast__locality_localitycompletion_completion(Parameter<String>, Parameter<ForecastBlock>)
        case m_getForecast__location_locationcompletion_completion(Parameter<CLLocation>, Parameter<ForecastBlock>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_getMatchedLocalitiesFrom__text_textcompletion_completion(let lhsText, let lhsCompletion), .m_getMatchedLocalitiesFrom__text_textcompletion_completion(let rhsText, let rhsCompletion)):
                guard Parameter.compare(lhs: lhsText, rhs: rhsText, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            case (.m_getStoredForecast, .m_getStoredForecast):
                return true 
            case (.m_getForecast__localSearchCompletion_localSearchCompletioncompletion_completion(let lhsLocalsearchcompletion, let lhsCompletion), .m_getForecast__localSearchCompletion_localSearchCompletioncompletion_completion(let rhsLocalsearchcompletion, let rhsCompletion)):
                guard Parameter.compare(lhs: lhsLocalsearchcompletion, rhs: rhsLocalsearchcompletion, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            case (.m_getLatestForecast__completion_completion(let lhsCompletion), .m_getLatestForecast__completion_completion(let rhsCompletion)):
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            case (.m_getForecast__locality_localitycompletion_completion(let lhsLocality, let lhsCompletion), .m_getForecast__locality_localitycompletion_completion(let rhsLocality, let rhsCompletion)):
                guard Parameter.compare(lhs: lhsLocality, rhs: rhsLocality, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            case (.m_getForecast__location_locationcompletion_completion(let lhsLocation, let lhsCompletion), .m_getForecast__location_locationcompletion_completion(let rhsLocation, let rhsCompletion)):
                guard Parameter.compare(lhs: lhsLocation, rhs: rhsLocation, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getMatchedLocalitiesFrom__text_textcompletion_completion(p0, p1): return p0.intValue + p1.intValue
            case .m_getStoredForecast: return 0
            case let .m_getForecast__localSearchCompletion_localSearchCompletioncompletion_completion(p0, p1): return p0.intValue + p1.intValue
            case let .m_getLatestForecast__completion_completion(p0): return p0.intValue
            case let .m_getForecast__locality_localitycompletion_completion(p0, p1): return p0.intValue + p1.intValue
            case let .m_getForecast__location_locationcompletion_completion(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getStoredForecast(willReturn: Forecast?...) -> MethodStub {
            return Given(method: .m_getStoredForecast, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getStoredForecast(willProduce: (Stubber<Forecast?>) -> Void) -> MethodStub {
            let willReturn: [Forecast?] = []
			let given: Given = { return Given(method: .m_getStoredForecast, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Forecast?).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getMatchedLocalitiesFrom(text: Parameter<String>, completion: Parameter<AutoCompletionBlock>) -> Verify { return Verify(method: .m_getMatchedLocalitiesFrom__text_textcompletion_completion(`text`, `completion`))}
        public static func getStoredForecast() -> Verify { return Verify(method: .m_getStoredForecast)}
        public static func getForecast(localSearchCompletion: Parameter<MKLocalSearchCompletion>, completion: Parameter<ForecastBlock>) -> Verify { return Verify(method: .m_getForecast__localSearchCompletion_localSearchCompletioncompletion_completion(`localSearchCompletion`, `completion`))}
        public static func getLatestForecast(completion: Parameter<ForecastBlock>) -> Verify { return Verify(method: .m_getLatestForecast__completion_completion(`completion`))}
        public static func getForecast(locality: Parameter<String>, completion: Parameter<ForecastBlock>) -> Verify { return Verify(method: .m_getForecast__locality_localitycompletion_completion(`locality`, `completion`))}
        public static func getForecast(location: Parameter<CLLocation>, completion: Parameter<ForecastBlock>) -> Verify { return Verify(method: .m_getForecast__location_locationcompletion_completion(`location`, `completion`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getMatchedLocalitiesFrom(text: Parameter<String>, completion: Parameter<AutoCompletionBlock>, perform: @escaping (String, @escaping AutoCompletionBlock) -> Void) -> Perform {
            return Perform(method: .m_getMatchedLocalitiesFrom__text_textcompletion_completion(`text`, `completion`), performs: perform)
        }
        public static func getStoredForecast(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getStoredForecast, performs: perform)
        }
        public static func getForecast(localSearchCompletion: Parameter<MKLocalSearchCompletion>, completion: Parameter<ForecastBlock>, perform: @escaping (MKLocalSearchCompletion, @escaping ForecastBlock) -> Void) -> Perform {
            return Perform(method: .m_getForecast__localSearchCompletion_localSearchCompletioncompletion_completion(`localSearchCompletion`, `completion`), performs: perform)
        }
        public static func getLatestForecast(completion: Parameter<ForecastBlock>, perform: @escaping (@escaping ForecastBlock) -> Void) -> Perform {
            return Perform(method: .m_getLatestForecast__completion_completion(`completion`), performs: perform)
        }
        public static func getForecast(locality: Parameter<String>, completion: Parameter<ForecastBlock>, perform: @escaping (String, @escaping ForecastBlock) -> Void) -> Perform {
            return Perform(method: .m_getForecast__locality_localitycompletion_completion(`locality`, `completion`), performs: perform)
        }
        public static func getForecast(location: Parameter<CLLocation>, completion: Parameter<ForecastBlock>, perform: @escaping (CLLocation, @escaping ForecastBlock) -> Void) -> Perform {
            return Perform(method: .m_getForecast__location_locationcompletion_completion(`location`, `completion`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - WeatherViewEventResponderProtocol
open class WeatherViewEventResponderProtocolMock: WeatherViewEventResponderProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func viewDidLoad() {
        addInvocation(.m_viewDidLoad)
		let perform = methodPerformValue(.m_viewDidLoad) as? () -> Void
		perform?()
    }

    open func viewWillAppear() {
        addInvocation(.m_viewWillAppear)
		let perform = methodPerformValue(.m_viewWillAppear) as? () -> Void
		perform?()
    }

    open func searchLocality(text: String) {
        addInvocation(.m_searchLocality__text_text(Parameter<String>.value(`text`)))
		let perform = methodPerformValue(.m_searchLocality__text_text(Parameter<String>.value(`text`))) as? (String) -> Void
		perform?(`text`)
    }

    open func didSelect(        _ searchResultTableViewController: SearchResultTableViewController,        localSearchCompletion: MKLocalSearchCompletion) {
        addInvocation(.m_didSelect__searchResultTableViewControllerlocalSearchCompletion_localSearchCompletion(Parameter<SearchResultTableViewController>.value(`searchResultTableViewController`), Parameter<MKLocalSearchCompletion>.value(`localSearchCompletion`)))
		let perform = methodPerformValue(.m_didSelect__searchResultTableViewControllerlocalSearchCompletion_localSearchCompletion(Parameter<SearchResultTableViewController>.value(`searchResultTableViewController`), Parameter<MKLocalSearchCompletion>.value(`localSearchCompletion`))) as? (SearchResultTableViewController, MKLocalSearchCompletion) -> Void
		perform?(`searchResultTableViewController`, `localSearchCompletion`)
    }


    fileprivate enum MethodType {
        case m_viewDidLoad
        case m_viewWillAppear
        case m_searchLocality__text_text(Parameter<String>)
        case m_didSelect__searchResultTableViewControllerlocalSearchCompletion_localSearchCompletion(Parameter<SearchResultTableViewController>, Parameter<MKLocalSearchCompletion>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_viewDidLoad, .m_viewDidLoad):
                return true 
            case (.m_viewWillAppear, .m_viewWillAppear):
                return true 
            case (.m_searchLocality__text_text(let lhsText), .m_searchLocality__text_text(let rhsText)):
                guard Parameter.compare(lhs: lhsText, rhs: rhsText, with: matcher) else { return false } 
                return true 
            case (.m_didSelect__searchResultTableViewControllerlocalSearchCompletion_localSearchCompletion(let lhsSearchresulttableviewcontroller, let lhsLocalsearchcompletion), .m_didSelect__searchResultTableViewControllerlocalSearchCompletion_localSearchCompletion(let rhsSearchresulttableviewcontroller, let rhsLocalsearchcompletion)):
                guard Parameter.compare(lhs: lhsSearchresulttableviewcontroller, rhs: rhsSearchresulttableviewcontroller, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsLocalsearchcompletion, rhs: rhsLocalsearchcompletion, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_viewDidLoad: return 0
            case .m_viewWillAppear: return 0
            case let .m_searchLocality__text_text(p0): return p0.intValue
            case let .m_didSelect__searchResultTableViewControllerlocalSearchCompletion_localSearchCompletion(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func viewDidLoad() -> Verify { return Verify(method: .m_viewDidLoad)}
        public static func viewWillAppear() -> Verify { return Verify(method: .m_viewWillAppear)}
        public static func searchLocality(text: Parameter<String>) -> Verify { return Verify(method: .m_searchLocality__text_text(`text`))}
        public static func didSelect(_ searchResultTableViewController: Parameter<SearchResultTableViewController>, localSearchCompletion: Parameter<MKLocalSearchCompletion>) -> Verify { return Verify(method: .m_didSelect__searchResultTableViewControllerlocalSearchCompletion_localSearchCompletion(`searchResultTableViewController`, `localSearchCompletion`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_viewDidLoad, performs: perform)
        }
        public static func viewWillAppear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_viewWillAppear, performs: perform)
        }
        public static func searchLocality(text: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_searchLocality__text_text(`text`), performs: perform)
        }
        public static func didSelect(_ searchResultTableViewController: Parameter<SearchResultTableViewController>, localSearchCompletion: Parameter<MKLocalSearchCompletion>, perform: @escaping (SearchResultTableViewController, MKLocalSearchCompletion) -> Void) -> Perform {
            return Perform(method: .m_didSelect__searchResultTableViewControllerlocalSearchCompletion_localSearchCompletion(`searchResultTableViewController`, `localSearchCompletion`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - WeatherViewProtocol
open class WeatherViewProtocolMock: WeatherViewProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var output: WeatherViewEventResponderProtocol? {
		get {	invocations.append(.p_output_get); return __p_output ?? optionalGivenGetterValue(.p_output_get, "WeatherViewProtocolMock - stub value for output was not defined") }
		set {	invocations.append(.p_output_set(.value(newValue))); __p_output = newValue }
	}
	private var __p_output: (WeatherViewEventResponderProtocol)?

    public var forecast: Forecast? {
		get {	invocations.append(.p_forecast_get); return __p_forecast ?? optionalGivenGetterValue(.p_forecast_get, "WeatherViewProtocolMock - stub value for forecast was not defined") }
		set {	invocations.append(.p_forecast_set(.value(newValue))); __p_forecast = newValue }
	}
	private var __p_forecast: (Forecast)?

    public var matchedAddresses: [MKLocalSearchCompletion]? {
		get {	invocations.append(.p_matchedAddresses_get); return __p_matchedAddresses ?? optionalGivenGetterValue(.p_matchedAddresses_get, "WeatherViewProtocolMock - stub value for matchedAddresses was not defined") }
		set {	invocations.append(.p_matchedAddresses_set(.value(newValue))); __p_matchedAddresses = newValue }
	}
	private var __p_matchedAddresses: ([MKLocalSearchCompletion])?

    public var isLoading: Bool {
		get {	invocations.append(.p_isLoading_get); return __p_isLoading ?? givenGetterValue(.p_isLoading_get, "WeatherViewProtocolMock - stub value for isLoading was not defined") }
		set {	invocations.append(.p_isLoading_set(.value(newValue))); __p_isLoading = newValue }
	}
	private var __p_isLoading: (Bool)?





    open func display(errorMessage: String) {
        addInvocation(.m_display__errorMessage_errorMessage(Parameter<String>.value(`errorMessage`)))
		let perform = methodPerformValue(.m_display__errorMessage_errorMessage(Parameter<String>.value(`errorMessage`))) as? (String) -> Void
		perform?(`errorMessage`)
    }


    fileprivate enum MethodType {
        case m_display__errorMessage_errorMessage(Parameter<String>)
        case p_output_get
		case p_output_set(Parameter<WeatherViewEventResponderProtocol?>)
        case p_forecast_get
		case p_forecast_set(Parameter<Forecast?>)
        case p_matchedAddresses_get
		case p_matchedAddresses_set(Parameter<[MKLocalSearchCompletion]?>)
        case p_isLoading_get
		case p_isLoading_set(Parameter<Bool>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_display__errorMessage_errorMessage(let lhsErrormessage), .m_display__errorMessage_errorMessage(let rhsErrormessage)):
                guard Parameter.compare(lhs: lhsErrormessage, rhs: rhsErrormessage, with: matcher) else { return false } 
                return true 
            case (.p_output_get,.p_output_get): return true
			case (.p_output_set(let left),.p_output_set(let right)): return Parameter<WeatherViewEventResponderProtocol?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_forecast_get,.p_forecast_get): return true
			case (.p_forecast_set(let left),.p_forecast_set(let right)): return Parameter<Forecast?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_matchedAddresses_get,.p_matchedAddresses_get): return true
			case (.p_matchedAddresses_set(let left),.p_matchedAddresses_set(let right)): return Parameter<[MKLocalSearchCompletion]?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_isLoading_get,.p_isLoading_get): return true
			case (.p_isLoading_set(let left),.p_isLoading_set(let right)): return Parameter<Bool>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_display__errorMessage_errorMessage(p0): return p0.intValue
            case .p_output_get: return 0
			case .p_output_set(let newValue): return newValue.intValue
            case .p_forecast_get: return 0
			case .p_forecast_set(let newValue): return newValue.intValue
            case .p_matchedAddresses_get: return 0
			case .p_matchedAddresses_set(let newValue): return newValue.intValue
            case .p_isLoading_get: return 0
			case .p_isLoading_set(let newValue): return newValue.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func output(getter defaultValue: WeatherViewEventResponderProtocol?...) -> PropertyStub {
            return Given(method: .p_output_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func forecast(getter defaultValue: Forecast?...) -> PropertyStub {
            return Given(method: .p_forecast_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func matchedAddresses(getter defaultValue: [MKLocalSearchCompletion]?...) -> PropertyStub {
            return Given(method: .p_matchedAddresses_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func isLoading(getter defaultValue: Bool...) -> PropertyStub {
            return Given(method: .p_isLoading_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func display(errorMessage: Parameter<String>) -> Verify { return Verify(method: .m_display__errorMessage_errorMessage(`errorMessage`))}
        public static var output: Verify { return Verify(method: .p_output_get) }
		public static func output(set newValue: Parameter<WeatherViewEventResponderProtocol?>) -> Verify { return Verify(method: .p_output_set(newValue)) }
        public static var forecast: Verify { return Verify(method: .p_forecast_get) }
		public static func forecast(set newValue: Parameter<Forecast?>) -> Verify { return Verify(method: .p_forecast_set(newValue)) }
        public static var matchedAddresses: Verify { return Verify(method: .p_matchedAddresses_get) }
		public static func matchedAddresses(set newValue: Parameter<[MKLocalSearchCompletion]?>) -> Verify { return Verify(method: .p_matchedAddresses_set(newValue)) }
        public static var isLoading: Verify { return Verify(method: .p_isLoading_get) }
		public static func isLoading(set newValue: Parameter<Bool>) -> Verify { return Verify(method: .p_isLoading_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func display(errorMessage: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_display__errorMessage_errorMessage(`errorMessage`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

