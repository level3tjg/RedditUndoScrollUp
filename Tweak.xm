#import <UIKit/UIKit.h>

CGFloat scrollOffset;
UIScrollView *scrollView;

bool shouldUndoScroll = false;

%hook _TtGC8SliceKit8ListViewC12YearInReview25YearInReviewListViewModel_
- (void)scrollViewDidScroll:(UIScrollView *)arg1 {
    %orig;

    scrollView = arg1;

    if (scrollOffset < arg1.contentOffset.y) {
        scrollOffset =  arg1.contentOffset.y;
    }
}
%end

%hook FeedViewControllerDelegator
- (void)scrollViewDidScroll:(UIScrollView *)arg1 {
    %orig;

    scrollView = arg1;

    if (scrollOffset < arg1.contentOffset.y) {
        scrollOffset =  arg1.contentOffset.y;
    }
}

%end

%hook UIStatusBarManager
-(void)handleTapAction:(id)arg1 {
    if (shouldUndoScroll == false) {
        [scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    } else {
        [scrollView setContentOffset:CGPointMake(0, scrollOffset) animated:YES];
    }

    shouldUndoScroll = !shouldUndoScroll;

}
%end
