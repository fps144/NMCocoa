#
# Be sure to run `pod lib lint NMCocoa.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  # Basic
  s.name             = 'NMCocoa'
  s.version          = '1.0.0'
  s.summary          = 'A lightweight extension library based on Objective-C.'
  s.description      = <<-DESC
                       Try to make life brilliant.
                       DESC
  s.homepage         = 'https://github.com/fps144/NMCocoa'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nanmen' => 'yusong1108@gmail.com' }
  s.source           = { :git => 'https://github.com/fps144/NMCocoa.git', :tag => s.version.to_s }

  # Platform
  s.ios.deployment_target = '8.0'
  s.requires_arc          = true

  # File
  s.source_files = 'NMCocoa/Cocoa/*.h', 'NMCocoa/Cocoa/Category/**/*'

end
