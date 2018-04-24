//
//  TDUtils.m
//  TreasureData
//
//  Created by Huy Le on 3/1/18.
//  Copyright © 2018 Treasure Data. All rights reserved.
//

#import "TDUtils.h"

static NSString *const TDEventClassKey = @"__td_event_class";
static NSString *const TDEventClassCustom = @"custom";
static NSString *const TDEventClassAppLifecycle = @"app_lifecycle";
static NSString *const TDEventClassAudit = @"audit";

@implementation TDUtils

+ (NSString *)requireNonBlank:(NSString *)str defaultValue:(NSString *)defaultStr message:(NSString *)message
{
    if ([str length] == 0) {
        NSLog(@"%@", message);
        return defaultStr;
    } else {
        return str;
    }
}

+ (NSDictionary *)markAsAppLifecycleEvent:(NSDictionary *)event {
    NSMutableDictionary *appLifecycleEvent = [NSMutableDictionary dictionaryWithDictionary:event];
    appLifecycleEvent[TDEventClassKey] = TDEventClassAppLifecycle;
    return [NSDictionary dictionaryWithDictionary:appLifecycleEvent];
}


+ (NSDictionary *)markAsAuditEvent:(NSDictionary *)event {
    NSMutableDictionary *auditEvent = [NSMutableDictionary dictionaryWithDictionary:event];
    auditEvent[TDEventClassKey] = TDEventClassAudit;
    return [NSDictionary dictionaryWithDictionary:auditEvent];
}

+ (NSDictionary *)markAsCustomEvent:(NSDictionary *)event {
    NSMutableDictionary *auditEvent = [NSMutableDictionary dictionaryWithDictionary:event];
    auditEvent[TDEventClassKey] = TDEventClassCustom;
    return [NSDictionary dictionaryWithDictionary:auditEvent];
}


+ (BOOL)isAppLifecycleEvent:(NSDictionary *)event {
    return [event[TDEventClassKey] isEqualToString:TDEventClassAppLifecycle];
}

+ (BOOL)isAuditEvent:(NSDictionary *)event {
    return [event[TDEventClassKey] isEqualToString:TDEventClassAudit];
}

/// Either the `TDEventClassKey` ("__td_event_class") is "custom" or absence
+ (BOOL)isCustomEvent:(NSDictionary *)event {
    return event[TDEventClassKey] == nil
            || [event[TDEventClassKey] isEqualToString:TDEventClassCustom];
}

@end
