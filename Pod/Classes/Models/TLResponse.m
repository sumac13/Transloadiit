//
//  TLResponse.m
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import "TLResponse.h"
#import "TLUpload.h"
#import "NSDate+Transloadit.h"

@implementation TLResponse

#pragma mark - Constructor

- (id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self) {
        [self setAttributesFromDictionary:dictionary];
    }
    return self;
}


#pragma mark - Setters

- (void)setAttributesFromDictionary:(NSDictionary*)dictionary
{
    if (dictionary[@"ok"]) [self setStatusFromString:dictionary[@"ok"]];
    if (dictionary[@"error"]) [self setErrorFromString:dictionary[@"error"]];
    if (dictionary[@"message"]) self.message = dictionary[@"message"];
    if (dictionary[@"assembly_id"]) self.assemblyId = dictionary[@"assembly_id"];
    if (dictionary[@"assembly_url"]) self.assemblyUrl = dictionary[@"assembly_url"];
    if (dictionary[@"assembly_ssl_url"]) self.assemblySslUrl = dictionary[@"assembly_ssl_url"];
    if (dictionary[@"bytes_received"] && [dictionary[@"bytes_received"] isKindOfClass:[NSNumber class]]) self.bytesReceived = [dictionary[@"bytes_received"] doubleValue];
    if (dictionary[@"bytes_expected"] && [dictionary[@"bytes_expected"] isKindOfClass:[NSNumber class]]) self.bytesExpected = [dictionary[@"bytes_expected"] doubleValue];
    if (dictionary[@"client_agent"]) self.clientAgent = dictionary[@"client_agent"];
    if (dictionary[@"client_ip"]) self.clientIp = dictionary[@"client_ip"];
    if (dictionary[@"client_referer"]) self.clientIp = dictionary[@"client_referer"];
    if (dictionary[@"start_date"]) self.startDate = [NSDate dateFromTransloaditString:dictionary[@"start_date"]];
    if (dictionary[@"upload_duration"] && [dictionary[@"upload_duration"] isKindOfClass:[NSNumber class]]) self.uploadDuration = [dictionary[@"upload_duration"] doubleValue];
    if (dictionary[@"execution_duration"] && [dictionary[@"execution_duration"] isKindOfClass:[NSNumber class]]) self.executionDuration = [dictionary[@"execution_duration"] doubleValue];
    if (dictionary[@"fields"]) self.fields = dictionary[@"fields"];
    NSMutableArray *uploads = [NSMutableArray new];
    if (dictionary[@"uploads"]) {
        for (NSDictionary *upload in dictionary[@"upload"]) {
            [uploads addObject:[TLUpload uploadFromDictionary:upload]];
        }
    }
    self.uploads = uploads;
}

- (void)setStatusFromString:(NSString*)statusString
{
    if ([statusString isEqualToString:@"REQUEST_ABORTED"]) self.status = TLResponseStatusRequestAborted;
    else if ([statusString isEqualToString:@"ASSEMBLY_UPLOADING"]) self.status = TLResponseStatusAssemblyUploading;
    else if ([statusString isEqualToString:@"ASSEMBLY_EXECUTING"]) self.status = TLResponseStatusAssemblyExecuting;
    else if ([statusString isEqualToString:@"ASSEMBLY_CANCELED"]) self.status = TLResponseStatusAssemblyCanceled;
    else if ([statusString isEqualToString:@"ASSEMBLY_COMPLETED"]) self.status = TLResponseStatusAssemblyCompleted;
    else self.status = TLResponseStatusUnknown;
}

- (void)setErrorFromString:(NSString*)errorString
{
    if (!errorString) self.error = TLResponseErrorNone;
    else if ([errorString isEqualToString:@"INVALID_FORM_DATA"]) self.error = TLResponseErrorInvalidFormData;
    else if ([errorString isEqualToString:@"INVALID_FILE_META_DATA"]) self.error = TLResponseErrorInvalidFileMetaData;
    else if ([errorString isEqualToString:@"NO_PARAMS_FIELD"]) self.error = TLResponseErrorNoParamsField;
    else if ([errorString isEqualToString:@"INVALID_PARAMS_FIELD"]) self.error = TLResponseErrorInvalidParamsField;
    else if ([errorString isEqualToString:@"NO_OBJECT_PARAMS_FIELD"]) self.error = TLResponseErrorNoObjectParamsField;
    else if ([errorString isEqualToString:@"NO_AUTH_PARAMETER"]) self.error = TLResponseErrorNoAuthParameter;
    else if ([errorString isEqualToString:@"NO_OBJECT_AUTH_PARAMETER"]) self.error = TLResponseErrorNoObjectAuthParameter;
    else if ([errorString isEqualToString:@"NO_AUTH_KEY_PARAMETER"]) self.error = TLResponseErrorNoAuthKeyParameter;
    else if ([errorString isEqualToString:@"INVALID_AUTH_KEY_PARAMETER"]) self.error = TLResponseErrorInvalidAuthKeyParameter;
    else if ([errorString isEqualToString:@"NO_AUTH_EXPIRES_PARAMETER"]) self.error = TLResponseErrorNoAuthExpiresParameter;
    else if ([errorString isEqualToString:@"INVALID_AUTH_MAX_SIZE_PARAMETER"]) self.error = TLResponseErrorInvalidAuthMaxSizeParameter;
    else if ([errorString isEqualToString:@"MAX_SIZE_EXCEEDED"]) self.error = TLResponseErrorMaxSizeExceeded;
    else if ([errorString isEqualToString:@"INVALID_AUTH_REFERER_PARAMETER"]) self.error = TLResponseErrorInvalidAuthRefererParameter;
    else if ([errorString isEqualToString:@"REFERER_MISMATCH"]) self.error = TLResponseErrorRefererMismatch;
    else if ([errorString isEqualToString:@"INVALID_AUTH_EXPIRES_PARAMETER"]) self.error = TLResponseErrorInvalidAuthExpiresParameter;
    else if ([errorString isEqualToString:@"AUTH_EXPIRED"]) self.error = TLResponseErrorAuthExpired;
    else if ([errorString isEqualToString:@"NO_SIGNATURE_FIELD"]) self.error = TLResponseErrorNoSignatureField;
    else if ([errorString isEqualToString:@"INVALID_SIGNATURE"]) self.error = TLResponseErrorInvalidSignature;
    else if ([errorString isEqualToString:@"GET_ACCCOUNT_DB_ERROR"]) self.error = TLResponseErrorGetAccountDbError;
    else if ([errorString isEqualToString:@"GET_ACCOUNT_UNKNOWN_AUTH_KEY"]) self.error = TLResponseErrorGetAccountUnknownAuthKey;
    else if ([errorString isEqualToString:@"NO_COUNTRY"]) self.error = TLResponseErrorNoCountry;
    else if ([errorString isEqualToString:@"NO_PRICING"]) self.error = TLResponseErrorNoPricing;
    else if ([errorString isEqualToString:@"BAD_PRICING"]) self.error = TLResponseErrorBadPricing;
    else if ([errorString isEqualToString:@"INCOMPLETE_PRICING"]) self.error = TLResponseErrorIncompletePricing;
    else if ([errorString isEqualToString:@"BILL_LIMIT_EXCEEDED"]) self.error = TLResponseErrorBillLimitExceeded;
    else if ([errorString isEqualToString:@"CREDIT_EXCEEDED"]) self.error = TLResponseErrorCreditExceeded;
    else if ([errorString isEqualToString:@"TEMPLATE_DB_ERROR"]) self.error = TLResponseErrorTemplateDbError;
    else if ([errorString isEqualToString:@"TEMPLATE_NOT_FOUND"]) self.error = TLResponseErrorTemplateNotFound;
    else if ([errorString isEqualToString:@"TEMPLATE_INVALID_JSON"]) self.error = TLResponseErrorTemplateInvalidJson;
    else if ([errorString isEqualToString:@"SERVER_404"]) self.error = TLResponseErrorServer404;
    else if ([errorString isEqualToString:@"FILE_META_DATA_ERROR"]) self.error = TLResponseErrorFileMetaDataError;
    else if ([errorString isEqualToString:@"ASSEMBLY_NOT_FOUND"]) self.error = TLResponseErrorAssemblyNotFound;
    else if ([errorString isEqualToString:@"ASSEMBLY_NO_STEPS"]) self.error = TLResponseErrorAssemblyNoSteps;
    else if ([errorString isEqualToString:@"ASSEMBLY_INVALID_STEPS"]) self.error = TLResponseErrorAssemblyInvalidSteps;
    else if ([errorString isEqualToString:@"ASSEMBLY_EMPTY_STEPS"]) self.error = TLResponseErrorAssemblyEmptySteps;
    else if ([errorString isEqualToString:@"ASSEMBLY_STEP_INVALID"]) self.error = TLResponseErrorAssemblyStepInvalid;
    else if ([errorString isEqualToString:@"ASSEMBLY_STEP_INVALID_USE"]) self.error = TLResponseErrorAssemblyStepInvalidUse;
    else if ([errorString isEqualToString:@"ASSEMBLY_STEP_UNKNOWN_USE"]) self.error = TLResponseErrorAssemblyStepUnknownUse;
    else if ([errorString isEqualToString:@"ASSEMBLY_INFINITE"]) self.error = TLResponseErrorAssemblyInfinite;
    else if ([errorString isEqualToString:@"ASSEMBLY_STEP_NO_ROBOT"]) self.error = TLResponseErrorAssemblyStepNoRobot;
    else if ([errorString isEqualToString:@"ASSEMBLY_STEP_INVALID_ROBOT"]) self.error = TLResponseErrorAssemblyStepInvalidRobot;
    else if ([errorString isEqualToString:@"ASSEMBLY_STEP_UNKNOWN_ROBOT"]) self.error = TLResponseErrorAssemblyStepUnkownRobot;
    else if ([errorString isEqualToString:@"ASSEMBLY_CRASHED"]) self.error = TLResponseErrorAssemblyCrashed;
    else if ([errorString isEqualToString:@"INTERNAL_TOOL_ERROR"]) self.error = TLResponseErrorInternalToolError;
    else if ([errorString isEqualToString:@"INTERNAL_COMMAND_ERROR"]) self.error = TLResponseErrorInternalCommandError;
    else if ([errorString isEqualToString:@"VIDEO_ENCODE_INVALID_WATERMARK_POSITION"]) self.error = TLResponseErrorVideoEncodeInvalidWatermarkPosition;
    else if ([errorString isEqualToString:@"IMPORT_FILE_ERROR"]) self.error = TLResponseErrorImportFileError;
    else if ([errorString isEqualToString:@"CLOUDFILES_STORE_ACCESS_DENIED"]) self.error = TLResponseErrorCloudFilesStoreAccessDenied;
    else if ([errorString isEqualToString:@"CLOUDFILES_STORE_ERROR"]) self.error = TLResponseErrorCloudFilesStoreError;
    else if ([errorString isEqualToString:@"FILE_FILTER_INVALID_OPERATOR"]) self.error = TLResponseErrorFileFilterInvalidOperator;
    else if ([errorString isEqualToString:@"FILE_FILTER_DECLINED_FILE"]) self.error = TLResponseErrorFileFilterDeclinedFile;
    else if ([errorString isEqualToString:@"IMAGE_RESIZE_INVALID_WATERMARK_POSITION"]) self.error = TLResponseErrorImageResizeInvalidWatermarkPosition;
    else if ([errorString isEqualToString:@"WORKER_JOB_ERROR"]) self.error = TLResponseErrorWorkerJobError;
    else if ([errorString isEqualToString:@"QUEUE_DOWNLOAD_FILE_ERROR"]) self.error = TLResponseErrorQueueDownloadFileError;
    else self.error = TLResponseErrorNone;
}

@end
