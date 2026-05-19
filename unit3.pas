unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBGrids;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SQLQuery1: TSQLQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;

implementation
uses Unit1, Unit2;
{$R *.lfm}

{ TForm3 }

procedure TForm3.Label2Click(Sender: TObject);
begin

end;

procedure TForm3.FormShow(Sender: TObject);
begin
  SQLQuery1.Database := Form1.SQLConnector1;
  SQLQuery1.Transaction := Form1.SQLTransaction1;

  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Text := 'SELECT StudentID, CAST(StudentName AS VARCHAR(100)) AS StudentName FROM Students';
  SQLQuery1.Open;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin

  Form1.SQLQuery1.Close;
  Form1.SQLQuery1.SQL.Text := 'INSERT INTO Students (StudentID, StudentName) VALUES (:id, :name)';


  Form1.SQLQuery1.Params.ParamByName('id').AsInteger := StrToInt(Edit2.Text);
  Form1.SQLQuery1.Params.ParamByName('name').AsString := Edit1.Text;


  Form1.SQLQuery1.ExecSQL;
  Form1.SQLTransaction1.Commit;


  SQLQuery1.Close;
  SQLQuery1.Open;

  ShowMessage('Student added successfully!');
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Form2.Show;
  Form3.Hide;
end;

end.

