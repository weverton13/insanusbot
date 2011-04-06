unit TextUtils;

interface

uses Windows, Classes;

procedure Split (const Delimiter: Char; Input: string; const Strings: TStrings);

implementation

procedure Split (const Delimiter: Char; Input: string; const Strings: TStrings);
begin
   Assert(Assigned(Strings)) ;
   Strings.Clear;
   Strings.Delimiter := Delimiter;
   Strings.DelimitedText := Input;
end;

end.
