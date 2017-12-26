# Uncomment this line to define a global platform for your project
# platform :ios, '10.0'


target 'Citizenship' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Citizenship
	pod 'Alamofire', '~> 4.5'
	#pod 'AlamofireImage', '~> 3.3'
	pod 'MBProgressHUD', '~> 1.0'
	pod 'ACFloatingTextfield-Swift', '~> 1.5'
	pod 'SDWebImage', '~> 4.1'

end
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
