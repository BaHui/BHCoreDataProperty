## BHCoreDataProperty

### 场景
>  **最近开发中, 遇到使用CoreData时, 需要给ManagedObject部分字段加密之后, 存入本地数据库, 在需要用到该值得地方, 解密, 然后再进行使用. 
开始思路:
>1.在生成的实体的类中, 重写对象的`Setter & Getter`方法;
  2.在`Setter`方法中进行加密值, 然后进行`set`操作,  `Getter`方法中进行解密, 然后再`return`,
 但是系统生成的类的属性是添加在了实体类别中, 并隐式自动生成了`Setter & Getter`方法, 这样就不能按照普通的重写`Setter & Getter`来了. 查看了苹果iOS更新文档, 发现了新大陆, 官方的文档已经提供了相关的接口供使用.
API NEW:  [What’s New in Core Data in macOS 10.12, iOS 10.0, tvOS 10.0, and watchOS 3.0](https://developer.apple.com/library/content/releasenotes/General/WhatNewCoreData2016/ReleaseNotes.html).**

### 关键点
NSManagedObject will now also allow subclasses to override accessors and still invoke the implementation that otherwise would have been dynamically generated. This can be done by invoking a method named identically to the overridden method with ‘managedObjectOriginal_’ prepended. For example:
```
- (void)setDepartment:(Department *)value {
    // invoke the dynamic implementation of setDepartment
  [self managedObjectOriginal_setDepartment:value];
  NSLog(@"invoked %@", NSStringFromSelector(_cmd));
}
```

### 实现
```
// 创建实体BHPerson的类别, 专门用来处理Accessors的变化

@interface BHPerson ()

// Original `name` Setter && Getter Method
- (NSString *)managedObjectOriginal_name;
- (void)managedObjectOriginal_setName:(NSString *)name;

// Original `language` Setter && Getter Method
- (NSString *)managedObjectOriginal_language;
- (void)managedObjectOriginal_setLanguage:(NSString *)language;

@end


@implementation BHPerson (Accessors)

#pragma mark - Override `name` Setter && Getter Method

- (void)setName:(NSString *)name {
  NSString *willSaveName = [NSString stringWithFormat:@"%@%@", name, @"/changed"];
  [self managedObjectOriginal_setName:willSaveName];
}

- (NSString *)name {
  NSString *savedName = [self managedObjectOriginal_name];
  return [savedName stringByReplacingOccurrencesOfString:@"/changed" withString:@""];
}

#pragma mark - Override `language` Setter && Getter Method

- (void)setLanguage:(NSString *)language {
  NSString *willSaveLanguage = [NSString stringWithFormat:@"%@%@", language, @"/changed"];
  [self managedObjectOriginal_setLanguage:willSaveLanguage];
}

- (NSString *)language {
  NSString *savedLanguage = [self managedObjectOriginal_language];
  return savedLanguage;
}

```

### 存取
```

- (void)savePersonData {
  NSDictionary *personData = @{@"name" : @"qiaobahui",  @"language" : @"english"};
  [BHPerson createOrUpdateByDictionaryData:personData completion:^(BOOL success, NSError * _Nonnull error) {
    NSLog(@"SAVE SUCCEED!");
	}];
}

- (void)fetchPersonData {
  BHPerson *peron = [BHPerson current];
  NSLog(@"name: %@", peron.name);
  NSLog(@"language: %@", peron.language);
  /* 输出: name: qiaobahui
      language: english/changed
  */
}
```

### 交流与建议
*   GitHub：[https://github.com/BaHui](https://github.com/BaHui)
*   邮    箱：[qiaobahuiyouxiang@163.com](mailto:qiaobahuiyouxiang@163.com)
