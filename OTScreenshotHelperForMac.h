//
//  OTScreenshotHelper.h
//  SSHMole
//
//  Created by openthread on 7/1/16.
//  Copyright © 2016 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface OTScreenshotHelperForMac : NSObject

/**
 *  Callup system screenshot, interactive mode, save to pasteboard.
 *
 *  @param callback Screenshot callback when done.
 */
+ (void)screenshot:(void (^)(NSImage *image, NSData *imageData))callback;

@end
