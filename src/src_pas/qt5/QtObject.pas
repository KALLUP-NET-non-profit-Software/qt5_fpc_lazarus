// ----------------------------------------------------------------------------
// File:        QtObject.pas
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
{$mode delphi}
unit QtObject;

interface

uses
  QtGlobal;

type
  QClass = class
  public
    FClassPtr: Pointer;
    ClassName: String;
  end;

  // ---------------------------------------------
  // QObject is the base class for all classes in
  // the Qt framework ...
  // ---------------------------------------------
  QObject = class(QClass)
  public
    constructor Create(parent: QObject); overload;
    constructor Create; overload;

    destructor Destroy; override;
  end;

implementation

// ----------------------------------------------------------------------------
// some magic is put in pascal files, and some other magic is put in cpp files.
// You will need the libraries and other tools from the Qt5 GUI-framework...
// ----------------------------------------------------------------------------
function  QObject_Create:                  Pointer ;  cdecl; external fpc_qt5Lib name 'QObject_Create';         overload;
function  QObject_Create(parent: QObject): Pointer ;  cdecl; external fpc_qt5Lib name 'QObject_Create_QObject'; overload;
procedure QObject_Destory(obj:             Pointer);  cdecl; external fpc_qt5Lib name 'QObject_Destroy';

const
  cstr_QObject = 'QObject';

procedure displayError(AString: String);
begin

  (*MessageBoxA(0, PChar('Error:' +
  #13#10 + 'Could not allocate memory for:' +
  #13#10 + AString + ' class.'),'Warning.',0);*)
end;

// ----------------------------------------------------------------------------
// @brief  This is the standard constructor for the QObject.
//         Here, we try to reserve memory for some steps later.
//
// @param  nothing
// @return pointer - the reference in memory for the class.
//
// @author paule32
// ----------------------------------------------------------------------------
constructor QObject.Create;
begin
  FClassPtr := QObject_Create;
  if FClassPtr = nil then
  begin
    displayError(cstr_QObject);
    exit;
  end;
  ClassName := cstr_QObject;
end;

// ----------------------------------------------------------------------------
// @author paule32
// ----------------------------------------------------------------------------
constructor QObject.Create(parent: QObject);
begin
  FClassPtr := QObject_Create(@parent);
  if FClassPtr = nil then
  begin
    displayError(cstr_QObject);
    exit;
  end;
  ClassName := cstr_QObject;
end;

// ----------------------------------------------------------------------------
// @brief  This is the destructor for the QObject.
//         Here, we try to free the used/allocated memory as more as possiböe.
//
// @param  nothing
// @return nothing
//
// @author paule32
// ----------------------------------------------------------------------------
destructor QObject.Destroy;
begin
  QObject_Destory(FClassPtr);
  inherited Destroy;
end;

begin
end.
