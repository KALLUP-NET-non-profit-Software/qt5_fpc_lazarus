// ----------------------------------------------------------------------------
// File:        qtWidget.h
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
#pragma once
#ifndef QT_WIDGET_H_
#define QT_WIDGET_H_

# include "pch.hpp"

BEGIN_NAMESPACE(FPC)
class QWidget: public QObject {
      QWidget* qWidgetParent;
    ::QWidget* qWidgetOwner;
public:
      QWidget(void);
     ~QWidget();
    
    ::QWidget* getOwner() const;

    void resize(int width, int height);
    void setWindowTitle(std::string title);
    void show(void);
};
END_NAMESPACE

#endif
