<p align="center">
  <a href="https://rudderstack.com/">
    <img src="https://user-images.githubusercontent.com/59817155/121357083-1c571300-c94f-11eb-8cc7-ce6df13855c9.png">
  </a>
</p>

<p align="center"><b>The Customer Data Platform for Developers</b></p>

<p align="center">
  <b>
    <a href="https://rudderstack.com">Website</a>
    ·
    <a href="">Documentation</a>
    ·
    <a href="https://rudderstack.com/join-rudderstack-slack-community">Community Slack</a>
  </b>
</p>

---

# Integrating RudderStack iOS SDK with SQLCipher

This repository contains the resources and assets required to integrate the [RudderStack iOS SDK](https://www.rudderstack.com/docs/sources/event-streams/sdks/rudderstack-ios-sdk/) with [SQLICipher](https://www.zetetic.net/).

| Important: This feature is supported for SQLCipher v4.0 and above.|
| :---|

## Step 1: Integrate the SDK with SQLCipher

1. `RudderDatabaseEncryption` is available through [CocoaPods](https://cocoapods.org). To install it, add the following line to your `Podfile`:

```ruby
pod 'RudderDatabaseEncryption', '~> 1.0.0'
```
2. Run the `pod install` command.

## Step 2: Import the SDK

### Swift

```swift
import RudderDatabaseEncryption
```

### Objective C

```objectivec
@import RudderDatabaseEncryption;
```

## Step 3: Initialize the RudderStack client (`RSClient`)

Place the following in your `AppDelegate` under the `didFinishLaunchingWithOptions` method.

### Objective C

```objective-c
RSConfigBuilder *builder = [[RSConfigBuilder alloc] init];
[builder withDataPlaneUrl:DATA_PLANE_URL];
[builder withDBEncryption:[[RSDBEncryption alloc] initWithKey:@"test1234" enable:YES databaseProvider:[RSEncryptedDatabaseProvider new]]];
[RSClient getInstance:WRITE_KEY config:[builder build]];
```
### Swift

```swift
let builder: RSConfigBuilder = RSConfigBuilder()
            .withDataPlaneUrl(DATA_PLANE_URL)
			.withDBEncryption(RSDBEncryption(key: "test1234", enable: true, databaseProvider: RSEncryptedDatabaseProvider()))
RSClient.getInstance(WRITE_KEY, config: builder.build())
```

## About RudderStack

RudderStack is the **customer data platform** for developers. With RudderStack, you can build and deploy efficient pipelines that collect customer data from every app, website, and SaaS platform, then activate your data in your warehouse, business, and marketing tools.

| Start building a better, warehouse-first CDP that delivers complete, unified data to every part of your customer data stack. Sign up for [RudderStack Cloud](https://app.rudderstack.com/signup?type=freetrial) today. |
| :---|

## Contact us

For queries on configuring or using this integration, start a conversation in our [Slack](https://rudderstack.com/join-rudderstack-slack-community) community.
