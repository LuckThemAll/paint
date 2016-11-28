unit UParameters;

{$mode objfpc}{$H+}

interface

uses
  Classes, math, Controls, SysUtils, UFigures, Graphics, UScale, StdCtrls,
  ExtCtrls, LCLClasses, Spin;

type

  TChange = procedure(Sender: TObject) of Object;

  TParameter = class
    FLabel: TLabel;
    FComponent: TControl;
  end;

  { TBorderWidthParameter }

  TBorderWidthParameter = class(TParameter)
    constructor Create(AChange: TChange);
  end;

  { TBorderStyleParameter }

  TBorderStyleParameter = class(TParameter)
    constructor Create(AChange: TChange);
  end;

  { TBrushStyleParameter }

  TBrushStyleParameter = class(TParameter)
    constructor Create(AChange: TChange);
  end;

  { TNumberOfAnglesParameter }

  TNumberOfAnglesParameter = class(TParameter)
    constructor Create(AChange: TChange);
  end;

  { TZoomParameter }

  TZoomParameter = class(TParameter)
    constructor Create(AChange: TChange);
  end;

implementation

constructor TBorderWidthParameter.Create(AChange: TChange);
begin
  FLabel := TLabel.Create(Nil);
  FLabel.Caption := 'Толщина линии';
  FComponent := TSpinEdit.Create(nil);
  with FComponent as TSpinEdit do begin
    MaxValue := 500;
    MinValue := 1;
    Value := 1;
    Width := 60;
    Left:= 0;
    OnChange := AChange;
  end;
end;

constructor TBorderStyleParameter.Create(AChange: TChange);
begin
  FLabel := TLabel.Create(Nil);
  FLabel.Caption := 'Стиль линии';
  FComponent := TComboBox.Create(nil);
  with FComponent as TComboBox do begin
    Items.Add('─────');
    Items.Add('─ ─ ─ ─ ─');
    Items.Add('• • • • • • • • •');
    Items.Add('─ • ─ • ─ •');
    Items.Add('─ • • ─ • •');
    AutoComplete := False;
    ItemIndex := 0;
    Width := 97;
    Left:= 0;
    OnChange := AChange;
  end;
end;

constructor TBrushStyleParameter.Create(AChange: TChange);
begin
  FLabel := TLabel.Create(Nil);
  FLabel.Caption := 'Стиль заливки';
  FComponent := TComboBox.Create(nil);
  with FComponent as TComboBox do begin
    Items.Add('Сплошная');
    Items.Add('Без заливки');
    Items.Add('Горизонтальная');
    Items.Add('Вертикальная');
    Items.Add('Диагональная 1');
    Items.Add('Диагональная 2');
    Items.Add('Крестом');
    Items.Add('Наклонным крестом');
    Width := 97;
    ItemIndex := 0;
    OnChange := AChange;
  end;
end;

constructor TNumberOfAnglesParameter.Create(AChange: TChange);
begin
  FLabel := TLabel.Create(Nil);
  FLabel.Caption := 'Количество углов';
  FComponent := TSpinEdit.Create(nil);
  with FComponent as TSpinEdit do begin
    MaxValue := 15;
    MinValue := 3;
    Value := 3;
    Width := 60;
    OnChange := AChange;
  end;
end;

constructor TZoomParameter.Create(AChange: TChange);
begin
  FLabel := TLabel.Create(Nil);
  FLabel.Caption := 'Вид лупы';
  FComponent := TComboBox.Create(nil);
  with FComponent as TComboBox do begin
    Items.Add('Приблизить');
    Items.Add('Отдалить');
    Items.Add('Выделение области');
    Width := 97;
    OnChange := AChange;
  end;
end;


end.

