@testable import DPApp

class MockAnalyticsTracker: AnalyticsTracker {

    var isTrackEventCalled: Bool = false

    override func trackEvent(name: String) -> String {
        isTrackEventCalled = true
        return "mockTrackEvent"
    }

}
