unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    debug: TLabel;
    debug_bullet: TLabel;
    Image1: TImage;
    loses: TLabel;
    messagemissed: TLabel;
    shoot: TButton;
    foreground: TScrollBox;
    procedure shootClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  bullet: integer;
  bullets: integer;
  chamber: integer;
  missed: integer;
  _loses: integer;
  text1: string;
  text2: string;
  started: boolean;

implementation

{$R *.lfm}

{ TForm1 }

procedure Initialize();
begin
  bullet := 1;
  bullets := 6;
  chamber := (random(bullets - 1) + 1);
  missed := 0;
  text1 := 'Missed: ';
  text2 := 'Loses: ';
  started := True;
end;

procedure TForm1.shootClick(Sender: TObject);
begin
    if started <> True then
    begin
      _loses := 0;
      Initialize();
      debug.Caption := chamber.ToString();
    end;
    if bullet = chamber then
    // dead
    begin
      _loses := _loses + 1;
      loses.Caption := text2+_loses.ToString();
      missed := 0;
      messagemissed.Caption := text1+missed.ToString();
      Initialize();
      debug.Caption := chamber.ToString();
      ShowMessage('You Lost!');
    end
    else
    begin
      debug_bullet.Caption := bullet.ToString();
      missed := missed + 1;
      bullet := bullet + 1;
      messagemissed.Caption := text1+missed.ToString();
      if bullet > bullets then
      bullet := 1;
    end;
end;

end.

