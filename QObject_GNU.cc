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


class GNU_QObject: public QObject {
public:
     BOOL cv_blockSignals;
public:
     GNU_QObject(GNU_QObject *parent);
     GNU_QObject(void);
    ~GNU_QObject();
    
    BOOL GNU_blockSignals(BOOL block);
    BOOL GNU_signalsBlocked(void);
};

GNU_QObject::GNU_QObject(GNU_QObject *parent)
{
    __asm__("# GNU_QObject::GNU_QObject(GNU_QObject *parent)");
    if (parent == nullptr) {
        parent  = new GNU_QObject();
    }
    cv_blockSignals = false;
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

BOOL GNU_QObject::GNU_blockSignals(BOOL block) {
    __asm__("# GNU_QObject::GNU_blockSignals(bool block)");
    printf("blockser1: %d\n", block);                // line execute
    cv_blockSignals = block;
    printf("blockser2: %c\n", BOOL(cv_blockSignals));      // line *not* execute
    return cv_blockSignals;
}
BOOL GNU_QObject::GNU_signalsBlocked(void) {
    //__asm__("# GNU_QObject::GNU_signalsBlocked(void)");
    printf("issi: %d\n", cv_blockSignals);
    return cv_blockSignals;
}

