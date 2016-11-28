/**
 * Copyright (C) 2015 Deepin Technology Co., Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 **/

#include "appupdateinfo.h"

AppUpdateInfo::AppUpdateInfo()
{

}

const QDBusArgument &operator>>(const QDBusArgument &argument, AppUpdateInfo &info)
{
    argument.beginStructure();
    argument >> info.m_packageId;
    argument >> info.m_name;
    argument >> info.m_icon;
    argument >> info.m_currentVersion;
    argument >> info.m_avilableVersion;
    argument.endStructure();

    return argument;
}

QDBusArgument &operator<<(QDBusArgument &argument, const AppUpdateInfo &info)
{
    argument.beginStructure();
    argument << info.m_packageId;
    argument << info.m_name;
    argument << info.m_icon;
    argument << info.m_currentVersion;
    argument << info.m_avilableVersion;
    argument.endStructure();

    return argument;
}

QDebug operator<<(QDebug argument, const AppUpdateInfo &info)
{
    argument << "packageId: " << info.m_packageId;
    argument << "name: " << info.m_name;
    argument << "icon: " << info.m_icon;
    argument << "currentVer: " << info.m_currentVersion;
    argument << "avilableVer: " << info.m_avilableVersion;

    return argument;
}

void registerAppUpdateInfoMetaType()
{
    qRegisterMetaType<AppUpdateInfo>();
    qDBusRegisterMetaType<AppUpdateInfo>();
    qRegisterMetaType<AppUpdateInfoList>();
    qDBusRegisterMetaType<AppUpdateInfoList>();
}
