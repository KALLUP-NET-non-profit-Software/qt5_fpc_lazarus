// ----------------------------------------------------------------------------
// File:        QObject_GNU.cc
// Author:      Jens Kallup - paule32 <kallup-dev@web.de>
// Copyright:   (c) 2022 kallup non-profit
//
// License:     non-profit * only for education, and trial !!!
//              All modifications needs to query to the original author's (me).
//              You can use it at Your school as teacher for education.
//              But commercial usage is not allowed.
//
// Description: Qt5 is a GUI framework formed by Nokia in 2011, Norway.
//              This implementation is not complete. But can be a step,
//              to depth into the magic of gui programming with FPC-OOP
// ----------------------------------------------------------------------------
#include <QObject>
#include <windows.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

class GNU_QObject: public QObject {
public:
     GNU_QObject(GNU_QObject *parent);
     GNU_QObject(void);
    ~GNU_QObject();
};

GNU_QObject::GNU_QObject(GNU_QObject *parent) {
    __asm__("# GNU_QObject::GNU_QObject(GNU_QObject *parent)");
    if (parent == nullptr) {
        parent  = new GNU_QObject();
    }
    printf("zuzu\n");
}

GNU_QObject::GNU_QObject(void)
{
    __asm__("# GNU_QObject::GNU_QObject(void)");
    printf("qobject ctor\n");
}

GNU_QObject::~GNU_QObject(void) {
    __asm__("# GNU_QObject::~GNU_QObject(void)");
}


BOOL WINAPI DllMain(
    HINSTANCE hinstDLL,  // handle to DLL module
    DWORD fdwReason,     // reason for calling function
    LPVOID lpReserved )  // reserved
{
printf("enter dll\n");
return TRUE;
}
