#
# Be sure to run `pod lib lint Transloadiit.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Transloadiit"
  s.version          = "0.1.6"
  s.summary          = "A short description of Transloadiit."
  s.description      = <<-DESC
                       An optional longer description of Transloadiit

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/<GITHUB_USERNAME>/Transloadiit"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Pedro" => "pepibumur@gmail.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/Transloadiit.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'Transloadiit' => ['Pod/Assets/*.png']
  }
  s.dependency 'AFNetworking', '~> 2.5'
  s.dependency 'ReactiveObjC’
  s.dependency 'CommonCrypto', '~> 1.1'
end
