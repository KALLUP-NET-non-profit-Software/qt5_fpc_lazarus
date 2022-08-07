// ----------------------------------------------------------------------------
// File:        QString_FPC.pas
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
{$mode delphi}{$H+}
unit QString_FPC;

interface

uses
  QObject_FPC, QtGlobal_FPC;
  
type
  QString = class(QObject)
  public
    constructor Create;
    destructor Destroy;
  end;

implementation

function  FPC_QString_Create: Pointer; cdecl; external fpc_qt5Lib name 'xx';
procedure FPC_QString_Destroy; cdecl; external fpc_qt5Lib name '';

constructor QString.Create;
begin
  FClassPtr := FPC_QString_Create;
  if FClassPtr = nil then
  begin
    MessageBox(0,'Error:' +
    #13#10 + 'Could not allocate memory for QApplication' +
    #13#10 + 'object.', 'Warning', 0);
    exit;
  end;
end;

destructor QString.Destroy;
begin
  FPC_QString_Destroy(FClassPtr);
end;

begin
end.
