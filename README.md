# EPCircleProgressView
### EPCircleProgressView，环形进度条，多种样式，几行代码快速集成
### 使用方法
```
    EPCircleProgressView *progressView = [[EPCircleProgressView alloc]initWithFrame:CGRectZero Style:EPCircleProgressStyleSquare];
    progressView.frame = CGRectMake(100, 100, 100, 100);
    progressView.LineColor = [UIColor yellowColor];
    progressView.LineWidth = 5.f;
    progressView.progress = 0.7;
    [self.view addSubview:progressView];
```
### 截图
![截图](http://ac-j38u14vo.clouddn.com/596c902bcdddde80.png)