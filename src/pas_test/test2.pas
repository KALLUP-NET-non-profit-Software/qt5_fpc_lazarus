// ---------------------------------------------------------------------------
// File:        test2.pas
// Author:      Jens Kallup - paule32 <kallup-dev@web.de>
// Copyright:   (c) 2022 kallup non-profit
//
// License:     non-profit * only for education, and trial !!!
//              All modifications needs to query to the original author's (me).
//              You can use it at Your school as teacher for education.
//              But commercial usage is not allowed.
//
// Description: This library is a trial usage for simulate the COM technics on
//              differnt OS other than Microsoft's Windows product line.
//              Microsoft use the Registry to store application data during the
//              runtime. We store the information for the actual login session
//              into the available memory.
//
// Warning:     It is not 100% the same, so many aspects have differences.
//              Please sorry for that !
// ---------------------------------------------------------------------------

{$mode delphi}
program test2;

type
    TGUID = record
        Data1: DWORD;
        Data2: WORD;
        Data3: WORD;
        Data4: Array[0..7] of ShortInt;
    end;
    
    REFCLSIID = TGUID;
    REFIID    = TGUID;

    THandle   = NativeUInt;
    HINST     = THandle;
    HMODULE   = HINST;
var
//    iid  : REFCLSIID;
    hmod : HMODULE;

// ---------------------------------------------------------------------------
// win32api stuff:
// ---------------------------------------------------------------------------
function LoadLibrary  (lpLibFileName: PChar): HMODULE; stdcall; external 'kernel32.dll' name 'LoadLibraryA';
function LoadLibraryA (lpLibFileName: PChar): HMODULE; stdcall; external 'kernel32.dll' name 'LoadLibraryA';
function LoadLibraryW (lpLibFileName: PChar): HMODULE; stdcall; external 'kernel32.dll' name 'LoadLibraryW';

//function DllGetClassObject(rciid: REFCLSIID; riid: REFIID; ppv: PPointer): DWORD; cdecl; external 'test1.dll' name 'DllGetClassObject';

//function DLL_init: DWORD; cdecl; external 'qt5_fpc.dll' name 'DLL_init';

begin
  hmod := LoadLibraryA(PChar('qt5_fpc.dll'));
  if (hmod = 0) then
  begin
    WriteLn('test1.dll not loaded.');
    Halt(1);
  end;
//dll_init;
(*
  iid.Data1    := $01020304;
  iid.Data2    := $0102;
  iid.Data3    := $0102;
  iid.Data4[0] := $01; iid.Data4[1] := $01; iid.Data4[2] := $01;
  iid.Data4[3] := $01; iid.Data4[4] := $01; iid.Data4[5] := $01;
  iid.Data4[6] := $01; iid.Data4[7] := $01;

  //DllGetClassObject(iid,iid,nil^);
  *)
  FreeLibrary(hmod);
end.
