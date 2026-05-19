unit Unit4;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, DB, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBGrids;

type

  { TForm4 }

  TForm4 = class(TForm)
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
  private

  public

  end;

var
  Form4: TForm4;

implementation
uses Unit1, Unit2;
{$R *.lfm}

{ TForm4 }

procedure TForm4.FormShow(Sender: TObject);
begin

  SQLQuery1.Database := Form1.SQLConnector1;
  SQLQuery1.Transaction := Form1.SQLTransaction1;

  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'SELECT CourseID, CAST(CourseName AS VARCHAR(100)) AS CourseName FROM Courses';
  SQLQuery1.Open;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin

  Form1.SQLQuery1.Close;
  Form1.SQLQuery1.SQL.Text := 'INSERT INTO Courses (CourseID, CourseName) VALUES (:id, :name)';


  Form1.SQLQuery1.Params.ParamByName('id').AsInteger := StrToInt(Edit2.Text);
  Form1.SQLQuery1.Params.ParamByName('name').AsString := Edit1.Text;


  Form1.SQLQuery1.ExecSQL;
  Form1.SQLTransaction1.Commit;


  SQLQuery1.Close;
  SQLQuery1.Open;

  ShowMessage('Course added successfully!');
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  Form2.Show;
  Form4.Hide;
end;

end.

