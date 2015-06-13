//
//  ViewController.m
//  GridLayout
//
//  Created by Cheung Chun Wai on 13/6/15.
//  Copyright (c) 2015 Sakiwei. All rights reserved.
//

#import "ViewController.h"
#import "GridLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *kCellId = @"CellId";
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
  return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"%s", __PRETTY_FUNCTION__);
  
  GridLayout *layout = (GridLayout *)self.collectionViewLayout;
  layout.column ++;
  
  [self.collectionView performBatchUpdates:^{
    [self.collectionView.collectionViewLayout invalidateLayout];
  } completion:^(BOOL finished) {
  }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return 100;
}

#pragma mark - UICollectionViewDelegateFlowLayout
////////////////////////////////////////////////////////////////////////////
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
      GridLayout *layout = (GridLayout *)self.collectionViewLayout;
    CGFloat width = 0.0;
    if (layout.column > 1) {
        width = (collectionView.frame.size.width-layout.padding*(layout.column-1))/layout.column;
    } else {
        width = collectionView.frame.size.width;
    }
    return CGSizeMake(floorf(width), width*layout.aspectRatio);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    GridLayout *layout = (GridLayout *)self.collectionViewLayout;
    return layout.padding;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    GridLayout *layout = (GridLayout *)self.collectionViewLayout;
    return layout.padding;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}

@end
