#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OYModule'
  s.version          = '0.1.0'
  s.summary          = 'A short description of OYModule.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "ouyanggaojun's Pubulic Module"

  s.homepage         = 'https://github.com/ouyanggao/OYModule'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ouyanggao' => '804716454@qq.com' }
  s.source           = { :git => 'https://github.com/ouyanggao/OYModule.git', :tag => "v#{s.version}"  }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  
  s.resource_bundles = {
    'OYModule' => ['Pod/Assets/*.png']
  }

  s.default_subspec='All'
  s.subspec 'All' do |ss|
    ss.ios.dependency 'OYModule/UIKit'
    ss.ios.dependency 'OYModule/NSObject'
  end

  s.subspec 'UIKit' do |ss|
    ss.source_files='OYModule/NSObject+OYModule.{h,m}','OYModule/UIKit/*.{h,m}'
  end

  s.subspec 'NSObject' do |ss|
    ss.ios.dependency 'OYModule/UIKit'
    ss.source_files='OYModule/NSObject/*.{h,m}'
    #ss.ios.frameworks = 'OYModuleUIKit'

  end

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
