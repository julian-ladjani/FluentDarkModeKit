//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

#import "UIImage+DarkModeKit.h"
#import "UIImage+DarkModeKitSwizzling.h"
#import "DMDynamicImage.h"
#import "DMTraitCollection.h"

@import ObjectiveC;

@implementation UIImage (DarkModeKit)

+ (UIImage *)dm_imageWithLightImage:(UIImage *)lightImage darkImage:(UIImage *)darkImage {
  if (@available(iOS 13, *)) {
    if ([UIImage useUIImageAsset]) {
      UIImageAsset *imageAsset = [[UIImageAsset alloc] init];

      // Always specify a displayScale otherwise a default of 1.0 is assigned
      [imageAsset registerImage:lightImage withTraitCollection:[UITraitCollection traitCollectionWithTraitsFromCollections:@[
        [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight],
        [UITraitCollection traitCollectionWithDisplayScale:lightImage.scale]
      ]]];
      [imageAsset registerImage:darkImage withTraitCollection:[UITraitCollection traitCollectionWithTraitsFromCollections:@[
        [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark],
        [UITraitCollection traitCollectionWithDisplayScale:darkImage.scale]
      ]]];

      return [imageAsset imageWithTraitCollection:DMTraitCollection.overrideTraitCollection.uiTraitCollection];
    }
  }

  return (UIImage *)[[DMDynamicImageProxy alloc] initWithLightImage:lightImage darkImage:darkImage];
}

+ (UIImage *)dm_namespace:(DMNamespace)namespace
      imageWithLightImage:(UIImage *)lightImage
                darkImage:(UIImage *)darkImage {
  return [UIImage dm_imageWithLightImage:lightImage darkImage:darkImage];
}

- (UIImage *)dm_resolvedImageWithTraitCollection:(DMTraitCollection *)traitCollection {
  if (@available(iOS 13.0, *)) {
    // Here we just need to take care of UIImage that is not DMDynamicImage
    // since DMDynamicImage methods are all forwarded
    if (self.imageAsset == NULL) {
      return self;
    }
    return [self.imageAsset imageWithTraitCollection:traitCollection.uiTraitCollection];
  }
  if([self isKindOfClass:[DMDynamicImageProxy class]]) {
    return [(DMDynamicImageProxy *)self resolvedImageWithTraitCollection:traitCollection];
  }
  return self;
}

@end
