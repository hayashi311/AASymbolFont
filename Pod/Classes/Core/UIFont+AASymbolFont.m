//
//  Created by CocoaPods on TODAYS_DATE.
//  Copyright (c) 2014 PROJECT_OWNER. All rights reserved.
//

#import "UIFont+AASymbolFont.h"

NSString *const kAASymbolFontFamilyName = @"icons";

@implementation UIFont (AASymbolFont)

+ (instancetype)aa_symbolFontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:kAASymbolFontFamilyName size:size];
    return font;
}

@end
