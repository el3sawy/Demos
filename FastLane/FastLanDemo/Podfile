# Uncomment the next line to define a global platform for your project
# platform :ios, '14.0'

target 'FastLanDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for FastLanDemo
  
  pod 'Alamofire'
  pod 'IQKeyboardManagerSwift'
  pod 'SVProgressHUD', :git => 'https://github.com/SVProgressHUD/SVProgressHUD.git'
  pod 'SwiftyJSON'
  pod 'MIRToolTip', :git => 'https://github.com/mir-taqi/MIRToolTip.git', :branch => 'master'
  pod 'ActionSheetPicker-3.0'
  pod 'FSPagerView'
  pod "WOWCheckbox"
  pod 'Firebase/Core', '9.6.0'
  pod 'Firebase/Database', '9.6.0'
  pod 'KeychainAccess'
  pod 'RealmSwift'
  pod 'Firebase/Messaging', '9.6.0'
  pod 'Firebase/Analytics', '9.6.0'
  pod 'Firebase/Crashlytics', '9.6.0'
  pod 'Firebase/Performance', '9.6.0'
  pod 'GTProgressBar'
  pod 'MIRSnapper', :git => 'https://github.com/mir-taqi/MIRSnapper.git', :branch => 'master'
  pod 'AppCenter'
  pod 'AppCenter/Crashes'
  pod 'AppCenter/Distribute'
  pod 'AppCenter/Analytics'
  pod 'GoogleMaps', '7.4.0'

  end

  post_install do |installer|
      installer.generated_projects.each do |project|
            project.targets.each do |target|
                target.build_configurations.each do |config|
                    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
                 end
            end
     end
  end
