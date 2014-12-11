#!/bin/sh

# TODO: add notification if there are new versions 
# you can get the latest version with 
#    pod repo update
#    pod list | grep "^\\s*CocoaLumberjack" 


echo 'Fetching podspec files'

wget -qN https://raw.githubusercontent.com/CocoaPods/Specs/master/Specs/CocoaLumberjack/2.0.0-beta4/CocoaLumberjack.podspec.json
echo '.\c'
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
echo ''

echo 'Building CocoaLumberjack'
pod package CocoaLumberjack.podspec.json --force

echo 'Building Mantle'
pod package Mantle.podspec.json --force

echo 'Building AFNetworking'
pod package AFNetworking.podspec.json --force

echo 'Building SDWebImage'
pod package SDWebImage.podspec.json --force

echo 'Building PromiseKit'
pod package PromiseKit.podspec.json --force

echo 'Building TTTAttributedLabel'
pod package TTTAttributedLabel.podspec.json --force

echo 'Building Numbus/PagingScrollView'
pod package Nimbus.podspec.json --subspecs=PagingScrollView --force

echo 'Building OCMock'
pod package OCMock.podspec.json --force

echo 'Downloading AWS SDK'
wget -N http://sdk-for-ios.amazonwebservices.com/latest/aws-ios-sdk.zip
echo 'extracting'
unzip -q aws-ios-sdk.zip || exit 1
