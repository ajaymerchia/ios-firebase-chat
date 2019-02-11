# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'chatExample' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for chatExample
  pod 'ARMDevSuite'
  pod 'ChameleonFramework/Swift', :git => 'https://github.com/ViccAlexander/Chameleon.git', :branch => 'wip/swift4', :inhibit_warnings => true

  pod 'Firebase/Core'
  pod 'Firebase/Database'
  pod 'Firebase/Messaging'
  
  pod 'CryptoSwift', :git => "https://github.com/krzyzanowskim/CryptoSwift", :branch => "master"
  
  target 'chatExampleTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'chatExampleUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
