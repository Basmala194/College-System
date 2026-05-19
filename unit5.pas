unit Unit5;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, DB, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private

  public

  end;

var
  Form5: TForm5;

implementation
uses Unit2;
{$R *.lfm}

{ TForm5 }

procedure TForm5.Label2Click(Sender: TObject);
begin

end;

procedure TForm5.FormShow(Sender: TObject);
begin
  Form2.hide;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  Form2.show;
  Form5.hide;
end;

end.

