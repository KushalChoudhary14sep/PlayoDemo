# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'PlayoDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PlayoDemo
  pod 'Moya'
  pod 'Nuke'
  target 'PlayoDemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'PlayoDemoUITests' do
    # Pods for testing
  end

 post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '5.0'
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
    end
  end
 end

end
