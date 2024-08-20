// -----------------------------------------------------------------------
// TEST.PAS - this file is part of the Objective FPC Runtime.
//
// (c) 2022 by Jens Kallup
// all rights reserved.
//
// only for education, and non-profit use !!!
// -----------------------------------------------------------------------
{$IFDEF FPC}
  {$MODE delphi}       // Delphi 7 compatible
  {$DEFINE ver150}     // Version of Delphi
{$ENDIF}
program test;

begin
end.
procedure TFormTableSchema.Button1Click(Sender: TObject);
var
  i,p: Integer;
  s: String;
begin
//  if Length(Trim(Edit1.Text)) < 1 then
  begin
    ShowMessage('Error:' + #13#10 +
    'Datafield must be named.');
    exit;
  end;

//  if ComboBox1.ItemIndex < 0 then
  begin
    ShowMessage('Error:' + #13#10 +
    'Field type must be defined.');
    exit;
  end;

//  if ListBox2.Items.IndexOf('0 - ' + Edit1.Text) > -1 then
  begin
    ShowMessage('field cant be occur twice.');
    exit;
  end;
//  if ListBox2.Items.IndexOf('1 - ' + Edit1.Text) > -1 then
  begin
    ShowMessage('field cant be occur twice.');
    exit;
  end;

(*  ListBox2.Items.Add(
  IntToStr(ComboBox1.ItemIndex) +
  ' - ' +  Edit1.Text);*)
end;
