# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MSTRnMMA' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'Pineapple', :subspecs => ['Command', 'Ability'], :git => 'git@git.oschina.net:i-focusing-app/Pineapple.git'
  # React Native
  pod 'React', :path => './node_modules/react-native', :subspecs => [
  'Core',
  'CxxBridge', # 如果RN版本 >= 0.47则加入此行
  'DevSupport', # 如果RN版本 >= 0.43，则需要加入此行才能开启开发者菜单
  'RCTActionSheet',
  'RCTGeolocation',
  'RCTImage',
  'RCTPushNotification',
  'RCTSettings',
  'RCTText',
  'RCTNetwork',
  'RCTVibration',
  'RCTWebSocket', # 调试功能需要此模块
  'RCTAnimation', # FlatList和原生动画功能需要此模块
  'RCTLinkingIOS',
  'RCTCameraRoll',
  'RCTBlob'
  ]
  pod 'react-native-sqlite-storage', :path => './node_modules/react-native-sqlite-storage'

  # 如果你的RN版本 >= 0.42.0，则加入下面这行
  pod 'yoga', :path => './node_modules/react-native/ReactCommon/yoga'
  
  # 如果RN版本 >= 0.45则加入下面三个第三方编译依赖
  pod 'DoubleConversion', :podspec => './node_modules/react-native/third-party-podspecs/DoubleConversion.podspec'
  pod 'glog', :podspec => './node_modules/react-native/third-party-podspecs/glog.podspec'
  pod 'Folly', :podspec => './node_modules/react-native/third-party-podspecs/Folly.podspec'

  
  
  # Pods for MSTRnMMA

end

target 'MSTRnMMA IOS Example' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
pod 'Masonry'
  # Pods for MSTRnMMA IOS Example

end
