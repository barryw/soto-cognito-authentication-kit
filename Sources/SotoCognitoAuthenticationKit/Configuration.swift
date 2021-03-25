//===----------------------------------------------------------------------===//
//
// This source file is part of the Soto for AWS open source project
//
// Copyright (c) 2020-2021 the Soto project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of Soto project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import SotoCognitoIdentity
import SotoCognitoIdentityProvider
import JWTKit

/// Struct that includes configuration for AWS Cognito authentication.
///
/// See [Cognito Userpool](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html)
/// documention for more information.
public struct CognitoConfiguration {
    /// user pool id
    public let userPoolId: String
    /// app client it
    public let clientId: String
    /// app client secret
    public let clientSecret: String?
    /// Cognito Identity Provider client
    public let cognitoIDP: CognitoIdentityProvider
    /// region userpool is in, can get this from the client
    public var region: Region { return cognitoIDP.region }

    /// initializer
    public init(userPoolId: String, clientId: String, clientSecret: String? = nil, cognitoIDP: CognitoIdentityProvider) {
        self.userPoolId = userPoolId
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.cognitoIDP = cognitoIDP
    }
}

/// Structs that include the configuration setup for AWS Cognito Identity.
///
/// See [Cognito Identity Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-identity.html)
/// documention for more information.
public struct CognitoIdentityConfiguration {
    /// cognito identity pool id
    public let identityPoolId: String
    /// identity provider
    public let identityProvider: String
    /// Cognito Identity client
    public let cognitoIdentity: CognitoIdentity

    /// initializer
    public init(identityPoolId: String, identityProvider: String, cognitoIdentity: CognitoIdentity) {
        self.identityPoolId = identityPoolId
        self.identityProvider = identityProvider
        self.cognitoIdentity = cognitoIdentity
    }
    
    /// initializer when using a AWS Cognito user pool for identification
    public init(identityPoolId: String, userPoolId: String, region: Region, cognitoIdentity: CognitoIdentity) {
        self.identityPoolId = identityPoolId
        self.identityProvider = "cognito-idp.\(region.rawValue).amazonaws.com/\(userPoolId)"
        self.cognitoIdentity = cognitoIdentity
    }
}
