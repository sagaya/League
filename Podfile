# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'


workspace 'LeagueMobileChallengePairing'


def servicePods
  pod 'Alamofire', '4.9.1'
end

def cacheSupport
  pod 'SDWebImage', '~> 4.0'
  pod 'Cache'
end

def reactiveSwift
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxBlocking'
end


target 'Common' do
  use_frameworks!
  project 'Common/Common.xcodeproj'
  servicePods
  reactiveSwift
  target 'CommonTests' do
    
  end
  
end

target 'LeagueMobileChallenge' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  servicePods
  cacheSupport
  reactiveSwift
  target 'LeagueMobileChallengeTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  target 'LeagueMobileChallengeUITests' do
    # Pods for testing
    inherit! :search_paths

  end
  
end
