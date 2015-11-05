source 'https://github.com/CocoaPods/Specs'

platform :ios, '8.0'
use_frameworks!
inhibit_all_warnings!

# Add Application pods here
target 'HElabsChallenge', :exclusive => true do
    pod 'Swinject'
    pod 'Alamofire'
    pod 'Genome'
    pod 'Nuke'
    
    pod 'TagListView'
    pod 'SwiftDate'
end

target :unit_tests, :exclusive => true do
    link_with 'UnitTests'
    pod 'Specta'
    pod 'Expecta'
    pod 'OCMock'
    pod 'OHHTTPStubs'
end


# Copy acknowledgements to the Settings.bundle

post_install do | installer |
  require 'fileutils'

  pods_acknowledgements_path = 'Pods/Target Support Files/Pods/Pods-Acknowledgements.plist'
  settings_bundle_path = Dir.glob("**/*Settings.bundle*").first

  if File.file?(pods_acknowledgements_path)
    puts 'Copying acknowledgements to Settings.bundle'
    FileUtils.cp_r(pods_acknowledgements_path, "#{settings_bundle_path}/Acknowledgements.plist", :remove_destination => true)
  end
end

