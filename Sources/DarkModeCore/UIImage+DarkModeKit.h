//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

#import <UIKit/UIKit.h>
#ifdef SWIFT_PACKAGE
#import "DMNamespace.h"
#import "DMTraitCollection.h"
#else
#import <FluentDarkModeKit/DMNamespace.h>
#import <FluentDarkModeKit/DMTraitCollection.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (DarkModeKit)

+ (UIImage *)dm_imageWithLightImage:(UIImage *)lightImage darkImage:(UIImage *)darkImage
NS_SWIFT_UNAVAILABLE("Use init(_:light:dark:) instead.");
- (UIImage *)dm_resolvedImageWithTraitCollection:(DMTraitCollection *)traitCollection
NS_SWIFT_UNAVAILABLE("Use resolvedImage(_:with:) instead.");

#if __swift__
+ (UIImage *)dm_namespace:(DMNamespace)namespace
      imageWithLightImage:(UIImage *)lightImage
                darkImage:(UIImage *)darkImage NS_SWIFT_NAME(init(_:light:dark:));
- (UIImage *)dm_namespace:(DMNamespace)namespace resolvedImageWithTraitCollection:(DMTraitCollection *)traitCollection NS_SWIFT_NAME(resolvedImage(_:with:));
#endif

@end

NS_ASSUME_NONNULL_END
