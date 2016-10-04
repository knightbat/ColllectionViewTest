//
//  ViewController.m
//  CollectionViewTest
//
//  Created by JK on 03/10/16.
//  Copyright © 2016 JK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    
    __weak IBOutlet UICollectionView *topCollectionView;
    __weak IBOutlet UICollectionView *bottomCollectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView.tag == 1) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"top" forIndexPath:indexPath];
        UILabel *label = [cell viewWithTag:2];
        label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        
        CGFloat red = arc4random_uniform(255) / 255.0;
        CGFloat green = arc4random_uniform(255) / 255.0;
        CGFloat blue = arc4random_uniform(255) / 255.0;
        
        UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        cell.backgroundColor = color;
        
        return cell;

    } else {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIView *view = [cell viewWithTag:10];
    CGFloat red = arc4random_uniform(255) / 255.0;
    CGFloat green = arc4random_uniform(255) / 255.0;
    CGFloat blue = arc4random_uniform(255) / 255.0;

    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    [view setBackgroundColor:color];
    return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)index {
    if (collectionView.tag == 1) {
        
        return CGSizeMake(80*(index.row%2) + 80, collectionView.frame.size.height);
    } else {
        return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 10;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [topCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition: UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    [bottomCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition: UICollectionViewScrollPositionCenteredHorizontally animated:YES];

   }

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = bottomCollectionView.frame.size.width;
    float currentPage = bottomCollectionView.contentOffset.x / pageWidth;
    [topCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:currentPage inSection:0] atScrollPosition: UICollectionViewScrollPositionCenteredHorizontally animated:YES];


}

@end
