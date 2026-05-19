unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, SQLite3Conn, DB, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
uses Unit2;
{$R *.lfm}

{ TForm1 }

procedure TForm1.Edit2Change(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin

  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Text := 'SELECT * FROM Employees WHERE Username = :User AND Password = :Pass';


  SQLQuery1.Params.ParamByName('User').AsString := Edit1.Text;
  SQLQuery1.Params.ParamByName('Pass').AsString := Edit2.Text;


  SQLQuery1.Open;


  if not SQLQuery1.EOF then
  begin
    Form2.Show;
    Form1.Hide;
  end
  else
  begin

    ShowMessage('Sorry! Wrong Username or Password, Try again!');
  end;
end;

procedure TForm1.Label2Click(Sender: TObject);
begin

end;

end.

