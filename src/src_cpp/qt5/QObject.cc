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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

namespace FPC {
// ----------------------------------------------------------------------------
// global data types ...
// ----------------------------------------------------------------------------
typedef uint8_t  BYTE    ;
typedef uint16_t WORD    ;
typedef uint32_t DWORD   ;
typedef uint64_t QWORD   ;

typedef BYTE     ByteBool;
typedef WORD     WordBool;
typedef DWORD    LongBool;

typedef BYTE     BOOLEAN ;
typedef ByteBool BOOL    ;

class QObject: public QObject {
public:
     BOOL cv_blockSignals;
public:
     QObject(QObject *parent);
     QObject(void);
    ~QObject();
    
    BOOL GNU_blockSignals(BOOL block);
    BOOL GNU_signalsBlocked(void);
};

QObject::QObject(QObject *parent)
{
    if (parent == nullptr) {
        parent  = new GNU_QObject();
    }
    cv_blockSignals = false;
    printf("zuzu\n");
}

QObject::QObject(void)
{
    printf("qobject ctor\n");
}

QObject::~QObject(void) {
    __asm__("# GNU_QObject::~GNU_QObject(void)");
}

BOOL QObject::blockSignals(BOOL block) {
    printf("blockser1: %d\n", block);                // line execute
    cv_blockSignals = block;
    printf("blockser2: %c\n", BOOL(cv_blockSignals));      // line *not* execute
    return cv_blockSignals;
}
BOOL QObject::signalsBlocked(void) {
    printf("issi: %d\n", cv_blockSignals);
    return cv_blockSignals;
}

extern "C" void*
__declspec(dllexport) QObject_Create(void) {
    printf("ctor () wrapper\n");
    return nullptr;
}

extern "C" void*
__declspec(dllexport) QObject_Create_QObject(void *pptr) {
    printf("ctor (QObject) wrapper\n");
    return nullptr;
}

extern "C" void
__declspec(dllexport) QObject_Destroy(void) {
    printf("dtor destructor\n");
}

extern "C" BOOL
__declspec(dllexport) QObject_blockSignals(BOOL block) {
    printf("blocksignals wrapper\n");
    return true;
}

extern "C" BOOL
__declspec(dllexport) QObject_signalsBlocked(BOOL block) {
    printf("signals wrapper\n");
    return false;
}

}  // namespace FPC
