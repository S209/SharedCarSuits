//
//  WPFileManager.m
//  WeiXinMovie
//
//  Created by qpwang on 6/13/15.
//  Copyright (c) 2015 qpwang. All rights reserved.
//

#import "WPFileManager.h"
#include <sys/xattr.h>

NSString * const kDOUFMExpireDatesKey = @"WPFileManager.expireDates";

static NSLock *gWPFMSyncToUserDefaultsLock = nil;

@interface WPFileManager()

@property (nonatomic, strong) NSMutableDictionary *expireDateDictionary;
@property (nonatomic, assign) WPFileManagerType type;

@end

@implementation WPFileManager

#pragma mark - Shared Instance

+(WPFileManager *)shareCacheFileInstance
{
  static WPFileManager *cacheFileInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    cacheFileInstance = [[WPFileManager alloc] initWithType:WPFileManagerTypeCache];
  });
  return cacheFileInstance;
}

+(WPFileManager *)shareLibraryFileInstance
{
    static WPFileManager *libraryInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        libraryInstance = [[WPFileManager alloc] initWithType:WPFileManagerTypeLibrary];
    });
    return libraryInstance;
}

+(WPFileManager *)shareOfflineFileInstance
{
  static WPFileManager *offlineInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    offlineInstance = [[WPFileManager alloc] initWithType:WPFileManagerTypeOffline];
  });
  return offlineInstance;
}

+(WPFileManager *)shareTmpFileInstance
{
  static WPFileManager *tmpFileInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    tmpFileInstance = [[WPFileManager alloc] initWithType:WPFileManagerTypeTmp];
  });
  return tmpFileInstance;
}
+(WPFileManager *)shareWXMovieFileInstance
{
    static WPFileManager *wxmovieFileInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        wxmovieFileInstance = [[WPFileManager alloc] initWithType:WPFileManagerTypeWXMovie];
    });
    return wxmovieFileInstance;
}


#pragma mark - init
- (id)initWithType:(WPFileManagerType)type
{
    self = [super init];
    if (self) {
        self.type = type;
        switch (self.type) {
            case WPFileManagerTypeCache:
                _baseFilePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                break;
            case WPFileManagerTypeLibrary:
                _baseFilePath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                break;
            case WPFileManagerTypeOffline:
                _baseFilePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/offline"];
                break;
            case WPFileManagerTypeTmp:
                _baseFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
                break;
            case WPFileManagerTypeWXMovie:
                _baseFilePath = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/wxmoive"];
                break;
                
        }
        
    }
    return self;
}

#pragma mark - directory manager

-(NSString *)parseParentDirectoryAtPath:(NSString *)path
{
  NSString *parentDirPath = [self absolutePathWithPath:path];
  NSMutableArray *pathArray = [NSMutableArray arrayWithArray:[parentDirPath componentsSeparatedByString:@"/"]];
  if ([pathArray count] > 1) {
    [pathArray removeLastObject];
    NSString *parentDirPath = [pathArray componentsJoinedByString:@"/"];
    return parentDirPath;
  } else {
    return nil;
  }
}

-(BOOL)createParentDirectoriesAtPath:(NSString *)path
{
  NSString *parentDirPath = [self parseParentDirectoryAtPath:path];
  BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:parentDirPath withIntermediateDirectories:YES attributes:nil error:NULL];
  
  NSURL *pathURL = [NSURL fileURLWithPath:parentDirPath];
  [self addSkipBackupAttributeToItemAtURL:pathURL];
  return success;
}

-(BOOL)parentDirectoriesExistAtPath:(NSString *)path
{
  NSString *parentDirPath = [self parseParentDirectoryAtPath:path];
  return [[NSFileManager defaultManager] fileExistsAtPath:parentDirPath];
}

#pragma mark - Write File
-(BOOL)writeData:(NSData *)data atPath:(NSString *)path
{
  return [self writeData:data atPath:path expire:0];
}

-(BOOL)writeString:(NSString *)string atPath:(NSString *)path
{
  return [self writeString:string atPath:path expire:0];
}

-(BOOL)writeDictionary:(NSDictionary *)dictionary atPath:(NSString *)path
{
  return [self writeDictionary:dictionary atPath:path expire:0];
}

- (BOOL) writeArray:(NSArray *)array atPath:(NSString *)path
{
  return [self writeArray:array atPath:path expire:0];
}

- (BOOL)writeContent:(NSObject *)content atPath:(NSString *)path
{
    return [self writeContent:content atPath:path expire:0];
}

-(BOOL)writeData:(NSData *)data atPath:(NSString *)path expire:(NSTimeInterval)expire
{
  if (![self parentDirectoriesExistAtPath:path]) {
    [self createParentDirectoriesAtPath:path];
  }
  
  NSString *finalPath = [self absolutePathWithPath:path];
  
  [self setExpireTimeInterval:expire forFilePath:path];
  
  return [data writeToFile:finalPath atomically:YES];
}

-(BOOL)writeDictionary:(NSDictionary *)dictionary atPath:(NSString *)path expire:(NSTimeInterval)expire
{
  if (![self parentDirectoriesExistAtPath:path]) {
    [self createParentDirectoriesAtPath:path];
  }
  
  NSString *finalPath = [self absolutePathWithPath:path];
  
  [self setExpireTimeInterval:expire forFilePath:path];
  
  return [dictionary writeToFile:finalPath atomically:YES];
}

-(BOOL)writeString:(NSString *)string atPath:(NSString *)path expire:(NSTimeInterval)expire {
  if (![self parentDirectoriesExistAtPath:path]) {
    [self createParentDirectoriesAtPath:path];
  }
  
  NSString *finalPath = [self absolutePathWithPath:path];
  
  [self setExpireTimeInterval:expire forFilePath:path];
  
  return [string writeToFile:finalPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
}

- (BOOL) writeArray:(NSArray *)array atPath:(NSString *)path expire:(NSTimeInterval)expire
{
  if (![self parentDirectoriesExistAtPath:path]) {
    [self createParentDirectoriesAtPath:path];
  }
  
  NSString *finalPath = [self absolutePathWithPath:path];
  
  [self setExpireTimeInterval:expire forFilePath:path];
  
  return [array writeToFile:finalPath atomically:YES];
}

- (BOOL)writeContent:(NSObject *)content atPath:(NSString *)path expire:(NSTimeInterval)expire
{
    if (![content conformsToProtocol:@protocol(NSCoding)]) {
//        [NSException raise:@"Invalid content type" format:@"content of type %@ is not handled.", NSStringFromClass([content class])];
        NSLog(@"%@", [NSString stringWithFormat:@"content of type %@ is not handled.", NSStringFromClass([content class])]);
        return NO;
    }
    if (![self parentDirectoriesExistAtPath:path]) {
        [self createParentDirectoriesAtPath:path];
    }
    
    NSString *finalPath = [self absolutePathWithPath:path];
    
    [self setExpireTimeInterval:expire forFilePath:path];
    
    return [NSKeyedArchiver archiveRootObject:content toFile:finalPath];
}

#pragma mark - Delete
-(BOOL)deleteFileAtPath:(NSString *)path
{
  NSString *finalPath = [self absolutePathWithPath:path];
  
//  [self.expireDateDictionary removeObjectForKey:path];
//  [self syncExpiredTimeToUserDefaults];
  
  return [[NSFileManager defaultManager] removeItemAtPath:finalPath error:NULL];
}

- (NSArray *)fileNamesInParentDirectory:(NSString *)path
{
  NSString *directoryPath = [self absolutePathWithPath:path];
  NSString* filePath;
  NSDirectoryEnumerator* enumerator = [[NSFileManager defaultManager] enumeratorAtPath:directoryPath];
  NSMutableArray *fileNames = [NSMutableArray array];
  while (filePath = [enumerator nextObject])
  {
    BOOL isDirectory = NO;
    if ([[NSFileManager defaultManager] fileExistsAtPath: [NSString stringWithFormat:@"%@/%@",directoryPath,filePath]
                                             isDirectory: &isDirectory]) {
      if (!isDirectory)
      {
        [fileNames addObject:[filePath lastPathComponent]];
      }
    }
  }
  return fileNames;
}

#pragma mark - Read Files
- (NSString *)readStringAtPath:(NSString *)path
{
  NSString *finalPath = [self absolutePathWithPath:path];
  if (!finalPath ||
      ![self fileVaildAtFilePath:path]) {
    return nil;
  }
  return [NSString stringWithContentsOfFile:finalPath encoding:NSUTF8StringEncoding error:NULL];
}

- (NSDictionary *)readDictionaryAtPath:(NSString *)path
{
  NSString *finalPath = [self absolutePathWithPath:path];
  if (!finalPath ||
      ![self fileVaildAtFilePath:path]) {
    return nil;
  }
  return [NSDictionary dictionaryWithContentsOfFile:finalPath];
}

- (NSData *)readDataAtPath:(NSString *)path
{
  NSString *finalPath = [self absolutePathWithPath:path];
  if (!finalPath ||
      ![self fileVaildAtFilePath:path]) {
    return nil;
  }
  return [NSData dataWithContentsOfFile:finalPath];
}

- (NSArray *)readArrayAtPath:(NSString *)path
{
  NSString *finalPath = [self absolutePathWithPath:path];
  if (!finalPath ||
      ![self fileVaildAtFilePath:path]) {
    return nil;
  }
  return [NSArray arrayWithContentsOfFile:finalPath];
}

- (NSObject *)readContentAtPath:(NSString *)path
{
    NSString *finalPath = [self absolutePathWithPath:path];
    if (!finalPath ||
        ![self fileVaildAtFilePath:path]) {
        return nil;
    }
    return [NSKeyedUnarchiver unarchiveObjectWithFile:finalPath];
}

#pragma mark - expire
- (void)setExpireTimeInterval:(NSTimeInterval)expireTimeInterval forFilePath:(NSString *)filePath
{
//    if (expireTimeInterval > 0) {
//        NSDate *expireDate = [NSDate dateWithTimeIntervalSinceNow:expireTimeInterval];
//        [self.expireDateDictionary setObject:expireDate forKey:filePath];
//        [self syncExpiredTimeToUserDefaults];
//    }
}

- (BOOL)cleanExpireFile
{
  NSArray *allFilePathArray = [NSArray arrayWithArray:self.expireDateDictionary.allKeys];
  for (NSString *fileKeyPath in allFilePathArray) {
    if (![self fileVaildAtFilePath:fileKeyPath]) {
      if (![self deleteFileAtPath:fileKeyPath]) {
        return NO;
      }
    }
  }
  return YES;
}

#pragma mark - File Vaild
- (BOOL) fileExpiredAtFilePath:(NSString *)filePath
{
  NSDate *expiredDate = [self.expireDateDictionary objectForKey:filePath];
  if (!expiredDate ||
      [expiredDate timeIntervalSinceNow] >= 0) {
    return NO;
  } else {
    return YES;
  }
}

- (BOOL) fileExistsAtFilePath:(NSString *)filePath
{
  NSString *finalPath = [self absolutePathWithPath:filePath];
  return [[NSFileManager defaultManager] fileExistsAtPath:finalPath];
}

- (BOOL) fileVaildAtFilePath:(NSString *)filePath
{
  if ([self fileExistsAtFilePath:filePath] &&
      ![self fileExpiredAtFilePath:filePath]) {
    return YES;
  }
  return NO;
}

#pragma mark - util
- (NSString *) absolutePathWithPath:(NSString *)path
{
  NSString *finalPath = [self.baseFilePath stringByAppendingPathComponent:path];
  return finalPath;
}

- (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL {
  
//    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
    
    NSError *error = nil;
    
    BOOL success = [URL setResourceValue:[NSNumber numberWithBool:YES]
                                  forKey: NSURLIsExcludedFromBackupKey
                                   error:&error];
    if (!success) {
        NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
    }

    return success;
}

#pragma mark - private
- (void)syncExpiredTimeToUserDefaults
{
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    gWPFMSyncToUserDefaultsLock = [[NSLock alloc] init];
  });
  
  [gWPFMSyncToUserDefaultsLock lock];
  
  NSDictionary *dictionary = [[NSUserDefaults standardUserDefaults] objectForKey:kDOUFMExpireDatesKey];
  if (dictionary == nil) dictionary = [NSDictionary dictionary];

  NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithDictionary:dictionary];
  [mutableDict setObject:[self.expireDateDictionary copy] forKey:[NSString stringWithFormat:@"%@", @(self.type)]];
  [[NSUserDefaults standardUserDefaults] setObject:[mutableDict copy] forKey:kDOUFMExpireDatesKey];
  [[NSUserDefaults standardUserDefaults] synchronize];
  [gWPFMSyncToUserDefaultsLock unlock];
}

#pragma mark - property getter
- (NSMutableDictionary *)expireDateDictionary
{
    if (!_expireDateDictionary) {
        NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:kDOUFMExpireDatesKey][[NSString stringWithFormat:@"%@", @(self.type)]];
        if (dict) {
            _expireDateDictionary = [dict mutableCopy];
        } else {
            _expireDateDictionary = [NSMutableDictionary new];
        }
    }
    return _expireDateDictionary;
}

@end
