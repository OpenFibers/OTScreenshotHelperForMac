//
//  OTScreenshotHelper.m
//  SSHMole
//
//  Created by openthread on 7/1/16.
//  Copyright © 2016 openthread. All rights reserved.
//

#import "OTScreenshotHelperForMac.h"

@implementation OTScreenshotHelperForMac

+ (void)screenshot:(void (^)(NSImage *image, NSData *imageData))callback
{
    NSTask *capture = [[NSTask alloc] init];
    capture.launchPath = @"/usr/sbin/screencapture";
    // -i interactive mode，-c save to clipboard
    capture.arguments = [NSArray arrayWithObjects:@"-i", @"-c", nil];
    
    [capture setTerminationHandler: ^(NSTask *t) {
        NSPasteboard *pboard = [NSPasteboard generalPasteboard];
        NSPasteboardItem *pboardItem = [[pboard pasteboardItems] objectAtIndex:0];
        NSString *pboardItemType = [[pboard types] objectAtIndex:0];
        NSData *imageData = [pboardItem dataForType:pboardItemType];
        NSImage *image = [[NSImage alloc] initWithData:imageData];
        if (callback && imageData.length)
        {
            callback(image, imageData);
        }
    }];
    [capture launch];
}

@end
