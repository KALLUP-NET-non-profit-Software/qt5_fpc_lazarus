// -----------------------------------------------------------------------
// FPC_RTL.PAS - this file is part of the Objective FPC Runtime.
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
{$ENDIF}
unit fpc_rtl;

interface

uses SysUtils;

(*
function  RTL_AnsiCompareStr (const s1: String; const s2: String): Integer;
function  RTL_AnsiCompareText(const s1: String; const s2: String): Integer;

function  RTL_AnsiExtractQuotedStr(var src: PChar; Quote: Char): String;

function  RTL_AnsiLastChar (const s: String): PChar;
function  RTL_AnsiLowerCase(const s: String): String;
function  RTL_AnsiQuotedStr(const s: String; Quote: Char): String;

function  RTL_AnsiStrComp  (s1: PChar; s2: PChar): Integer;
function  RTL_AnsiStrIComp (s1: PChar; s2: PChar): Integer;
function  RTL_AnsiStrLComp (s1: PChar; s2: PChar ; MaxLen : SizeUInt): Integer;
function  RTL_AnsiStrLIComp(s1: PChar; s2: PChar ; MaxLen : SizeUInt): Integer;

function  RTL_AnsiStrLastChar(str: PChar): PChar;

function  RTL_AnsiStrLower(str: PChar): PChar; stdcall;
function  RTL_AnsiStrUpper(str: PChar): PChar; stdcall;

function  RTL_AnsiUpperCase(const s: String): String; stdcall;

procedure RTL_AppendStr(var dest: String; const s: String); stdcall;
procedure RTL_AssignStr(var p: PString; const s: String); stdcall;

function  RTL_CompareStr_1(const s1: String; const s2: String): Integer; stdcall;
function  RTL_CompareStr_2(const s1: String; const s2: String; LocaleOptions: SysUtils.TLocaleOptions): Integer; stdcall;

function  RTL_CompareText_1(const s1: String; const s2: String): Integer; stdcall;
function  RTL_CompareText_2(const s1: String; const s2: String; LocaleOptions: SysUtils.TLocaleOptions): Integer; stdcall;

procedure RTL_DisposeStr_1(s: PString); stdcall;
procedure RTL_DisposeStr_2(s: PShortString); stdcall;

function  RTL_IsValidIdent(const ident: String; AllowDots: Boolean = false; StrictDots: Boolean = false): Boolean; stdcall;
function  RTL_LastDelimiter(const Delimiters: String; const S: String): SizeInt; stdcall;
function  RTL_LeftStr(const s: String; Count: Integer): String; stdcall;
function  RTL_LoadStr(ident: Integer): String; stdcall;

function  RTL_LowerCase_1(const s: String): String; stdcall;
function  RTL_LowerCase_2(const s: String; LocaleOptions: SysUtils.TLocaleOptions): String; stdcall;
function  RTL_LowerCase_3(const v: Variant): String; stdcall;
function  RTL_LowerCase_4(const s: UnicodeString): UnicodeString; stdcall;

function  RTL_NewStr(const s: String): PString; stdcall;
function  RTL_RightStr(const s: String; count: Integer): String; stdcall;
function  RTL_StrAlloc(size: Cardinal): PChar; stdcall;

function  RTL_StrBufSize_1(str: PChar): Cardinal; stdcall;
function  RTL_StrBufSize_2(str: PWideChar): Cardinal; stdcall;

procedure RTL_StrDispose_1(str: PChar); stdcall;
procedure RTL_StrDispose_2(str: PWideChar); stdcall;

function  RTL_StrPas_1(str: PChar): String; stdcall;
function  RTL_StrPas_2(str: PWideChar): UnicodeString; stdcall;

function  RTL_StrPCopy_1(dest: PChar; const Source: String): PChar; stdcall;
function  RTL_StrPCopy_2(dest: PWideChar; const Source: UnicodeString): PWideChar; stdcall;

function  RTL_StrPLCopy_1(dest: PChar; const Source: String; MaxLen: SizeUInt): PChar; stdcall;
function  RTL_StrPLCopy_2(dest: PWideChar; const Source: UnicodeString; MaxLen: SizeUInt): PWideChar; stdcall;

function  RTL_UpperCase_1(const s: String): String; stdcall;
function  RTL_UpperCase_2(const s: String; LocaleOptions: SysUtils.TLocaleOptions): String; stdcall;
function  RTL_UpperCase_3(const s: UnicodeString): UnicodeString; stdcall;


function  RTL_IntToStr_LongInt(AValue: LongInt): String;  stdcall; export;
function  RTL_IntToStr_Int64  (AValue: Int64  ): String;  stdcall; export;
function  RTL_IntToStr_QWord  (AValue: QWord  ): String;  stdcall; export;

function  RTL_StrToInt_LongInt(AValue: String ): LongInt; stdcall; export;
function  RTL_StrToInt_Int64  (AValue: String ): Int64  ; stdcall; export;
function  RTL_StrToInt_QWord  (AValue: String ): QWord  ; stdcall; export;

function  RTL_IntToHex_LongInt(AValue: LongInt; digits: Integer): String; stdcall; export;
function  RTL_IntToHex_Int64_A(AValue: Int64  ; digits: Integer): String; stdcall; export;
function  RTL_IntToHex_QWord  (AValue: QWord  ; digits: Integer): String; stdcall; export;

function  RTL_IntToHex_Int8   (AValue: Int8   ): String; stdcall; export;
function  RTL_IntToHex_Int16  (AValue: Int16  ): String; stdcall; export;
function  RTL_IntToHex_Int32  (AValue: Int32  ): String; stdcall; export;
function  RTL_IntToHex_Int64_B(AValue: Int64  ): String; stdcall; export;

function  RTL_IntToHex_UInt8  (AValue: UInt8  ): String; stdcall; export;
function  RTL_IntToHex_Uint16 (AValue: UInt16 ): String; stdcall; export;
function  RTL_IntToHex_Uint32 (AValue: UInt32 ): String; stdcall; export;
function  RTL_IntToHex_Uint64 (AValue: UInt64 ): String; stdcall; export;
*)

implementation

(*
const funcs_dll = 'fpc_dll.dll';
function  AnsiCompareStr (const s1: String; const s2: String): Integer; stdcall; external funcs_dll name 'AnsiCompareStr';


function  RTL_AnsiCompareStr(
    const S1: String;
    const S2: String): Integer; stdcall;
    begin
    result := AnsiCompareStr(S1,S2);
    end;

function  RTL_AnsiCompareText(
    const s1: String;
    const s2: String): Integer; stdcall;
    begin
    result := AnsiCompareText(s1,s2);
    end;

function  RTL_AnsiExtractQuotedStr(
    var src: PChar;
    Quote: Char): String; stdcall;
    begin
    result := AnsiExtractQuotedStr(src,Quote);
    end;

function  RTL_AnsiLastChar(
    const s: String): PChar; stdcall;
    begin
    result := AnsiLastChar(s);
    end;
function  RTL_AnsiLowerCase(
    const s: String): String; stdcall;
    begin
    result := AnsiLowerCase(s);
    end;

function  RTL_AnsiQuotedStr(
    const s: String;
    Quote: Char): String; stdcall;
    begin
    result := AnsiQuotedStr(s,Quote);
    end;

function  RTL_AnsiStrComp(
    s1: PChar;
    s2: PChar): Integer; stdcall;
    begin
    result := AnsiStrComp(s1,s2);
    end;
function  RTL_AnsiStrIComp(
    s1: PChar;
    s2: PChar): Integer; stdcall;
    begin
    result := AnsiStrIComp(s1,s2);
    end;

function  RTL_AnsiStrLComp(
    s1: PChar;
    s2: PChar;
    MaxLen: SizeUInt): Integer; stdcall;
    begin
    result := AnsiStrLComp(s1,s2,MaxLen);
    end;
function  RTL_AnsiStrLIComp(
    s1: PChar;
    s2: PChar;
    MaxLen: SizeUInt): Integer; stdcall;
    begin
    result := AnsiStrLIComp(s1,s2,MaxLen);
    end;

function  RTL_AnsiStrLastChar(
    str: PChar): PChar; stdcall;
    begin
    result := AnsiStrLastChar(str);
    end;

function  RTL_AnsiStrLower(
    str: PChar): PChar; stdcall;
    begin
    result := AnsiStrLower(str);
    end;

function  RTL_AnsiStrUpper(
    str: PChar): PChar; stdcall;
    begin
    result := AnsiStrUpper(str);
    end;

function  RTL_AnsiUpperCase(
    const s: String): String; stdcall;
    begin
    result := AnsiUpperCase(s);
    end;

procedure RTL_AppendStr(
    var dest: String;
    const s: String); stdcall;
    begin
    AppendStr(dest,s);
    end;
procedure RTL_AssignStr(
    var p: PString;
    const s: String); stdcall;
    begin
    AssignStr(p,s);
    end;

function  RTL_CompareStr_1(
    const s1: String;
    const s2: String): Integer; stdcall;
    begin
    result := CompareStr(s1,s2);
    end;
function  RTL_CompareStr_2(
    const s1: String;
    const s2: String;
    LocaleOptions: SysUtils.TLocaleOptions): Integer; stdcall;
    begin
    result := CompareStr(s1,s2,LocaleOptions);
    end;

function  RTL_CompareText_1(
    const s1: String;
    const s2: String): Integer; stdcall;
    begin
    result := CompareText(s1,s2);
    end;
function  RTL_CompareText_2(
    const s1: String;
    const s2: String;
    LocaleOptions: SysUtils.TLocaleOptions): Integer; stdcall;
    begin
    result := CompareText(s1,s2,LocaleOptions);
    end;

procedure RTL_DisposeStr_1(
    s: PString); stdcall;
    begin
    DisposeStr(s);
    end;
procedure RTL_DisposeStr_2(
    S: PShortString); stdcall;
    begin
    DisposeStr(s);
    end;

function  RTL_IsValidIdent(
    const Ident: string;
    AllowDots  : Boolean = False;
    StrictDots : Boolean = False): Boolean;  stdcall;
    begin
    result := IsValidIdent(ident,AllowDots,StrictDots);
    end;

function  RTL_LastDelimiter(
    const Delimiters: string;
    const S: string): SizeInt;  stdcall;
    begin
    result := LastDelimiter(Delimiters,s);
    end;

function  RTL_LeftStr(
    const S: string;
    Count  : Integer): String; stdcall;
    begin
    result := LeftStr(s,count);
    end;

function  RTL_LoadStr(
    Ident: Integer): String; stdcall;
    begin
    result := LoadStr(ident);
    end;

function  RTL_LowerCase_1(
    const s: string): String; stdcall;
    begin
    result := LowerCase(s);
    end;

function  RTL_LowerCase_2(
    const s: string;
    LocaleOptions: SysUtils.TLocaleOptions): String; stdcall;
    begin
    result := LowerCase(s);
    end;

function  RTL_LowerCase_3(
    const v: Variant): String; stdcall;
    begin
    result := LowerCase(v);
    end;

function  RTL_LowerCase_4(
    const s: UnicodeString): UnicodeString; stdcall;
    begin
    result := LowerCase(s);
    end;

function  RTL_NewStr(
    const S: string): PString;  stdcall;
    begin
    result := NewStr(s);
    end;

function  RTL_RightStr(
    const  S: string;
    count: Integer): String; stdcall;
    begin
    result := RightStr(s,count);
    end;

function  RTL_StrAlloc(
    size: Cardinal): PChar; stdcall;
    begin
    result := StrAlloc(size);
    end;

function  RTL_StrBufSize_1(
    str: PChar): Cardinal; stdcall;
    begin
    result := StrBufSize(str);
    end;

function  RTL_StrBufSize_2(
    str: PWideChar): Cardinal; stdcall;
    begin
    result := StrBufSize(str);
    end;

procedure RTL_StrDispose_1(
    str: PChar); stdcall;
    begin
    StrDispose(str);
    end;
procedure RTL_StrDispose_2(
    str: PWideChar); stdcall;
    begin
    StrDispose(str);
    end;

function  RTL_StrPas_1(
    str: PChar): String; stdcall;
    begin
    result := StrPas(str);
    end;
function  RTL_StrPas_2(
    str: PWideChar): UnicodeString; stdcall;
    begin
    result := StrPas(str);
    end;

function  RTL_StrPCopy_1(
    dest: PChar;
    const Source: String): PChar; stdcall;
    begin
    result := StrPCopy(dest,source);
    end;
function  RTL_StrPCopy_2(
    dest: PWideChar;
    const Source: UnicodeString): PWideChar; stdcall;
    begin
    result := StrPCopy(dest,source);
    end;

function  RTL_StrPLCopy_1(
    dest: PChar;
    const Source: String;
    MaxLen: SizeUInt): PChar; stdcall;
    begin
    result := StrPLCopy(dest,Source,MaxLen);
    end;
function  RTL_StrPLCopy_2(
    dest: PWideChar;
    const Source: UnicodeString;
    MaxLen: SizeUInt): PWideChar; stdcall;
    begin
    result := StrPLCopy(dest,Source,MaxLen);
    end;

function  RTL_UpperCase_1(
    const s: String): String; stdcall;
    begin
    result := UpperCase(s);
    end;
function  RTL_UpperCase_2(
    const s: String;
    LocaleOptions: SysUtils.TLocaleOptions): String; stdcall;
    begin
    result := UpperCase(s,LocaleOptions);
    end;
function  RTL_UpperCase_3(
    const s: UnicodeString): UnicodeString; stdcall;
    begin
    result := UpperCase(s);
    end;


function  RTL_IntToStr_LongInt(AValue: LongInt): String;  stdcall; begin result := IntToStr(AValue); end;
function  RTL_IntToStr_Int64  (AValue: Int64  ): String;  stdcall; begin result := IntToStr(AValue); end;
function  RTL_IntToStr_QWord  (AValue: QWord  ): String;  stdcall; begin result := IntToStr(AValue); end;

function  RTL_StrToInt_LongInt(AValue: String ): LongInt; stdcall; begin result := StrToInt(AValue); end;
function  RTL_StrToInt_Int64  (AValue: String ): Int64  ; stdcall; begin result := StrToInt(AValue); end;
function  RTL_StrToInt_QWord  (AValue: String ): QWord  ; stdcall; begin result := StrToInt(AValue); end;


function  RTL_IntToHex_LongInt(AValue: LongInt; digits: Integer): String; stdcall; begin result := IntToHex(AValue, digits); end;
function  RTL_IntToHex_Int64_A(AValue: Int64  ; digits: Integer): String; stdcall; begin result := IntToHex(AValue, digits); end;
function  RTL_IntToHex_QWord  (AValue: QWord  ; digits: Integer): String; stdcall; begin result := IntToHex(AValue, digits); end;

function  RTL_IntToHex_Int8   (AValue: Int8   ): String; stdcall; begin result := IntToHex(AValue,1); end;
function  RTL_IntToHex_Int16  (AValue: Int16  ): String; stdcall; begin result := IntToHex(AValue,2); end;
function  RTL_IntToHex_Int32  (AValue: Int32  ): String; stdcall; begin result := IntToHex(AValue,4); end;
function  RTL_IntToHex_Int64_B(AValue: Int64  ): String; stdcall; begin result := IntToHex(AValue,8); end;

function  RTL_IntToHex_UInt8  (AValue: UInt8  ): String; stdcall; begin result := IntToHex(AValue,1); end;
function  RTL_IntToHex_Uint16 (AValue: UInt16 ): String; stdcall; begin result := IntToHex(AValue,2); end;
function  RTL_IntToHex_Uint32 (AValue: UInt32 ): String; stdcall; begin result := IntToHex(AValue,4); end;
function  RTL_IntToHex_Uint64 (AValue: UInt64 ): String; stdcall; begin result := IntToHex(AValue,8); end;
*)

end.
