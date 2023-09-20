source 'https://github.com/rudderlabs/Specs.git'
workspace 'RudderDatabaseEncryption.xcworkspace'
use_frameworks!
inhibit_all_warnings!
install! 'cocoapods', :warn_for_unused_master_specs_repo => false

def shared_pods
    pod 'RudderDatabaseEncryption', :path => '.'
end

def shared_dependent_pods
    pod 'Rudder'
    pod 'SQLCipher'
end

target 'RudderDatabaseEncryption-iOS' do
    project 'RudderDatabaseEncryption.xcodeproj'
    platform :ios, '12.0'
    shared_dependent_pods
end

target 'RudderDatabaseEncryption-tvOS' do
    project 'RudderDatabaseEncryption.xcodeproj'
    platform :tvos, '11.0'
    shared_dependent_pods
end

target 'RudderDatabaseEncryption-watchOS' do
    project 'RudderDatabaseEncryption.xcodeproj'
    platform :watchos, '7.0'
    shared_dependent_pods
end

target 'SampleSwift' do
    project 'Examples/SampleSwift/SampleSwift.xcodeproj'
    platform :ios, '12.0'
    shared_pods
    shared_dependent_pods
end

target 'SampleObjC' do
    project 'Examples/SampleObjC/SampleObjC.xcodeproj'
    platform :ios, '12.0'
    shared_pods
    shared_dependent_pods
end
