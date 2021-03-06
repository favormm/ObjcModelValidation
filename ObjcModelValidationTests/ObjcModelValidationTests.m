//
//  ObjcModelValidationTests.m
//  ObjcModelValidationTests
//
//  Created by Piet Brauer on 12.06.13.
//  Copyright (c) 2013 Piet Brauer. All rights reserved.
//

#import "SampleModel.h"
#import "CMFactory.h"
#import "Kiwi.h"

SPEC_BEGIN(SampleModelTests)

    __block SampleModel *model;
    CMFactory *factory = [CMFactory forClass:[SampleModel class]];

    [factory addToField:@"ageNumber" value:^{
        return @4;
    }];

    [factory addToField:@"nameString" value:^id{
        return @"Piet";
    }];

    beforeEach(^{
        model = [factory build];
    });

    specify(^{
        [model save];
        [model shouldNotBeNil];
    });

SPEC_END