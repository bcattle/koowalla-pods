#!/bin/sh

# TODO: add notification if there are new versions 
# you can get the latest version with 
#    pod repo update
#    pod list | grep "^\\s*CocoaLumberjack" 


echo 'Fetching podspec files'

#wget -qN https://raw.githubusercontent.com/CocoaPods/Specs/master/Specs/JRSwizzle/1.0/JRSwizzle.podspec.json
#echo '.\c'
#wget -qN https://raw.githubusercontent.com/CocoaPods/Specs/master/Specs/NSLogger/1.5.1/NSLogger.podspec.json
#echo '.\c'
#wget -qN https://raw.githubusercontent.com/CocoaPods/Specs/master/Specs/CocoaLumberjack/2.0.0-beta4/CocoaLumberjack.podspec.json
#echo '.\c'
wget -qN https://raw.githubusercontent.com/CocoaPods/Specs/master/Specs/Mantle/1.5.1/Mantle.podspec.json
echo '.\c'
wget -qN https://raw.githubusercontent.com/CocoaPods/Specs/master/Specs/AFNetworking/2.5.0/AFNetworking.podspec.json
echo '.\c'
wget -qN https://raw.githubusercontent.com/CocoaPods/Specs/master/Specs/SDWebImage/3.7.1/SDWebImage.podspec.json
echo '.\c'
wget -qN https://raw.githubusercontent.com/CocoaPods/Specs/master/Specs/PromiseKit/1.0.2/PromiseKit.podspec.json
echo '.\c'
wget -qN https://raw.githubusercontent.com/CocoaPods/Specs/master/Specs/TTTAttributedLabel/1.9.5/TTTAttributedLabel.podspec.json
echo '.\c'
wget -qN https://raw.githubusercontent.com/CocoaPods/Specs/master/Specs/Nimbus/1.2.0/Nimbus.podspec.json
echo '.\c'
wget -qN https://raw.githubusercontent.com/CocoaPods/Specs/master/Specs/OCMock/3.1.1/OCMock.podspec.json 
echo '.\c'
wget -qN https://raw.githubusercontent.com/CocoaPods/Specs/master/Specs/FBSnapshotTestCase/1.5/FBSnapshotTestCase.podspec.json
echo '.\c'
echo ''

echo 'Setting up Cocoapods'
sudo gem install cocoapods -v
sudo gem install cocoapods-packager -v
pod setup

#echo 'Building JRSwizzle'
#pod package JRSwizzle.podspec.json --force || exit 1

#echo 'Building NSLogger'
#pod package NSLogger.podspec.json --force || exit 1

#echo 'Building CocoaLumberjack'
#pod package CocoaLumberjack.podspec.json --force || exit 1

echo 'Building Mantle'
pod package Mantle.podspec.json --force || exit 1

echo 'Building AFNetworking'
pod package AFNetworking.podspec.json --force || exit 1

echo 'Building SDWebImage'
pod package SDWebImage.podspec.json --force || exit 1

echo 'Building PromiseKit'
pod package PromiseKit.podspec.json --force || exit 1

echo 'Building TTTAttributedLabel'
pod package TTTAttributedLabel.podspec.json --force || exit 1

echo 'Building Numbus/PagingScrollView'
pod package Nimbus.podspec.json --subspecs=PagingScrollView --force || exit 1

echo 'Building OCMock'
pod package OCMock.podspec.json --force || exit 1

echo 'Building FBSnapshotTestCase'
pod package FBSnapshotTestCase.podspec.json --force || exit 1

echo 'Downloading AWS SDK'
wget -N http://sdk-for-ios.amazonwebservices.com/latest/aws-ios-sdk.zip
echo 'extracting'
unzip -q aws-ios-sdk.zip || exit 1
