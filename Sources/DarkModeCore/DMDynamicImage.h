//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

#import "DMTraitCollection.h"

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface DMDynamicImageProxy : NSProxy

@property (nonatomic, readonly) UIImage *resolvedImage;

- (instancetype)initWithLightImage:(UIImage *)lightImage darkImage:(UIImage *)darkImage;
- (UIImage *)resolvedImageWithTraitCollection:(DMTraitCollection *)traitCollection;

@end

NS_ASSUME_NONNULL_END
