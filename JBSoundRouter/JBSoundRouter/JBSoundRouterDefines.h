//
//  JBSoundRouterDefines.h
//  SpikaEnterprise
//
//  Created by Josip Bernat on 1/26/15.
//  Copyright (c) 2015 Clover-Studio. All rights reserved.
//

#ifndef SpikaEnterprise_JBSoundRouterDefines_h
#define SpikaEnterprise_JBSoundRouterDefines_h

typedef NS_ENUM (NSInteger, JBSoundRoute) {

    JBSoundRouteNotDefined  = 0,
    JBSoundRouteSpeaker,
    JBSoundRouteReceiver
};

#define kJBSoundRouterDidChangeRouteNotification    @"JBSoundRouterDidChangeRouteNotification"

#endif
