// -----------------------------------------------------------------------
// RTL.PAS - this file is part of the Objective FPC Runtime.
//
// (c) 2022 by Jens Kallup
// all rights reserved.
//
// only for education, and non-profit use !!!
// -----------------------------------------------------------------------
{$IFDEF FPC}
  {$MODE delphi}       // Delphi 7 compatible
  {$UNDEF fpc}
  {$DEFINE ver150}     // Version of Delphi
  {$smartlink on}
  {$LinkLib impRTL.a}
{$ENDIF}
unit RTL;

interface

uses SysUtils;

type
  TObject = class
  end;

  TClass = class of TObject;

  TRTL_FPC = class(TObject)
  public
    type TObject = class
    public
    end;

(*
    function  AnsiCompareStr (const s1: String; const s2: String): Integer;
    function  AnsiCompareText(const s1: String; const s2: String): Integer;

    function  AnsiExtractQuotedStr(var src: PChar; Quote: Char): String;

    function  AnsiLastChar (const s: String): PChar;
    function  AnsiLowerCase(const s: String): String;
    function  AnsiQuotedStr(const s: String; Quote: Char): String;

    function  AnsiStrComp  (s1: PChar; s2: PChar): Integer;
    function  AnsiStrIComp (s1: PChar; s2: PChar): Integer;
    function  AnsiStrLComp (s1: PChar; s2: PChar ; MaxLen : SizeUInt): Integer;
    function  AnsiStrLIComp(s1: PChar; s2: PChar ; MaxLen : SizeUInt): Integer;

    function  AnsiStrLastChar(str: PChar): PChar;
    
    function  AnsiStrLower(str: PChar): PChar;
    function  AnsiStrUpper(str: PChar): PChar;

    function  AnsiUpperCase(const s: String): String;

    procedure AppendStr(var dest: String; const s: String);
    procedure AssignStr(var p: PString; const s: String);

    function  CompareStr(const s1: String; const s2: String): Integer; overload;
    function  CompareStr(const s1: String; const s2: String; LocaleOptions: TLocaleOptions): Integer; overload;
    
    function  CompareText(const s1: String; const s2: String): Integer; overload;
    function  CompareText(const s1: String; const s2: String; LocaleOptions: TLocaleOptions): Integer; overload;

    procedure DisposeStr(s: PString); overload;
    procedure DisposeStr(s: PShortString); overload;

    function  IsValidIdent(const ident: String; AllowDots: Boolean = false; StrictDots: Boolean = false): Boolean;
    function  LastDelimiter(const Delimiters: String; const S: String): SizeInt;
    function  LeftStr(const s: String; Count: Integer): String;
    function  LoadStr(ident: Integer): String;

    function  LowerCase(const s: String): String; stdcall; overload;
    function  LowerCase(const s: String; LocaleOptions: TLocaleOptions): String; stdcall; overload;
    function  LowerCase(const v: Variant): String; stdcall; overload;
    function  LowerCase(const s: UnicodeString): UnicodeString; stdcall; overload;

    function  NewStr(const s: String): PString; stdcall;
    function  RightStr(const s: String; count: Integer): String; stdcall;
    function  StrAlloc(size: Cardinal): PChar; stdcall;

    function  StrBufSize(str: PChar): Cardinal; stdcall; overload;
    function  StrBufSize(str: PWideChar): Cardinal; stdcall; overload;

    procedure StrDispose(str: PChar); stdcall; overload;
    procedure StrDispose(str: PWideChar); stdcall; overload;

    function  StrPas(str: PChar): String; stdcall; overload;
    function  StrPas(str: PWideChar): UnicodeString; stdcall; overload;

    function  StrPCopy(dest: PChar; const Source: String): PChar; stdcall; overload;
    function  StrPCopy(dest: PWideChar; const Source: UnicodeString): PWideChar; stdcall; overload;

    function  StrPLCopy(dest: PChar; const Source: String; MaxLen: SizeUInt): PChar; stdcall; overload;
    function  StrPLCopy(dest: PWideChar; const Source: UnicodeString; MaxLen: SizeUInt): PWideChar; stdcall; overload;

    function  UpperCase(const s: String): String; stdcall; overload;
    function  UpperCase(const s: String; LocaleOptions: TLocaleOptions): String; stdcall; overload;
    function  UpperCase(const s: UnicodeString): UnicodeString; stdcall; overload;

    
    function  IntToHex(AValue: LongInt; digits: LongInt): String; stdcall; overload;
    function  IntToHex(AValue: Int64  ; digits: LongInt): String; stdcall; overload;
    function  IntToHex(AValue: QWord  ; digits: LongInt): String; stdcall; overload;

    function  IntToHex(AValue: Int8   ): String;  stdcall; overload;
    function  IntToHex(AValue: Int16  ): String;  stdcall; overload;
    function  IntToHex(AValue: Int32  ): String;  stdcall; overload;
    function  IntToHex(AValue: Int64  ): String;  stdcall; overload;
    
    function  IntToHex(AValue: UInt8  ): String;  stdcall; overload;
    function  IntToHex(AValue: UInt16 ): String;  stdcall; overload;
//  function  IntToHex(AValue: UInt32 ): String;  stdcall; overload;
    function  IntToHex(AValue: UInt64 ): String;  stdcall; overload;

    function  IntToStr(AValue: LongInt): String;  stdcall; overload;
    function  IntToStr(AValue: Int64  ): String;  stdcall; overload;
    function  IntToStr(AValue: QWord  ): String;  stdcall; overload;

    function  StrToInt(AValue: String ): LongInt; stdcall; overload;
    function  StrToInt(AValue: String ): Int64  ; stdcall; overload;
    function  StrToInt(AValue: String ): QWord  ; stdcall; overload;

    //constructor Create;
    //destructor Destroy;*)
  end;
var
  RTL: TRTL_FPC;

implementation

(*
const fpc_dll = 'fpc_dll.dll';

constructor TRTL_FPC.Create;
begin
  WriteLn('GGGGG');
end;

destructor TRTL_FPC.Destroy;
begin
end;*)

(*
function  RTL_AnsiCompareStr (const s1: String; const s2: String): Integer; stdcall; external fpc_dll name 'RTL_AnsiCompareStr';
function  RTL_AnsiCompareText(const s1: String; const s2: String): Integer; stdcall; external fpc_dll name 'RTL_AnsiCompareText';

function  RTL_AnsiExtractQuotedStr(var src: PChar; Quote: Char): String; stdcall; external fpc_dll name 'RTL_AnsiExtractQuotedStr';

function  RTL_AnsiLastChar (const s: String): PChar;  stdcall; external fpc_dll name 'RTL_AnsiLastChar';
function  RTL_AnsiLowerCase(const s: String): String; stdcall; external fpc_dll name 'RTL_AnsiLowerCase';

function  RTL_AnsiQuotedStr(const s: String; Quote: Char): String; stdcall; external fpc_dll name 'RTL_AnsiQuotedStr';

function  RTL_AnsiStrComp  (s1: PChar; s2: PChar): Integer; stdcall; external fpc_dll name 'RTL_AnsiStrComp';
function  RTL_AnsiStrIComp (s1: PChar; s2: PChar): Integer; stdcall; external fpc_dll name 'RTL_AnsiStrIComp';

function  RTL_AnsiStrLComp (s1: PChar; s2: PChar ; MaxLen : SizeUInt): Integer; stdcall; external fpc_dll name 'RTL_AnsiStrLComp';
function  RTL_AnsiStrLIComp(s1: PChar; s2: PChar ; MaxLen : SizeUInt): Integer; stdcall; external fpc_dll name 'RTL_AnsiStrLIComp';


function  RTL_AnsiStrLastChar(
    str: PChar): PChar; stdcall; external
    fpc_dll name 'RTL_AnsiStrLastChar';

function  RTL_AnsiStrLower(
    str: PChar): PChar; stdcall; external
    fpc_dll name 'RTL_AnsiStrLower';

function  RTL_AnsiStrUpper(
    str: PChar): PChar; stdcall; external
    fpc_dll name 'RTL_AnsiStrUpper';
    
function  RTL_AnsiUpperCase(
    const s: String): String; stdcall; external
    fpc_dll name 'RTL_AnsiUpperCase';

procedure RTL_AppendStr(
    var dest: String;
    const s: String); stdcall; external
    fpc_dll name 'RTL_AppendStr';

procedure RTL_AssignStr(
    var P: PString;
    const s: String); stdcall; external
    fpc_dll name 'RTL_AssignStr';

function  RTL_CompareStr_1(
    const s1: String;
    const s2: String): Integer; stdcall; external
    fpc_dll name 'RTL_CompareStr_1';
    
function  RTL_CompareStr_2(
    const s1: String;
    const s2: String;
    LocaleOptions: TLocaleOptions): Integer; stdcall; external
    fpc_dll name 'RTL_CompareStr_2';

function  RTL_CompareText_1(
    const s1: String;
    const s2: String): Integer; stdcall; external
    fpc_dll name 'RTL_CompareText_1';

function  RTL_CompareText_2(
    const s1: String;
    const s2: String;
    LocaleOptions: TLocaleOptions): Integer; stdcall; external
    fpc_dll name 'RTL_CompareText_2';

procedure RTL_DisposeStr_1(
    s: PString); stdcall; external
    fpc_dll name 'RTL_DisposeStr_1';
    
procedure RTL_DisposeStr_2(
    s: PShortString); stdcall; external
    fpc_dll name 'RTL_DisposeStr_2';

function  RTL_IsValidIdent(
    const ident: String;
    AllowDots: Boolean = false;
    StrictDots: Boolean = false): Boolean; stdcall; external
    fpc_dll name 'RTL_IsValidIdent';
    
function  RTL_LastDelimiter(
    const Delimiters: String;
    const s: String): SizeInt; stdcall; external
    fpc_dll name 'RTL_LastDelimiter';
    
function  RTL_LeftStr(
    const s: String;
    count: Integer): String; stdcall; external
    fpc_dll name 'RTL_LeftStr';
    
function  RTL_LoadStr(
    ident: Integer): String; stdcall; external
    fpc_dll name 'RTL_LoadStr';

function  RTL_LowerCase_1(
    const s: String): String; stdcall; external
    fpc_dll name 'RTL_LowerCase_1';

function  RTL_LowerCase_2(
    const s: String;
    LocaleOptions: TLocaleOptions): String; stdcall; external
    fpc_dll name 'RTL_LowerCase_2';

function  RTL_LowerCase_3(
    const v: Variant): String; stdcall; external
    fpc_dll name 'RTL_LowerCase_3';

function  RTL_LowerCase_4(
    const s: UnicodeString): UnicodeString; stdcall; external
    fpc_dll name 'RTL_LowerCase_4';

function  RTL_NewStr(
    const s: String): PString; stdcall; external
    fpc_dll name 'RTL_NewStr';

function  RTL_RightStr(
    const s: String;
    count: Integer): String; stdcall; external
    fpc_dll name 'RTL_RightStr';

function  RTL_StrAlloc(
    size: Cardinal): PChar; stdcall; external
    fpc_dll name 'RTL_StrAlloc';

function  RTL_StrBufSize_1(
    str: PChar): Cardinal; stdcall; external
    fpc_dll name 'RTL_StrBufSize_1';
    
function  RTL_StrBufSize_2(
    str: PWideChar): Cardinal; stdcall; external
    fpc_dll name 'RTL_StrBufSize_2';

procedure RTL_StrDispose_1(
    str: PChar); stdcall; external
    fpc_dll name 'RTL_StrDispose_1';
    
procedure RTL_StrDispose_2(
    str: PWideChar); stdcall; external
    fpc_dll name 'RTL_StrDispose_2';

function  RTL_StrPas_1(
    str: PChar): String; stdcall; external
    fpc_dll name 'RTL_StrPas_1';

function  RTL_StrPas_2(
    str: PWideChar): UnicodeString; stdcall; external
    fpc_dll name 'RTL_StrPas_2';

function  RTL_StrPCopy_1(
    dest: PChar;
    const Source: String): PChar; stdcall; external
    fpc_dll name 'RTL_StrPCopy_1';
    
function  RTL_StrPCopy_2(
    dest: PWideChar;
    const Source: UnicodeString): PWideChar; stdcall; external
    fpc_dll name 'RTL_StrPCopy_2';

function  RTL_StrPLCopy_1(
    dest: PChar;
    const Source: String;
    MaxLen: SizeUInt): PChar; stdcall; external
    fpc_dll name 'RTL_StrPLCopy_1';
    
function  RTL_StrPLCopy_2(
    dest: PWideChar;
    const Source: UnicodeString;
    MaxLen: SizeUInt): PWideChar; stdcall; external
    fpc_dll name 'RTL_StrPLCopy_2';

function  RTL_UpperCase_1(const s: String): String; stdcall; external fpc_dll name 'RTL_UpperCase_1';
function  RTL_UpperCase_2(const s: String; LocaleOptions: TLocaleOptions): String; stdcall; external fpc_dll name 'RTL_UpperCase_2';
function  RTL_UpperCase_3(const s: UnicodeString): UnicodeString; stdcall; external fpc_dll name 'RTL_UpperCase_3';


function  RTL_IntToStr_1 (AValue: LongInt): String;  stdcall; external fpc_dll name 'RTL_IntToStr_LongInt';
function  RTL_IntToStr_2 (AValue: Int64  ): String;  stdcall; external fpc_dll name 'RTL_IntToStr_Int64'  ;
function  RTL_IntToStr_3 (AValue: QWord  ): String;  stdcall; external fpc_dll name 'RTL_IntToStr_QWord'  ;

function  RTL_StrToInt_1 (AValue: String ): LongInt; stdcall; external fpc_dll name 'RTL_IntToStr_LongInt';
function  RTL_StrToInt_2 (AValue: String ): Int64  ; stdcall; external fpc_dll name 'RTL_IntToStr_Int64'  ;
function  RTL_StrToInt_3 (AValue: String ): QWord  ; stdcall; external fpc_dll name 'RTL_IntToStr_QWord'  ;

function  RTL_IntToHex_1 (AValue: LongInt; digits: Integer): String; stdcall; external fpc_dll name 'RTL_IntToHex_LongInt';
function  RTL_IntToHex_2 (AValue: Int64  ; digits: Integer): String; stdcall; external fpc_dll name 'RTL_IntToHex_Int64_A';
function  RTL_IntToHex_3 (AValue: QWord  ; digits: Integer): String; stdcall; external fpc_dll name 'RTL_IntToHex_QWord'  ;

function  RTL_IntToHex_4 (AValue: Int8   ): String; stdcall; external fpc_dll name 'RTL_IntToHex_Int8'   ;
function  RTL_IntToHex_5 (AValue: Int16  ): String; stdcall; external fpc_dll name 'RTL_IntToHex_Int16'  ;
function  RTL_IntToHex_6 (AValue: Int32  ): String; stdcall; external fpc_dll name 'RTL_IntToHex_Int32'  ;
function  RTL_IntToHex_B (AValue: Int64  ): String; stdcall; external fpc_dll name 'RTL_IntToHex_Int64_B';

function  RTL_IntToHex_8 (AValue: UInt8  ): String; stdcall; external fpc_dll name 'RTL_IntToHex_UInt8'  ;
function  RTL_IntToHex_9 (AValue: UInt16 ): String; stdcall; external fpc_dll name 'RTL_IntToHex_UInt16' ;
function  RTL_IntToHex_10(AValue: UInt32 ): String; stdcall; external fpc_dll name 'RTL_IntToHex_UInt32' ;
function  RTL_IntToHex_11(AValue: UInt64 ): String; stdcall; external fpc_dll name 'RTL_IntToHex_UInt64' ;

// -------------------------------
function  TRTL_FPC.AnsiCompareStr (const s1: String; const s2: String): Integer; begin result := RTL_AnsiCompareStr (s1,s2); end;
function  TRTL_FPC.AnsiCompareText(const s1: String; const s2: String): Integer; begin result := RTL_AnsiCompareText(s1,s2); end;

function  TRTL_FPC.AnsiExtractQuotedStr(var src: PChar; Quote: Char): String; begin result := RTL_AnsiExtractQuotedStr(src,Quote); end;

function  TRTL_FPC.AnsiLastChar   (const s: String): PChar;  begin result := RTL_AnsiLastChar (s); end;
function  TRTL_FPC.AnsiLowerCase  (const s: String): String; begin result := RTL_AnsiLowerCase(s); end;

function  TRTL_FPC.AnsiQuotedStr  (const s: String; Quote: Char): String; begin result := RTL_AnsiQuotedStr(s,Quote); end;

function  TRTL_FPC.AnsiStrComp  (s1: PChar; s2: PChar): Integer; begin result := RTL_AnsiStrComp (s1,s2); end;
function  TRTL_FPC.AnsiStrIComp (s1: PChar; s2: PChar): Integer; begin result := RTL_AnsiStrIComp(s1,s2); end;

function  TRTL_FPC.AnsiStrLComp (s1: PChar; s2: PChar; MaxLen: SizeUInt): Integer; begin result := RTL_AnsiStrLComp (s1,s2,MaxLen); end;
function  TRTL_FPC.AnsiStrLIComp(s1: PChar; s2: PChar; MaxLen: SizeUInt): Integer; begin result := RTL_AnsiStrLIComp(s1,s2,MaxLen); end;

function  TRTL_FPC.AnsiStrLastChar(str: PChar): PChar; begin result := RTL_AnsiStrLastChar(str); end;

function  TRTL_FPC.AnsiStrLower(
    str: PChar): PChar; stdcall;
    begin
    result := RTL_AnsiStrLower(str);
    end;
    
function  TRTL_FPC.AnsiStrUpper(
    str: PChar): PChar; stdcall;
    begin
    result := RTL_AnsiStrUpper(str);
    end;

function  TRTL_FPC.AnsiUpperCase(
    const s: String): String; stdcall;
    begin
    result := RTL_AnsiUpperCase(s);
    end;

procedure TRTL_FPC.AppendStr(
    var dest: String;
    const  s: String); stdcall;
    begin
    RTL_AppendStr(dest,s);
    end;
    
procedure TRTL_FPC.AssignStr(
    var   p: PString;
    const s: String); stdcall;
    begin
    RTL_AssignStr(p,s);
    end;

function  TRTL_FPC.CompareStr(
    const s1: String;
    const s2: String): Integer; stdcall;
    begin
    result := RTL_CompareStr_1(s1,s2);
    end;
    
function  TRTL_FPC.CompareStr(
    const s1: String;
    const s2: String;
    LocaleOptions: TLocaleOptions): Integer; stdcall;
    begin
    result := RTL_CompareStr_2(s1,s2,LocaleOptions);
    end;

function  TRTL_FPC.CompareText(
    const s1: String;
    const s2: String): Integer; stdcall;
    begin
    result := RTL_CompareText_1(s1,s2);
    end;
    
function  TRTL_FPC.CompareText(
    const s1: String;
    const s2: String;
    LocaleOptions: TLocaleOptions): Integer; stdcall;
    begin
    result := RTL_CompareText_2(s1,s2,LocaleOptions);
    end;

procedure TRTL_FPC.DisposeStr(
    s: PString); stdcall;
    begin
    RTL_DisposeStr_1(s);
    end;
    
procedure TRTL_FPC.DisposeStr(
    s: PShortString); stdcall;
    begin
    RTL_DisposeStr_2(s);
    end;

function  TRTL_FPC.IsValidIdent(
    const ident: String;
    AllowDots: Boolean = false;
    StrictDots: Boolean = false): Boolean; stdcall;
    begin
    result := RTL_IsValidIdent(ident,AllowDots,StrictDots);
    end;
    
function  TRTL_FPC.LastDelimiter(
    const Delimiters: String;
    const S: String): SizeInt; stdcall;
    begin
    result := RTL_LastDelimiter(Delimiters,s);
    end;
    
function  TRTL_FPC.LeftStr(
    const s: String;
    Count: Integer): String; stdcall;
    begin
    result := RTL_LeftStr(s,Count);
    end;
    
function  TRTL_FPC.LoadStr(
    ident: Integer): String; stdcall;
    begin
    result := RTL_LoadStr(ident);
    end;

function  TRTL_FPC.LowerCase(
    const s: String): String; stdcall;
    begin
    result := RTL_LowerCase_1(s);
    end;

function  TRTL_FPC.LowerCase(
    const s: String;
    LocaleOptions: TLocaleOptions): String; stdcall;
    begin
    result := RTL_LowerCase_2(s,LocaleOptions);
    end;

function  TRTL_FPC.LowerCase(
    const v: Variant): String; stdcall;
    begin
    result := RTL_LowerCase_3(v);
    end;

function  TRTL_FPC.LowerCase(
    const s: UnicodeString): UnicodeString; stdcall;
    begin
    result := RTL_LowerCase_4(s);
    end;

function  TRTL_FPC.NewStr(
    const s: String): PString; stdcall;
    begin
    result := RTL_NewStr(s);
    end;
    
function  TRTL_FPC.RightStr(
    const s: String; count: Integer): String; stdcall;
    begin
    result := RTL_RightStr(s,count);
    end;

function  TRTL_FPC.StrAlloc(
    size: Cardinal): PChar; stdcall;
    begin
    result := RTL_StrAlloc(size);
    end;

function  TRTL_FPC.StrBufSize(
    str: PChar): Cardinal; stdcall;
    begin
    result := RTL_StrBufSize_1(str);
    end;

function  TRTL_FPC.StrBufSize
    (str: PWideChar): Cardinal; stdcall;
    begin
    result := RTL_StrBufSize_2(str);
    end;

procedure TRTL_FPC.StrDispose(
    str: PChar); stdcall;
    begin
    RTL_StrDispose_1(str);
    end;

procedure TRTL_FPC.StrDispose(
    str: PWideChar); stdcall;
    begin
    RTL_StrDispose_2(str);
    end;

function  TRTL_FPC.StrPas(
    str: PChar): String; stdcall;
    begin
    result := RTL_StrPas_1(str);
    end;

function  TRTL_FPC.StrPas(
    str: PWideChar): UnicodeString; stdcall;
    begin
    result := RTL_StrPas_2(str);
    end;

function  TRTL_FPC.StrPCopy(
    dest: PChar;
    const Source: String): PChar; stdcall;
    begin
    result := RTL_StrPCopy_1(dest,Source);
    end;

function  TRTL_FPC.StrPCopy(
    dest: PWideChar;
    const Source: UnicodeString): PWideChar; stdcall;
    begin
    result := RTL_StrPCopy_2(dest,Source);
    end;

function  TRTL_FPC.StrPLCopy(
    dest: PChar;
    const Source: String;
    MaxLen: SizeUInt): PChar; stdcall;
    begin
    result := RTL_StrPLCopy_1(dest,Source,MaxLen);
    end;

function  TRTL_FPC.StrPLCopy(
    dest: PWideChar;
    const Source: UnicodeString;
    MaxLen: SizeUInt): PWideChar; stdcall;
    begin
    result := RTL_StrPLCopy_2(dest,Source,MaxLen);
    end;

function  TRTL_FPC.UpperCase(
    const s: String): String; stdcall;
    begin
    result := RTL_UpperCase_1(s);
    end;

function  TRTL_FPC.UpperCase(
    const s: String;
    LocaleOptions: TLocaleOptions): String; stdcall;
    begin
    result := RTL_UpperCase_2(s,LocaleOptions);
    end;

function  TRTL_FPC.UpperCase(
    const s: UnicodeString): UnicodeString; stdcall;
    begin
    result := RTL_UpperCase_3(s);
    end;


function TRTL_FPC.IntToStr(AValue: LongInt): String ; begin result := RTL_IntToStr_1(AValue); end;
function TRTL_FPC.IntToStr(AValue: Int64  ): String ; begin result := RTL_IntToStr_2(AValue); end;
function TRTL_FPC.IntToStr(AValue: QWord  ): String ; begin result := RTL_IntToStr_3(AValue); end;

function TRTL_FPC.StrToInt(AValue: String ): LongInt; begin result := RTL_StrToInt_1(AValue); end;
function TRTL_FPC.StrToInt(AValue: String ): Int64  ; begin result := RTL_StrToInt_2(AValue); end;
function TRTL_FPC.StrToInt(AValue: String ): QWord  ; begin result := RTL_StrToInt_3(AValue); end;

function TRTL_FPC.IntToHex(AValue: LongInt; digits: LongInt): String; begin result := RTL_IntToHex_1(AValue, digits); end;
function TRTL_FPC.IntToHex(AValue: Int64  ; digits: LongInt): String; begin result := RTL_IntToHex_2(AValue, digits); end;
function TRTL_FPC.IntToHex(AValue: QWord  ; digits: LongInt): String; begin result := RTL_IntToHex_3(AValue, digits); end;

function TRTL_FPC.IntToHex(AValue: Int8   ): String; begin result := RTL_IntToHex_4 (AValue); end;
function TRTL_FPC.IntToHex(AValue: Int16  ): String; begin result := RTL_IntToHex_5 (AValue); end;
function TRTL_FPC.IntToHex(AValue: Int32  ): String; begin result := RTL_IntToHex_6 (AValue); end;
function TRTL_FPC.IntToHex(AValue: Int64  ): String; begin result := RTL_IntToHex_B (AValue); end;

function TRTL_FPC.IntToHex(AValue: UInt8  ): String; begin result := RTL_IntToHex_8 (AValue); end;
function TRTL_FPC.IntToHex(AValue: UInt16 ): String; begin result := RTL_IntToHex_9 (AValue); end;
function TRTL_FPC.IntToHex(AValue: UInt32 ): String; begin result := RTL_IntToHex_10(AValue); end;
function TRTL_FPC.IntToHex(AValue: UInt64 ): String; begin result := RTL_IntToHex_11(AValue); end;
*)

(*
initialization
RTL := TRTL_FPC.Create;

finalization
RTL.Free;*)

end.
