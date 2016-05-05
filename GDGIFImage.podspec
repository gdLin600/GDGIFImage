Pod::Spec.new do |s|
s.name         = 'GDGIFImage'
s.version      = '0.0.1'
s.summary      = '这个分类可以使您的UIImageView 支持GIF'
s.homepage     = 'https://github.com/gdLin600/GDGIFImage'
s.license      = 'MIT'
s.authors      = { 'gdLin600' => 'lingd600@163.com' }
s.platform     = :ios, '7.0'
s.source       = { :git => 'https://github.com/gdLin600/GDGIFImage.git', :tag => s.version.to_s }
s.source_files = 'GDGIFImage/*.{h,m}'
#s.resource     = 'GDQrCode/GDQrCode.bundle'
s.framework    = 'UIKit','ImageIO'
#s.dependency 'Masonry'
s.requires_arc = true
end