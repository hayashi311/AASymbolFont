//
//  Created by CocoaPods on TODAYS_DATE.
//  Copyright (c) 2014 PROJECT_OWNER. All rights reserved.
//

#import "UIImage+AASymbolFont.h"
#import "UIFont+AASymbolFont.h"

@implementation UIImage (AASymbolFont)

+ (instancetype)aa_imageWithSymbolName:(NSString *)symbolName size:(CGFloat)size color:(UIColor *)color {

    UIFont *font = [UIFont aa_symbolFontWithSize:size];

    NSDictionary *attributes = @{
            NSFontAttributeName : font,
            NSForegroundColorAttributeName : color
    };
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:symbolName
                                                                           attributes:attributes];

    CGRect textRect = [attributedString boundingRectWithSize:CGSizeMake(1000, 1000)
                                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine
                                                     context:[NSStringDrawingContext new]];
    textRect.origin = CGPointZero;

    UIGraphicsBeginImageContextWithOptions(textRect.size, NO, 0);

    [attributedString drawInRect:textRect];

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return image;
}

+ (instancetype)aa_templateImageWithSymbolName:(NSString *)symbolName size:(CGFloat)size {
    UIImage *image = [self aa_imageWithSymbolName:symbolName size:size color:[UIColor blackColor]];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

@end