//
//  TLResponse.h
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TLResponseStatus) {
    TLResponseStatusRequestAborted,
    TLResponseStatusAssemblyUploading,
    TLResponseStatusAssemblyExecuting,
    TLResponseStatusAssemblyCanceled,
    TLResponseStatusAssemblyCompleted
};

typedef NS_ENUM(NSUInteger, TLResponseError) {
    TLResponseErrorNone,
    TLResponseErrorInvalidFormData,
    TLResponseErrorInvalidFileMetaData,
    TLResponseErrorNoParamsField,
    TLResponseErrorInvalidParamsField,
    TLResponseErrorNoObjectParamsField,
    TLResponseErrorNoAuthParameter,
    TLResponseErrorNoObjectAuthParameter,
    TLResponseErrorNoAuthKeyParameter,
    TLResponseErrorInvalidAuthKeyParameter,
    TLResponseErrorNoAuthExpiresParameter,
    TLResponseErrorInvalidAuthMaxSizeParameter,
    TLResponseErrorMaxSizeExceeded,
    TLResponseErrorInvalidAuthRefererParameter,
    TLResponseErrorRefererMismatch,
    TLResponseErrorInvalidAuthExpiresParameter,
    TLResponseErrorAuthExpired,
    TLResponseErrorNoSignatureField,
    TLResponseErrorInvalidSignature,
    TLResponseErrorGetAccountDbError,
    TLResponseErrorGetAccountUnknownAuthKey,
    TLResponseErrorNoCountry,
    TLResponseErrorNoPricing,
    TLResponseErrorBadPricing,
    TLResponseErrorIncompletePricing,
    TLResponseErrorBillLimitExceeded,
    TLResponseErrorCreditExceeded,
    TLResponseErrorTemplateDbError,
    TLResponseErrorTemplateNotFound,
    TLResponseErrorTemplateInvalidJson,
    TLResponseErrorServer404,
    TLResponseErrorFileMetaDataError,
    TLResponseErrorAssemblyNotFound,
    TLResponseErrorAssemblyNoSteps,
    TLResponseErrorAssemblyInvalidSteps,
    TLResponseErrorAssemblyEmptySteps,
    TLResponseErrorAssemblyStepInvalid,
    TLResponseErrorAssemblyStepInvalidUse,
    TLResponseErrorAssemblyStepUnknownUse,
    TLResponseErrorAssemblyInfinite,
    TLResponseErrorAssemblyStepNoRobot,
    TLResponseErrorAssemblyStepInvalidRobot,
    TLResponseErrorAssemblyStepUnkownRobot,
    TLResponseErrorAssemblyCrashed,
    TLResponseErrorInternalToolError,
    TLResponseErrorInternalCommandError,
    TLResponseErrorVideoEncodeInvalidWatermarkPosition,
    TLResponseErrorImportFileError,
    TLResponseErrorCloudFilesStoreAccessDenied,
    TLResponseErrorFileFilterInvalidOperator,
    TLResponseErrorFileFilterDeclinedFile,
    TLResponseErrorImageResizeInvalidWatermarkPosition,
    TLResponseErrorWorkerJobError,
    TLResponseErrorQueueDownloadFileError
};


@interface TLResponse : NSObject

- (id)initWithDictionary:(NSDictionary*)dictionary;

@property (nonatomic, assign) TLResponseStatus status;
@property (nonatomic, assign) TLResponseError error;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *assemblyId;
@property (nonatomic, strong) NSString *assemblyUrl;
@property (nonatomic, strong) NSString *assemblySslUrl;
@property (nonatomic, assign) double bytesReceived;
@property (nonatomic, assign) double bytesExpected;
@property (nonatomic, strong) NSString *clientAgent;
@property (nonatomic, strong) NSString *clientIp;
@property (nonatomic, strong) NSString *clientReferer;
@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, assign) double uploadDuration;
@property (nonatomic, assign) double executionDuration;
@property (nonatomic, strong) NSDictionary *fields;
@property (nonatomic, strong) NSArray *uploads;

@end
