##TouchID Demo

```
typedef NS_ENUM(NSInteger, LAError)
{
    //授权失败
    LAErrorAuthenticationFailed = kLAErrorAuthenticationFailed,
    
    //用户取消Touch ID授权
    LAErrorUserCancel           = kLAErrorUserCancel,
    
    //用户选择输入密码
    LAErrorUserFallback         = kLAErrorUserFallback,
    
    //系统取消授权(例如其他APP切入)
    LAErrorSystemCancel         = kLAErrorSystemCancel,
    
    //系统未设置密码
    LAErrorPasscodeNotSet       = kLAErrorPasscodeNotSet,

    //设备Touch ID不可用，例如未打开
    LAErrorTouchIDNotAvailable  = kLAErrorTouchIDNotAvailable,
    
    //设备Touch ID不可用，用户未录入
    LAErrorTouchIDNotEnrolled   = kLAErrorTouchIDNotEnrolled,
} NS_ENUM_AVAILABLE(10_10, 8_0);


 /// Authentication was not successful, because there were too many failed Touch ID attempts and
    /// Touch ID is now locked. Passcode is required to unlock Touch ID, e.g. evaluating
    /// LAPolicyDeviceOwnerAuthenticationWithBiometrics will ask for passcode as a prerequisite.
    LAErrorTouchIDLockout   NS_ENUM_AVAILABLE(10_11, 9_0) = kLAErrorTouchIDLockout,

    /// Authentication was canceled by application (e.g. invalidate was called while
    /// authentication was in progress).
    LAErrorAppCancel        NS_ENUM_AVAILABLE(10_11, 9_0) = kLAErrorAppCancel,

    /// LAContext passed to this call has been previously invalidated.
    LAErrorInvalidContext   NS_ENUM_AVAILABLE(10_11, 9_0) = kLAErrorInvalidContext
    
    
```

>>其中，LAErrorTouchIDLockout是在8.0中也会出现的情况，但并未归为单独的错误类型，这个错误出现，源自用户多次连续使用Touch ID失败，Touch ID被锁，需要用户输入密码解锁，这个错误的交互LocalAuthentication.framework已经封装好了，不需要开发者关心。
  
>>LAErrorAppCancel和LAErrorSystemCancel相似，都是当前软件被挂起取消了授权，但是前者是用户不能控制的挂起，例如突然来了电话，电话应用进入前台，APP被挂起。后者是用户自己切到了别的应用，例如按home键挂起。
  
>> LAErrorInvalidContext很好理解，就是授权过程中,LAContext对象被释放掉了，造成的授权失败。



[参考链接1](https://segmentfault.com/a/1190000002516465)
[参考链接2](http://www.jianshu.com/p/9b0aa6b9c689)
```
灿哥2016-07-21

```
