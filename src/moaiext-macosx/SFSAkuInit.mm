//
//  SFSAkuInit.m
//  MoaiSample
//
//  Created by Brendan Ragan on 21/03/13.
//
//

#import "SFSAkuInit.h"
#import "moaiext-macosx.h"

@implementation SFSAkuInit

+(void)MoaiTypesInit {
	loadMoaiLib_NSArray ();
	loadMoaiLib_NSData ();
//	loadMoaiLib_NSDate ();
	loadMoaiLib_NSDictionary ();
	loadMoaiLib_NSError ();
	loadMoaiLib_NSNumber ();
	loadMoaiLib_NSObject ();
	loadMoaiLib_NSString ();
}

+(void)MoaiEnvironmentInit {
	NSLog(@"Mac OS X Environment Init");
	MOAIEnvironment& environment = MOAIEnvironment::Get ();
	
//	environment.SetValue ( MOAI_ENV_connectionType, ( int ) AKUGetIphoneNetworkReachability() );
	
	environment.SetValue ( MOAI_ENV_appDisplayName,		[[[[ NSBundle mainBundle ] infoDictionary ] objectForKey:@"CFBundleDisplayName" ] UTF8String ]);
	NSString *bundleID = [[[ NSBundle mainBundle ] infoDictionary ] objectForKey:@"CFBundleIdentifier" ];
	if (bundleID == nil) {
		bundleID = @"moai-test-debug";
	}
	environment.SetValue ( MOAI_ENV_appID,				[bundleID UTF8String]);
	environment.SetValue ( MOAI_ENV_appVersion,			[[[[ NSBundle mainBundle ] infoDictionary ] objectForKey:@"CFBundleShortVersionString" ] UTF8String ]);
	environment.SetValue ( MOAI_ENV_cacheDirectory,		[[NSString stringWithFormat:@"%@/.%@/cache/", NSHomeDirectory(), bundleID] UTF8String]);
	environment.SetValue ( MOAI_ENV_countryCode,		[[[ NSLocale currentLocale ] objectForKey: NSLocaleCountryCode ] UTF8String ]);
	environment.SetValue ( MOAI_ENV_cpuabi,				"x86");
	environment.SetValue ( MOAI_ENV_devBrand,			"Apple");
//	environment.SetValue ( MOAI_ENV_devName,			[[ UIDevice currentDevice ].localizedModel UTF8String ]);
	environment.SetValue ( MOAI_ENV_devManufacturer,	"Apple");
//	environment.SetValue ( MOAI_ENV_devModel,			[[ UIDevice currentDevice ].model UTF8String ] );
	environment.SetValue ( MOAI_ENV_devPlatform,		"MacOSX");
//	environment.SetValue ( MOAI_ENV_devProduct,			[[ UIDevice currentDevice ].model UTF8String ]);
	
	environment.SetValue ( MOAI_ENV_documentDirectory,	[[NSString stringWithFormat:@"%@/.%@/documents/", NSHomeDirectory(), bundleID] UTF8String]);

//	environment.SetValue ( MOAI_ENV_iosRetinaDisplay,	[[ UIScreen mainScreen ] scale ] == 2.0 );
	environment.SetValue ( MOAI_ENV_languageCode,		[[[ NSLocale currentLocale ] objectForKey: NSLocaleLanguageCode ] UTF8String ]);
	environment.SetValue ( MOAI_ENV_osBrand,			"iOS" );
//	environment.SetValue ( MOAI_ENV_osVersion,			[[ UIDevice currentDevice ].systemVersion UTF8String ]);
	environment.SetValue ( MOAI_ENV_resourceDirectory,	[[[ NSBundle mainBundle ] resourcePath ] UTF8String ]);
	//TODO: dpi can be based on model.
//	environment.SetValue ( MOAI_ENV_screenDpi,			100);
//	environment.SetValue ( MOAI_ENV_horizontalResolution, [[ UIScreen mainScreen ] bounds ].size.width * [[ UIScreen mainScreen ] scale ] );
//	environment.SetValue ( MOAI_ENV_verticalResolution, [[ UIScreen mainScreen ] bounds ].size.height * [[ UIScreen mainScreen ] scale ] );
//	environment.SetValue ( MOAI_ENV_udid,				[[UIDevice currentDevice].identifierForVendor.UUIDString UTF8String]);
//	environment.SetValue ( MOAI_ENV_openUdid,			[[ MOAIOpenUDID value] UTF8String ]);
}

@end