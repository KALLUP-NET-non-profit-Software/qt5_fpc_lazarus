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
    iid  : REFCLSIID;
    hmod : HMODULE;

// ---------------------------------------------------------------------------
// win32api stuff:
// ---------------------------------------------------------------------------
function LoadLibrary  (lpLibFileName: PWideChar): HMODULE; stdcall; external 'kernel32.dll' name 'LoadLibraryA';
function LoadLibraryA (lpLibFileName: PAnsiChar): HMODULE; stdcall; external 'kernel32.dll' name 'LoadLibraryA';
function LoadLibraryW (lpLibFileName: PWideChar): HMODULE; stdcall; external 'kernel32.dll' name 'LoadLibraryW';

function DllGetClassObject(rciid: REFCLSIID; riid: REFIID; ppv: PPointer): DWORD; cdecl; external 'test1.dll' name 'DllGetClassObject';

begin
  hmod := LoadLibraryA(PAnsiChar('test1.dll'));
  if (hmod = 0) then
  begin
    WriteLn('test1.dll not loaded.');
    Halt(1);
  end;

  iid.Data1    := $01020304;
  iid.Data2    := $0102;
  iid.Data3    := $0102;
  iid.Data4[0] := $01; iid.Data4[1] := $01; iid.Data4[2] := $01;
  iid.Data4[3] := $01; iid.Data4[4] := $01; iid.Data4[5] := $01;
  iid.Data4[6] := $01; iid.Data4[7] := $01;

  //DllGetClassObject(iid,iid,nil^);
  
  FreeLibrary(hmod);
end.
